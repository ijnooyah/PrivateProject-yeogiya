# 💘PrivateProject-yeogiya
<details open="open">
  <summary>목차</summary>
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
      <details><summary><a href="#2-me">Me</a></summary>
          <ul>
            <li><a href="#meView">회원정보 조회</a></li>
            <li><a href="#meChange">회원정보 변경</a></li>
            <li><a href="#emailChange">이메일 변경</a></li>
            <li><a href="#pwChange">비밀번호 변경</a></li>
            <li><a href="#quit">회원 탈퇴</a></li>
          </ul>
         </details>
        <details><summary><a href="#3-profile">Profile</a></summary>
          <ul>
            <li><a href="#profileView">프로필 조회</a></li>
            <li><a href="#profileChange">프로필 변경</a></li>
            <li><a href="#profileDelete">글, 댓글, 북마크삭제</a></li>
          </ul>
         </details>
        <details><summary><a href="#4-board">Board</a></summary>
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
    <li><a href="#특별한-기능">특별한 기능</a></li>
    <li><a href="#고민과-기능">고민과 해결</a></li>
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
  - 지역과 카테고리는 관리자가 CRUD할 수 있게 하며 따로 조작하는 번거로움이 없게 할 것.
  - 카카오 지도 API를 이용하여 사용자가 편리하게 이용할 수 있게 할 것.

