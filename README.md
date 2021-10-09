# 💘PrivateProject-yeogiya
<details open="open">
  <summary>Contents</summary>
  <ol>
    <li>
      <a href="#개요">개요</a>
    </li>
    <li><a href="#구현-기능">구현 기능</a>
        <details><summary><a href="#1-member">Member</a></summary>
           <ul>
            <li><a href="#join">회원가입</a></li>
            <li><a href="#login">로그인</a></li>
            <li><a href="#idFind">아이디 찾기</a></li>
            <li><a href="#pwFind">비밀번호 찾기</a></li>
          </ul>
         </details>
        <details><summary><a href="#1-member">Profile</a></summary>
          <ul>
            <li><a href="#">프로필 조회</a></li>
            <li><a href="#">글, 댓글, 북마크삭제</a></li>
            <li><a href="#">프로필 변경</a></li>
          </ul>
         </details>
       <details><summary><a href="#Me">Me</a></summary>
          <ul>
            <li><a href="#">회원정보 조회</a></li>
            <li><a href="#">회원정보 변경</a></li>
            <li><a href="#">이메일 변경</a></li>
            <li><a href="#">비밀번호 변경</a></li>
            <li><a href="#">회원 탈퇴</a></li>
          </ul>
         </details>
        <details><summary><a href="#Board">Board</a></summary>
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
         </details>
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

<h3 id="join"> a. 회원가입</h2>

* **구현 기능 설명** 

  - 회원가입을 하기 전에 약관을 보여준다.
  - 필수정보를 입력하지 않거나 형식에 맞지 않으면 회원가입을 할 수 없다.
  - 입력된 값이 정해진 양식을 따르지 않으면 유효성 메세지가 출력된다.
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
- 회원가입 완료<br>![회원가입배속](https://user-images.githubusercontent.com/85017704/136639272-1f9985e6-0cf6-47e2-a6cb-1f5fe3c08c19.gif) <br><br><br><br>
 
------------
<br>

<h3 id="login"> b. 로그인</h2>

* **구현 기능 설명** 

  - 아이디 또는 비밀번호를 입력하지 않고 로그인 버튼을 클릭하면 입력요구 메세지가 출력된다. 
  - 서버에서 회원정보를 비교해 가입되지 않은 아이디 또는 탈퇴한 아이디 또는 올바르지 않은 비밀번호를 입력할 경우 로그인이 되지 않는다.
  - 아이디 저장을 체크한 뒤 로그인 할 경우 아이디를 약 한달동안 저장한다.

<br><br>
- 아이디 또는 비밀번호 미입력 <br> ![로그인미입력배속](https://user-images.githubusercontent.com/85017704/136640542-4b28b506-a7a1-46f5-b2be-8fb46c1d48dc.gif) <br><br><br><br>
- 올바르지 않은 아이디 또는 비밀번호 입력
  - 서버에서 회원정보를 비교해 결과를 전송받은 후 메세지 출력<br> ![로그인잘못](https://user-images.githubusercontent.com/85017704/136641028-1f7f88fa-ef27-4713-8397-083028ff9a46.gif)
 <br><br><br><br>
- 아이디 저장
  - 약 한달동안 유지하는 쿠키 <br>![아이디저장배속](https://user-images.githubusercontent.com/85017704/136641542-dc31502f-f673-4ca3-8e7e-537a1491a0d1.gif) <br><br><br><br>

------------
<br>


<h3 id="idFind"> c. 아이디 찾기</h2>

* **구현 기능 설명** 

  - 이름 또는 이메일을 입력하지 않고 버튼을 누르면 입력 요구 메세지가 출력된다.
  - 이메일의 형식이 올바르지 않을 경우 유효성 메세지가 출력된다.
  - 서버에서 회원정보를 비교해 가입되지 않거나 탈퇴한 정보일 경우 유효성메세지가 출력된다.
  - 아이디는 뒷자리 두개를 잘라 보여준다.

<br><br>
- 유효성 검사 <br> ![아이디찾기 유효성](https://user-images.githubusercontent.com/85017704/136646369-f8b0f573-3219-4433-b81f-76249247c73e.gif) <br><br><br><br>
- 회원정보와 일치하지 않은 이름 또는 이메일 입력
  - 서버에서 회원정보를 비교해 결과를 전송받은 후 메세지 출력<br> ![아이디찾기틀림](https://user-images.githubusercontent.com/85017704/136646512-a91a7df3-374b-4864-8cbd-7aa347c9dfae.gif) <br><br><br><br>
- 아이디 찾기 <br>![아이디찾기](https://user-images.githubusercontent.com/85017704/136646555-d92c92e0-5756-471f-ac84-ed26fad85f22.gif)
 <br><br><br><br>

------------
<br>


<h3 id="pwFind"> d. 비밀번호 찾기</h2>

* **구현 기능 설명** 

  - 아이디를 입력하지 않고 버튼을 누르면 입력 요구 메세지가 출력된다.
  - 서버에서 회원정보를 비교해 가입되지 않거나 탈퇴한 정보일 경우 유효성메세지가 출력된다.
  - 올바른 아이디가 입력될 경우 이메일 주소 입력창을 보여준다.
  - 이메일을 입력하지 않거나 이메일의 형식이 올바르지 않을 경우 유효성 메세지가 출력된다.
  - 서버에서 회원정보를 비교해 회원정보에 등록된 이메일과 다른 이메일 주소가 입력될 경우 유효성 메세지가 출력된다.
  - 회원정보에 등록된 이메일이 입력될 경우 비동기 방식으로 해당 이메일로 비밀번호를 전송한다. 

<br><br>
- 아이디 입력 
  - 미입력시 유효성 메세지 출력 <br> ![비밀번호찾기아이디미입력](https://user-images.githubusercontent.com/85017704/136647275-25b6e1e8-8860-423b-897d-5a9223c2d9e9.gif) <br><br><br><br>
  - 서버에서 회원정보를 비교해 가입되지 않거나 탈퇴한 회원일 경우 유효성 메세지 출력 <br> ![비밀번호찾기아이디잘못입력](https://user-images.githubusercontent.com/85017704/136647310-7252819e-f6dd-4a20-aaba-b07f55be075f.gif) <br><br><br><br>
  - 올바른 아이디 입력 <br> ![비밀번호찾기올바른아이디](https://user-images.githubusercontent.com/85017704/136647424-65b4bf0e-e96f-4bb0-a145-f972b6e035ca.gif) <br><br><br><br>
- 이메일 입력
  - 유효성 검사 <br> ![비밀번호찾기이메일유효성](https://user-images.githubusercontent.com/85017704/136647691-c84932d2-0b2f-4a46-b060-3df53d2a3311.gif) 
  - 서버에서 회원정보를 비교해 등록된 이메일과 다른 이메일 주소 입력될 경우 유효성 메세지 출력<br>![비밀번호찾기틀린이메일](https://user-images.githubusercontent.com/85017704/136649995-ef918fc0-81e0-40b8-93f8-ba26ace1fbfd.gif) <br><br><br><br>
- ajax를 통해 비밀번호 정보 이메일 보내기 <br> ![비밀번호이메일정보배속](https://user-images.githubusercontent.com/85017704/136650419-e0f6c219-2529-47b4-bb78-a0c396e8d34e.gif) <br><br><br><br>
------------
<br>

