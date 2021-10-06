package com.yj.yeogiya.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.yj.yeogiya.controller.BoardController;
import com.yj.yeogiya.model.dao.BoardDao;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardPlace;
import com.yj.yeogiya.model.vo.BoardSearch;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;



@Service
public class BoardServiceImpl implements BoardService {
	@Value("#{property['file.rootPath']}") 
	public String rootPath;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDao boardDao;

	@Override
	public List<Sort> selectSortLocal() {
		return boardDao.selectSortLocal();
	}

	@Override
	public List<Sort> selectSortPlace() {
		return boardDao.selectSortPlace();
	}

	@Override
	public List<Sort> selectSortBoard() {
		return boardDao.selectSortBoard();
	}

	@Override
	public Sort selectSortLocalPByEngName(String eng_name) {
		return boardDao.selectSortLocalPByEngName(eng_name);
	}
	
	@Transactional
	@Override
	public int insertBoardArticle(Board board) {
//		logger.info("insertBoardArticle");
		int result = 0; 
		// 1. board
		String query = "sortBoard=" + board.getSort_board()
		+ "&subLocal=" +board.getSub_local();
		if(board.getSort_place() != null) {
			query += "&sortPlace=" + board.getSort_place();
		}
		board.setQuery(query);
		
		int board_no = boardDao.insertBoard(board);
		
		if (board_no > 0) {
			// 2. tag 
			String tag = board.getTag(); // "콤마로 연결되어 있는 상태"
			if(tag != null && tag.trim() != "") {
//				System.out.println("태그 있음");
				String[] tags = tag.split(",");
				List<BoardTag> tagList = new ArrayList<BoardTag>();
				for (String splittedTag : tags) {
					BoardTag boardTag = new BoardTag(board_no, splittedTag);
					tagList.add(boardTag);
				}
				boardDao.insertTag(tagList);
				result = boardDao.insertBoardTag(tagList);
				if(result == tags.length) {
					result = board_no;
				}
			} else {
//				System.out.println("태그 없음");
				result = board_no;
			}
			
			// 3. place 
			BoardPlace place = board.getPlace();
			if (board.getSort_place() != null) {
//				System.out.println("장소 있음");
				place.setBoard_no(board_no);
				place.setSort_place(board.getSort_place());
				place.setSort_local(board.getSort_local());
				place.setSub_local(board.getSub_local());
				boardDao.insertPlace(place);
				result = boardDao.insertBoardPlace(place);
				if (result == 1) {
					result = board_no;
				}
			} else {
//				System.out.println("장소 없음");
				result = board_no;
			}
			
			// 3. img
			List<BoardImg> imgList = new ArrayList<BoardImg>();

			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			
			String board_content = board.getBoard_content();
			Matcher matcher = pattern.matcher(board_content);
			
			String src = null;
			String img_path = null;
			String img_name = null;
			while (matcher.find()) {
				src = matcher.group(1);
				img_path = rootPath + "/" + src;
				img_name = src.substring(src.lastIndexOf("/") + 1);
				BoardImg img = new BoardImg(board_no, img_path, img_name);
				imgList.add(img);
			}
			
			// 서버에는 안올라갔는데 태그인척하는 img있는거 대비 has_img까지 체크 
			// -> has_img는 프론트에서 점검했던거
			if (!imgList.isEmpty() && board.getHas_img().equals("Y")) {
//				System.out.println("이미지 있음");
				result = boardDao.insertBoardImg(imgList);
				if (result == imgList.size()) {
					result = board_no;
				}
			} else {
//				System.out.println("이미지 없음");
				result = board_no;
			}
			
		}
			
		return result;
	}
	
	@Transactional
	@Override
	public Board selectBoardArticle(String login_id, int board_no, boolean isUpdate) {
//		logger.info("selectBoardArticle");
		if (!isUpdate) {
			boardDao.updateViewCnt(board_no);
		}
		Board board = boardDao.selectBoard(login_id, board_no);
		BoardPlace place = boardDao.selectBoardPlace(board_no);
		List<BoardTag> tagList = boardDao.selectBoardTag(board_no);
//		System.out.println("board:" + board);
		board.setPlace(place);
		board.setTagList(tagList);
		Gson gson = new Gson();
		board.setJsonTagList(gson.toJson(tagList));
		return board;
	}
	