* DB 설계<br>
![Yeogiya](https://user-images.githubusercontent.com/85017704/136155526-69773015-6bf4-4219-953c-d6fe54b9c012.png)

<br>

***

<br>

# 📝구현 기능

## 1. Member

<h3 id="join"> 1-1. 회원가입</h2>


<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">

- 회원가입을 하기 전에 약관을 보여준다.
- 필수정보를 입력하지 않거나 형식에 맞지 않으면 회원가입을 할 수 없다.
- 입력된 값이 정해진 양식을 따르지 않으면 유효성 메세지가 출력된다.
- 비밀번호와 비밀번호 재확인이 일치하지 않으면 회원가입을 할 수 없다. 
- 아이디, 닉네임, 이메일은 비동기방식으로 중복확인을 한다.
- `Promise`를 사용해 이메일 중복확인 결과에 따라 인증번호를 전송한다.
      
    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 약관동의 <br><br> ![약관동의](https://user-images.githubusercontent.com/85017704/136322429-c37e0444-e0d0-4472-90fa-0e464b4b0999.gif) <br><br><br><br>
- 필수정보 형식체크
  - 이메일 제외 포커스가 사라지면 형식체크 <br><br> ![형식체크](https://user-images.githubusercontent.com/85017704/136324152-b5ba60fd-9ad9-447f-85c2-527df584aa5b.gif) <br><br><br><br>
- 비밀번호 확인 <br><br> ![비밀번호](https://user-images.githubusercontent.com/85017704/136324872-61bb7a83-0b3a-4604-a4c2-190ed6053d8b.gif) <br><br><br><br>
- 아이디, 닉네임 중복체크 <br><br> ![아이디닉네임중복체크](https://user-images.githubusercontent.com/85017704/136326137-00e35863-f58e-49ab-a9e3-72a5fe7ef77c.gif) <br><br><br><br>
- 이메일 인증
  - `Promise`를 이용해 ajax 흐름제어
  - 중복되지 않은 이메일이라면 해당 이메일 주소로 4자리의 숫자를 랜덤으로 생성해 전송한다. <br><br> ![이메일인증배속](https://user-images.githubusercontent.com/85017704/136329692-879428d8-5c5a-4149-9b11-1c1e5a0ad32a.gif) <br><br><br><br>
- 회원가입 완료 <br><br> ![회원가입배속](https://user-images.githubusercontent.com/85017704/136639272-1f9985e6-0cf6-47e2-a6cb-1f5fe3c08c19.gif) <br><br><br><br>
 

    </div>
</details>

<br>

<h3 id="login"> 1-2. 로그인</h2>


<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">
      
  - 아이디 또는 비밀번호를 입력하지 않고 로그인 버튼을 클릭하면 입력요구 메세지가 출력된다. 
  - 서버에서 회원정보를 비교해 가입되지 않은 아이디 또는 탈퇴한 아이디 또는 올바르지 않은 비밀번호를 입력할 경우 로그인이 되지 않는다.
  - 아이디 저장을 체크한 뒤 로그인 할 경우 아이디를 약 한달동안 저장한다.

    </div>
</details>


<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 아이디 또는 비밀번호 미입력 <br><br> ![로그인미입력배속](https://user-images.githubusercontent.com/85017704/136640542-4b28b506-a7a1-46f5-b2be-8fb46c1d48dc.gif) <br><br><br><br>
- 올바르지 않은 아이디 또는 비밀번호 입력
  - 서버에서 회원정보를 비교해 결과를 전송받은 후 메세지 출력 <br><br> ![로그인잘못](https://user-images.githubusercontent.com/85017704/136641028-1f7f88fa-ef27-4713-8397-083028ff9a46.gif)
- 아이디 저장
  - 약 한달동안 유지하는 쿠키 <br><br>![아이디저장배속](https://user-images.githubusercontent.com/85017704/136641542-dc31502f-f673-4ca3-8e7e-537a1491a0d1.gif) <br><br><br><br>
  - 아이디 저장 해제 <br><br> ![아이디저장체크해제](https://user-images.githubusercontent.com/85017704/136660714-4f4c87a3-c108-40ca-a29d-2e8c35250cab.gif) <br><br><br><br>

  </div>
</details>

<br>

<h3 id="idFind"> 1-3. 아이디 찾기</h2>


<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">
      
      
  - 이름 또는 이메일을 입력하지 않고 버튼을 누르면 입력 요구 메세지가 출력된다.
  - 이메일의 형식이 올바르지 않을 경우 유효성 메세지가 출력된다.
  - 서버에서 회원정보를 비교해 가입되지 않거나 탈퇴한 정보일 경우 유효성메세지가 출력된다.
  - 아이디는 뒷자리 두개를 잘라 보여준다.

      
    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 유효성 검사 <br><br> ![아이디찾기 유효성](https://user-images.githubusercontent.com/85017704/136646369-f8b0f573-3219-4433-b81f-76249247c73e.gif) <br><br><br><br>
- 회원정보와 일치하지 않은 이름 또는 이메일 입력
  - 서버에서 회원정보를 비교해 결과를 전송받은 후 메세지 출력 <br><br> ![아이디찾기틀림](https://user-images.githubusercontent.com/85017704/136646512-a91a7df3-374b-4864-8cbd-7aa347c9dfae.gif) <br><br><br><br>
- 아이디 찾기
  - 아이디는 서버에서 뒤에서 두자리를 잘라 전달한다. :pushpin:[코드 확인](https://github.com/ijnooyah/PrivateProject-yeogiya/blob/a6a04b5e9413221bc9c9cd05a75d2b0420749023/yeogiya/src/main/java/com/yj/yeogiya/model/service/MemberServiceImpl.java#L97-L105) <br><br>![아이디찾기](https://user-images.githubusercontent.com/85017704/136646555-d92c92e0-5756-471f-ac84-ed26fad85f22.gif)
 <br><br><br><br>
  
  </div>
</details>

<br>

<h3 id="pwFind"> 1-4. 비밀번호 찾기</h2>


<details open="open">
  <summary><b>구현 기능 설명</b></summary>
     <div markdown="1">
      
  - 아이디를 입력하지 않고 버튼을 누르면 입력 요구 메세지가 출력된다.
  - 서버에서 회원정보를 비교해 가입되지 않거나 탈퇴한 정보일 경우 유효성메세지가 출력된다.
  - 올바른 아이디가 입력될 경우 이메일 주소 입력창을 보여준다.
  - 이메일을 입력하지 않거나 이메일의 형식이 올바르지 않을 경우 유효성 메세지가 출력된다.
  - 서버에서 회원정보를 비교해 회원정보에 등록된 이메일과 다른 이메일 주소가 입력될 경우 유효성 메세지가 출력된다.
  - 회원정보에 등록된 이메일이 입력될 경우 비동기 방식으로 해당 이메일로 비밀번호를 전송한다. 
    
      </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 아이디 입력 
  - 미입력시 유효성 메세지 출력 <br><br> ![비밀번호찾기아이디미입력](https://user-images.githubusercontent.com/85017704/136647275-25b6e1e8-8860-423b-897d-5a9223c2d9e9.gif) <br><br><br><br>
  - 서버에서 회원정보를 비교해 가입되지 않거나 탈퇴한 회원일 경우 유효성 메세지 출력 <br><br> ![비밀번호찾기아이디잘못입력](https://user-images.githubusercontent.com/85017704/136647310-7252819e-f6dd-4a20-aaba-b07f55be075f.gif) <br><br><br><br>
  - 올바른 아이디 입력 <br><br> ![비밀번호찾기올바른아이디](https://user-images.githubusercontent.com/85017704/136647424-65b4bf0e-e96f-4bb0-a145-f972b6e035ca.gif) <br><br><br><br>
- 이메일 입력
  - 유효성 검사 <br><br> ![비밀번호찾기이메일유효성](https://user-images.githubusercontent.com/85017704/136647691-c84932d2-0b2f-4a46-b060-3df53d2a3311.gif) 
  - 서버에서 회원정보를 비교해 등록된 이메일과 다른 이메일 주소 입력될 경우 유효성 메세지 출력 <br><br> ![비밀번호찾기틀린이메일](https://user-images.githubusercontent.com/85017704/136649995-ef918fc0-81e0-40b8-93f8-ba26ace1fbfd.gif) <br><br><br><br>
- ajax를 통해 비밀번호 정보 이메일 보내기 <br><br> ![비밀번호이메일정보배속](https://user-images.githubusercontent.com/85017704/136650419-e0f6c219-2529-47b4-bb78-a0c396e8d34e.gif) <br><br><br><br>
  
  </div>
</details>

<br><br>

## 2. Me

<h3 id="meView"> 2-1. 회원정보 조회</h2>



<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">
      
  - 아이디, 이름, 지역, 휴대전화, 이메일, 성별, 가입일을 보여준다.
  - 지역 또는 성별은 입력되지 않은 경우 x 표시로 보여준다.
  - 로그인 되지 않은 상태에서 회원정보 주소로 들어오게 되면 로그인 페이지로 넘어간다.

    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 회원정보 보기 <br><br>![회원정보 조회](https://user-images.githubusercontent.com/85017704/136651669-2ec3dee5-98ff-4b54-b836-7a6bbbc9d878.png)  <br><br><br><br>
- 비로그인 접속 <br><br>![회원정보보기비로그인](https://user-images.githubusercontent.com/85017704/136651686-9be92941-66e8-43d4-8c5d-a14af73e7851.gif)  <br><br><br><br>
 

    </div>
</details>

<br>

<h3 id="meChange"> 2-2. 회원정보 변경</h2>


<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">
      
  - 정보수정 전 비밀번호를 입력받는다.
  - 아이디와 이름은 변경이 불가능하다.
  - 휴대전화 정보는 미기입하거나 올바르지 않은 형식으로 수정 할 수 없다.
  - 지역정보와 성별정보를 수정할 수 있다.

    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 비밀번호 입력
  - 유효성 검사 및 서버에서 비밀번호 확인 <br><br> ![정보변경비번확인](https://user-images.githubusercontent.com/85017704/136652016-e8924ea2-b2d1-4fda-9bae-10a63da76725.gif) <br><br><br><br>
- 올바른 비밀번호 입력 후 정보수정 <br><br> ![정보변경비밀번호입력올바르게](https://user-images.githubusercontent.com/85017704/136652182-7c40e36d-567c-46c1-9e83-95558ce2034c.gif)<br><br><br><br>
- 휴대전화 미기입 및 올바르지 않은 형식 <br><br> ![휴대전화수정](https://user-images.githubusercontent.com/85017704/136652221-d54f25a4-3a9e-46d8-92bc-ae88fb625be1.gif)<br><br><br><br>
- 지역 및 성별 정보 수정 <br><br> ![지역성별정보수정](https://user-images.githubusercontent.com/85017704/136652409-a7ec000a-8739-4abc-af44-a50551e73863.gif) <br><br><br><br>

 

    </div>
</details>

<br>

<h3 id="emailChange"> 2-3. 이메일 변경</h2>



<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">
      
  - 이메일 수정 전 비밀번호를 입력받는다.
  - 입력된 이메일 주소가 형식에 맞지 않으면 유효성 메세지가 출력된다.
  - `Promise`를 사용해 이메일 중복확인 결과에 따라 변경할 이메일 주소로 인증번호를 전송한다.

       </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
  <div markdown="1">
      
- 비밀번호 입력, 유효성 검사 캡쳐 생략 (회원가입, 회원정보 변경과 같음)
- 이메일 인증
  - `Promise`를 이용해 ajax 흐름제어
  - 중복되지 않은 이메일이라면 해당 이메일 주소로 4자리의 숫자를 랜덤으로 생성해 전송한다. <br><br> ![이메일변경promise](https://user-images.githubusercontent.com/85017704/136659535-85485219-cac5-4bfa-abe2-460d5f67d9ff.gif) <br><br><br><br>
  
  </div>
</details>

<br>

<h3 id="pwChange"> 2-4. 비밀번호 변경</h2>



<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">
      
  - 현재 비밀번호를 비동기로 확인한다.
  - 현재 비밀번호가 입력되지 않거나 다르면 서버로 정보가 전송되지 않는다.
  - 새비밀번호의 형식이 바르지 않거나 재확인과 일치하지 않으면 서버로 정보가 전송되지 않는다.

    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 서버로 전송 되지 않는 경우들 <br><br> ![비밀번호변경전송x](https://user-images.githubusercontent.com/85017704/136659889-aaa07e3c-625f-4e05-bbbb-276dc09370c1.gif) <br><br><br><br>
- 서버로 전송 <br><br> ![비밀번호변경ok](https://user-images.githubusercontent.com/85017704/136659994-c625f682-50ef-4404-9fb7-c03e02572793.gif) <br><br><br><br>
 
    </div>
</details>

<br>

<h3 id="quit"> 2-5. 회원탈퇴</h2>


<details open="open">
  <summary><b>구현 기능 설명</b></summary>
    <div markdown="1">
      
  - 회원 탈퇴 전 비밀번호를 입력받는다.
  - 탈퇴된 아이디로 로그인, 아이디 찾기, 비밀번호 찾기를 할 수 없다.

    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
    <div markdown="1">

- 유효성 검사 캡쳐 생략
- 회원 탈퇴 <br><br> ![회원탈퇴](https://user-images.githubusercontent.com/85017704/136660551-cce9b4b1-87bf-4ff7-8189-cb9cb1043481.gif) <br><br><br><br>
 

    </div>
</details>

<br><br>

## 3. Profile

<h3 id="profileView"> 3-1. 프로필 조회</h2>

<details open="open">
  <summary><b>구현 기능 설명</b></summary>
  <div markdown="1">
      
  - 회원이 북마크를 비공개 해놨을 경우 북마크한 게시글이 보이지 않는다.
  - 회원이 작성한 글, 작성한 댓글, 북마크한 게시글 목록에 대해 정렬 및 페이징을 할 수 있다.
  - 조회된 게시글 목록 각각의 링크를 통해 지역 사이트, 게시판, 게시글, 회원 프로필로 이동할 수 있다.
  - 프로필 수정 및 글 삭제 버튼은 본인의 계정일 경우에만 존재한다.
  
    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
  <div markdown="1">

- 프로필 보기
  - 프로필 사진이 설정되어 있지 않은 경우 기본 사진으로 설정함.
  - 탈퇴한 회원일 경우 회원등급에 '탈퇴 회원'으로 표시됨.
  - 자기소개가 설정되어 있지 않은 경우 '자기소개 없음'으로 표시됨.
  - 회원이 지역을 비공개 해놨을 경우 지역이 표시 되지 않음.
  - 프로필 수정 및 글 삭제 버튼은 본인의 계정일 경우에만 존재.  <br><br>  ![녹화_2021_10_11_14_26_21_743](https://user-images.githubusercontent.com/85017704/136737721-32608ed4-a805-416e-bcc3-5d423c3a2e8f.gif) <br><br><br><br>
- 회원이 작성한 글, 작성한 댓글, 북마크한 게시글 목록 보기.
  - 회원이 북마크를 비공개 해놨을 경우 북마크한 게시글이 보이지 않음. <br><br>  ![녹화_2021_10_11_14_29_16_294](https://user-images.githubusercontent.com/85017704/136737882-7053f53d-fb8b-44bc-8bb2-886d0b12290c.gif) <br><br><br><br>
- 정렬 및 페이징
  - 조회된 게시글 목록 각각의 링크를 통해 지역 사이트, 게시판, 게시글, 회원 프로필로 이동 가능. <br><br> ![녹화_2021_10_11_15_10_51_879](https://user-images.githubusercontent.com/85017704/136741472-03a3809a-572a-4e40-a32f-923c8224608a.gif) <br><br><br><br>
- 프로필 수정 및 글 삭제 버튼은 본인의 계정일 경우에만 존재 <br><br> ![녹화_2021_10_11_15_14_44_50](https://user-images.githubusercontent.com/85017704/136741625-5abb5080-f058-47f4-b4ab-d7c99d228468.gif) <br><br><br><br>


    </div>
</details>

<br>

<h3 id="profileChange"> 3-2. 프로필 변경</h2>

<details open="open">
  <summary><b>구현 기능 설명</b></summary>
  <div markdown="1">
    
  - 프로필 이미지, 닉네임, 지역·북마크 공개여부, 실시간 알림 수신여부를 설정할 수 있다.
  - 업로드한 프로필 사진은 비동기 방식으로 전송되어 지정된 외부폴더에 저장된다. 
  - 프로필 사진이 정상적으로 업로드 되면 `FileReader`을 이용해 미리보기 이미지를 출력하고 이미지 삭제 버튼을 보여준다.
  - 닉네임은 필수정보이므로 공백으로 제출할 수 없으며 형식에 맞지 않거나 중복될 경우 프로필을 수정할 수 없다.
  - 닉네임과 자기소개는 입력시 글자수가 실시간으로 표시되며 최대글자수를 넘어갈 시 더이상 입력 되지 않는다. 
  

    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
  <div markdown="1">
    
   - 이미지 업로드
    - 첨부된 파일이 이미지 형식이(JPG·PNG·GIF·JPEG) 아니거나 10MB를 초과한다면 업로드 불가 <br><br> ![녹화_2021_10_11_15_21_35_512](https://user-images.githubusercontent.com/85017704/136742282-e9c35bfa-61ca-4c32-b407-cdf378cc515d.gif) <br><br><br><br>
    - 프로필 사진은 비동기 방식으로 전송되어 지정된 외부폴더에 저장됨
    - 프로필 사진이 정상적으로 업로드 되면 `FileReader`을 이용해 미리보기 이미지를 출력하고 이미지 삭제 버튼을 보여줌 
    - 삭제버튼을 누르면 이미지가 삭제됨 <br><br> ![이미지업로드배속](https://user-images.githubusercontent.com/85017704/136743293-65f90cea-65e8-479e-b96e-5862d1257e60.gif) <br><br><br><br>
  - 닉네임 중복체크
    - 현재 자신이 사용하고 있는 닉네임일 경우 중복메세지 뜨지 않음. <br><br>   ![녹화_2021_10_11_15_40_37_735](https://user-images.githubusercontent.com/85017704/136744205-b718b732-af0d-4f2e-b023-cfc676022918.gif) <br><br><br><br>
   - 글자수 제한 <br><br>  ![글자수배속](https://user-images.githubusercontent.com/85017704/136745084-6731299d-bd8e-4632-9998-b2313f2a2174.gif) <br><br><br><br>
  - 프로필 설정 <br><br> ![프로필수정](https://user-images.githubusercontent.com/85017704/136748985-dadd47c1-3717-4dab-a5c6-309116600262.gif) <br><br><br><br>


    
    </div>
</details>

<br>

<h3 id="profileDelete"> 3-3. 글, 댓글, 북마크삭제</h2>

<details open="open">
  <summary><b>구현 기능 설명</b></summary>
  <div markdown="1">

  - 본인의 계정일 경우 체크박스와 삭제 버튼이 존재하며 선택한 대상을 삭제할 수 있다.
  - 전체선택 또는 개별선택으로 대상을 삭제할 수 있다.
  - 선택된 대상이 없을 시 대상 선택 요구 메세지가 출력된다.


    </div>
</details>

<details>
  <summary><b>구현 기능 시현 및 상세설명</b></summary>
   <div markdown="1">

  - 전체선택 삭제 
     - 글 <br><br> ![녹화_2021_10_11_16_23_49_199](https://user-images.githubusercontent.com/85017704/136749305-e98b2876-06cb-4909-b032-b7535d022c81.gif) <br><br><br><br>
     - 댓글 <br><br> ![녹화_2021_10_11_16_26_35_153](https://user-images.githubusercontent.com/85017704/136749416-b0501fa5-dcb2-4e55-ac61-e41675e9b9c2.gif) <br><br><br><br>
     - 북마크 <br><br>  ![녹화_2021_10_11_16_27_23_761](https://user-images.githubusercontent.com/85017704/136749491-ee1fa4f5-26fc-400d-acbc-d3d579df546a.gif) <br><br><br><br>
   - 개별선택 삭제 
     - 댓글, 북마크 사진 생략(글과 동일)  <br><br> ![녹화_2021_10_11_16_28_48_13](https://user-images.githubusercontent.com/85017704/136749879-668c5067-cc9b-4d47-9120-0efa10c11810.gif)  <br><br><br><br>
  - 선택된 대상이 없을 시 대상 선택 요구 메세지 출력 <br><br> ![녹화_2021_10_11_16_31_12_991](https://user-images.githubusercontent.com/85017704/136750109-83e8405b-933c-454f-a285-cbdd9ee46964.gif)   <br><br><br><br>


   </div>
</details>

