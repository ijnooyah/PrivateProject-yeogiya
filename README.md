# 💘PrivateProject-yeogiya
<details open="open">
  <summary>Contents</summary>
  <ol>
    <li>
      <a href="#개요">개요</a>
    </li>
    <li><a href="#구현-기능">구현 기능</a>
      <ul>
         <li><a href="#1-member">Member</a>
           <ul>
            <li><a href="#join">회원가입</a></li>
            <li><a href="#login">로그인</a></li>
            <li><a href="#idFind">아이디 찾기</a></li>
            <li><a href="#pwFind">비밀번호 찾기</a></li>
          </ul>
         </li>
         <li><a href="#Profile">Profile</a>
           <ul>
            <li><a href="#">프로필 조회</a></li>
            <li><a href="#">글, 댓글, 북마크삭제</a></li>
            <li><a href="#">프로필 변경</a></li>
          </ul>
         </li>
         <li><a href="#Me">Me</a>
           <ul>
            <li><a href="#">회원정보 조회</a></li>
            <li><a href="#">회원정보 변경</a></li>
            <li><a href="#">이메일 변경</a></li>
            <li><a href="#">비밀번호 변경</a></li>
            <li><a href="#">회원 탈퇴</a></li>
          </ul>
         </li>
        <li><a href="#Board">Board</a>
           <ul>
            <li><a href="#">메인</a></li>
            <li><a href="#">글목록 조회</a></li>
            <li><a href="#">상세조회</a></li>
            <li><a href="#">글작성</a></li>
            <li><a href="#">글수정</a></li>
            <li><a href="#">글삭제</a></li>
            <li><a href="#">댓글</a></li>
            <li><a href="#">북마크, 좋아요</a></li>
          </ul>
         </li>
      </ul>
    </li>
  </ol>
</details>

# 👩‍💻개요

* 프로젝트 명 : yeogiya

* 일정 : 2021년 08월 26일 ~ 2021년 10월 06일 (약 40일)

* 개발 목적 : 지역별 장소를 공유하고 장소를 데이터화할 수 있는 사이트 제작

* 개발 환경
  - O/S : Windows 10
  - Server : Apache-tomcat-9.0
  - Java EE IDE : Eclipse ( version 2020-06 (4.16.0) )
  - Database : Oracle SQL Developer ( version 20.2.0 )
  - Programming Language : JAVA, HTML, CSS, JavaScript, JSP, SQL
  - Framework/flatform : Spring, mybatis, jQuery 3.5.1, Bootstrap v4.6.x
  - API : Kakao map
  - Version management : Git

* 설계의 주안점
  - 글 작성시 장소를 데이터화할 것.
  - 해시태그 작성시 해시태그를 보관해둘 것.
  - 지역과 카테고리는 관리자가 CRUD할 수 있게 할 것.

* DB 설계<br>
![Yeogiya](https://user-images.githubusercontent.com/85017704/136155526-69773015-6bf4-4219-953c-d6fe54b9c012.png)

------------

# 📝구현 기능

## 1. Member

<h2 id="join"> 회원가입</h2>

* 구현 기능 설명
  - 회원가입을 하기 전에 약관을 보여준다.
  - 필수정보를 입력하지 않거나 형식에 맞지 않으면 회원가입을 할 수 없다.
  - 입력된 값이 정해진 양식을 따르지 않으면 경고메세지가 출력된다.
  - 비밀번호와 비밀번호 재확인이 일치하지 않으면 회원가입을 할 수 없다. 
  - 아이디, 닉네임, 이메일은 비동기방식으로 중복확인을 한다.
  - `Promise`를 사용해 이메일 중복확인 결과에 따라 인증번호를 전송한다.

<br><br>
- 약관동의 <br> ![약관동의](https://user-images.githubusercontent.com/85017704/136322429-c37e0444-e0d0-4472-90fa-0e464b4b0999.gif) <br><br><br><br>
- 필수정보 형식체크
  - 이메일 제외 포커스가 사라지면 형식체크<br>![형식체크](https://user-images.githubusercontent.com/85017704/136324152-b5ba60fd-9ad9-447f-85c2-527df584aa5b.gif) <br><br><br><br>
- 비밀번호 확인<br>![비밀번호](https://user-images.githubusercontent.com/85017704/136324872-61bb7a83-0b3a-4604-a4c2-190ed6053d8b.gif) <br><br><br><br>
- 아이디, 닉네임 중복체크<br>![아이디닉네임중복체크](https://user-images.githubusercontent.com/85017704/136326137-00e35863-f58e-49ab-a9e3-72a5fe7ef77c.gif) <br><br><br><br>
- 이메일 인증
  - `Promise`를 이용해 ajax 흐름제어
  - 중복되지 않은 이메일이라면 해당 이메일 주소로 4자리의 숫자를 랜덤으로 생성해 전송한다.<br>![이메일인증배속](https://user-images.githubusercontent.com/85017704/136329692-879428d8-5c5a-4149-9b11-1c1e5a0ad32a.gif) <br><br><br><br>




