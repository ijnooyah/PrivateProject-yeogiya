package com.yj.yeogiya.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yj.yeogiya.model.dao.BoardDao;
import com.yj.yeogiya.model.vo.Board;
import com.yj.yeogiya.model.vo.BoardImg;
import com.yj.yeogiya.model.vo.BoardPlace;
import com.yj.yeogiya.model.vo.BoardTag;
import com.yj.yeogiya.model.vo.Sort;



@Service
public class BoardServiceImpl implements BoardService {
	@Value("#{property['file.rootPath']}") 
	public String rootPath;
	
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
		int result = 0; 
		// 1. board
		int board_no = boardDao.insertBoard(board);
		if (board_no > 0) {
			// 2. tag 
			String tag = board.getTag(); // "콤마로 연결되어 있는 상태"
			if(tag != null && tag.trim() != "") {
				System.out.println("태그 있음");
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
				System.out.println("태그 없음");
				result = board_no;
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
				result = boardDao.insertBoardPlace(place);
				if (result == 1) {
					result = board_no;
				}
			} else {
				System.out.println("장소 없음");
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
				System.out.println("이미지 있음");
				result = boardDao.insertBoardImg(imgList);
				if (result == imgList.size()) {
					result = board_no;
				}
			} else {
				System.out.println("이미지 없음");
				result = board_no;
			}
			
		}
			
		return result;
	}
	
	@Transactional
	@Override
	public Board selectBoardArticle(int board_no) {
		Board board = boardDao.selectBoard(board_no);
		BoardPlace place = boardDao.selectBoardPlace(board_no);
		List<BoardTag> tagList = boardDao.selectBoardTag(board_no);
		board.setPlace(place);
		board.setTagList(tagList);
		return board;
	}
	
	@Transactional
	@Override
	public int updateBoardArticle(Board board) {
		return boardDao.updateBoard(board);
	}

}