	@Transactional
	@Override
	public int updateBoardArticle(Board board) {
//		logger.info("updateBoardArticle");
		int board_no = board.getBoard_no();
		
		// 1. board
		String query = "sortBoard=" + board.getSort_board()
		+ "&subLocal=" +board.getSub_local();
		if(board.getSort_place() != null) {
			query += "&sortPlace=" + board.getSort_place();
		}
		board.setQuery(query);
		int result = boardDao.updateBoard(board);
		
		if (result > 0) {
			// 2. tag 
			List<BoardTag> oldTagList = boardDao.selectBoardTag(board_no);
			
			if(!oldTagList.isEmpty()) { 
//				System.out.println("삭제할 태그 있음 = 기존 태그 존재");
				result = boardDao.deleteBoardTag(oldTagList);
				
				if(result != oldTagList.size()) {
//					System.out.println("기존태그 삭제 제대로 안됨");
					result = 0;
				}
//				System.out.println("기존태그 삭제 제대로 됨");
			}
			else {
//				System.out.println("삭제할 태그 없음 = 기존 태그 없음");
			}
			
			String tag = board.getTag(); // "콤마로 연결되어 있는 상태"
			if(tag != null && tag.trim() != "") {
//				System.out.println("새로운 태그 있음");
				String[] tags = tag.split(",");
				List<BoardTag> tagList = new ArrayList<BoardTag>();
				for (String splittedTag : tags) {
					BoardTag boardTag = new BoardTag(board_no, splittedTag);
					tagList.add(boardTag);
				}
				boardDao.insertTag(tagList);
				result = boardDao.insertBoardTag(tagList);
				
				if(result != tags.length) {
//					System.out.println("새로운 태그 insert 문제 생김");
					result = 0;
				}
			} 
			else {
//				System.out.println("새로운 태그 없음");
			}
			
			// 3. place 
			BoardPlace place = board.getPlace();
			if (board.getSort_place() != null) {
				System.out.println("장소 있음");
				place.setBoard_no(board_no);
				place.setSort_place(board.getSort_place());
				place.setSort_local(board.getSort_local());
				place.setSub_local(board.getSub_local());
				boardDao.insertPlace(place);
				result = boardDao.updateBoardPlace(place);
				if (result != 1) {
//					System.out.println("장소 업데이트 실패");
					result = 0;
				}
			} 
			else {
//				System.out.println("장소 없음");
			}
			
			
			// 4. img
			List<BoardImg> oldImgList = boardDao.selectBoardImg(board_no);
			
			if(!oldImgList.isEmpty()) { 
//				System.out.println("삭제할 이미지 있음 = 기존 이미지 존재");
				result = boardDao.deleteBoardImg(board_no);
				
				if(result != oldImgList.size()) {
//					System.out.println("기존이미지 삭제 제대로 안됨");
					result = 0;
				} 
//				System.out.println("기존이미지 삭제 제대로 됨");
				
			}
			else {
//				System.out.println("삭제할 이미지 없음 = 기존 이미지 없음");
			}
			
			List<BoardImg> imgList = new ArrayList<BoardImg>();

			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			
			String board_content = board.getBoard_content();
			Matcher matcher = pattern.matcher(board_content);
			
			String src = null;
			String img_path = null;
			String img_name = null;
			while (matcher.find()) {
				src = matcher.group(1);
				img_path = rootPath + "/" + src;
				img_name = src.substring(src.lastIndexOf("/") + 1);
				BoardImg img = new BoardImg(board_no, img_path, img_name);
				imgList.add(img);
			}
			
			// 서버에는 안올라갔는데 태그인척하는 img있는거 대비 has_img까지 체크 
			// -> has_img는 프론트에서 점검했던거
			if (!imgList.isEmpty() && board.getHas_img().equals("Y")) {
//				System.out.println("새로운 이미지 있음");
				result = boardDao.insertBoardImg(imgList);
				if (result != imgList.size()) {
//					System.out.println("새로운 이미지 insert 문제 생김");
					result = 0;
				}
			} 
			else {
//				System.out.println("새로운 이미지 없음");
			}
		}
		
		return result;
	}

	@Override
	public List<BoardTag> searchTag(String keyword) {
		return boardDao.searchTag(keyword);
	}

	@Override
	public int likeBoard(String user_id, int board_no) {
		int result = boardDao.insertLike(board_no, user_id); 
		// result => 0 : 유저가 좋아요를 했었음, result => 1:유저가 좋아요를 안했음
//		System.out.println("result" + result);
		if (result == 0) {
			boardDao.deleteLike(board_no, user_id);
//			 System.out.println("좋아요삭제");
			boardDao.updateLikeCnt(board_no, -1);
		} else {
//			System.out.println("좋아요추가");
			boardDao.updateLikeCnt(board_no, 1);
		}
		
		return result;
	}

	@Override
	public int bookmarkBoard(String user_id, int board_no) {
		int result = boardDao.insertBookmark(board_no, user_id); 
		if (result == 0) {
			boardDao.deleteBookmark(board_no, user_id);
		} 
		
		return result;
	}

	@Override
	public List<Board> selectBoardList(BoardSearch bs) {
		int count = boardDao.getBoardListCount(bs);
		bs.setCount(count); // 페이징관련된 필드 세팅 
		return boardDao.selectBoardList(bs);
	}

	@Override
	public int deleteBoardArticle(int board_no) {
		return boardDao.deleteBoard(board_no);
	}

	@Override
	public List<Board> selectMain(BoardSearch bs) {
		return boardDao.selectMain(bs);
	}

	@Override
	public List<Board> selectNoticeList(BoardSearch bs) {
		return boardDao.selectNoticeList(bs);
	}

}
