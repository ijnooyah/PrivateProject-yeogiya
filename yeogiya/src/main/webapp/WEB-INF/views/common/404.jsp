<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>not found</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
@font-face {
    font-family: 'logo';
    src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
:root {
	--pink: #f3a6c6 !important; 
}
* {
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

body {
  padding: 0;
  margin: 0;
}

#notfound {
  position: relative;
  height: 100vh;
}

#notfound .notfound {
  position: absolute;
  left: 50%;
  top: 50%;
  -webkit-transform: translate(-50%, -50%);
      -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
}

#notfound .notfound-bg {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  overflow: hidden;
}

#notfound .notfound-bg>div {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 1px;
  background-color: #eee;
}

#notfound .notfound-bg>div:nth-child(1) {
  left: 20%;
}

#notfound .notfound-bg>div:nth-child(2) {
  left: 40%
}

#notfound .notfound-bg>div:nth-child(3) {
  left: 60%
}

#notfound .notfound-bg>div:nth-child(4) {
  left: 80%
}

#notfound .notfound-bg>div:after {
  content: '';
  position: absolute;
  top: 0px;
  left: -0.5px;
  -webkit-transform: translateY(-160px);
      -ms-transform: translateY(-160px);
          transform: translateY(-160px);
  height: 160px;
  width: 2px;
  background-color: var(--pink);
}

@-webkit-keyframes drop {
  90% {
    height: 20px;
  }
  100% {
    height: 160px;
    -webkit-transform: translateY(calc(100vh + 160px));
            transform: translateY(calc(100vh + 160px));
  }
}

@keyframes drop {
  90% {
    height: 20px;
  }
  100% {
    height: 160px;
    -webkit-transform: translateY(calc(100vh + 160px));
            transform: translateY(calc(100vh + 160px));
  }
}

#notfound .notfound-bg>div:nth-child(1):after {
  -webkit-animation: drop 3s infinite linear;
          animation: drop 3s infinite linear;
  -webkit-animation-delay: 0.2s;
          animation-delay: 0.2s;
}

#notfound .notfound-bg>div:nth-child(2):after {
  -webkit-animation: drop 2s infinite linear;
          animation: drop 2s infinite linear;
  -webkit-animation-delay: 0.7s;
          animation-delay: 0.7s;
}

#notfound .notfound-bg>div:nth-child(3):after {
  -webkit-animation: drop 3s infinite linear;
          animation: drop 3s infinite linear;
  -webkit-animation-delay: 0.9s;
          animation-delay: 0.9s;
}

#notfound .notfound-bg>div:nth-child(4):after {
  -webkit-animation: drop 2s infinite linear;
          animation: drop 2s infinite linear;
  -webkit-animation-delay: 1.2s;
          animation-delay: 1.2s;
}

.notfound {
  max-width: 520px;
  width: 100%;
  text-align: center;
}

.notfound .notfound-404 {
  height: 210px;
  line-height: 210px;
}

.notfound .notfound-404 h1 {
  font-family: 'logo', sans-serif;
  font-size: 188px;
  font-weight: 700;
  margin: 0px;
  text-shadow: 4px 4px 0px var(--pink);
}

.notfound h2 {
  font-family: 'logo', sans-serif;
  font-size: 42px;
  font-weight: 700;
  margin: 0;
  text-transform: uppercase;
  letter-spacing: 1.6px;
}

.notfound p {
  font-family: 'Noto Sans KR', sans-serif;
  color: #000;
  font-weight: 400;
  margin-top: 20px;
  margin-bottom: 25px;
}

.notfound a {
  font-family: 'logo', sans-serif;
  padding: 10px 30px;
  display: inline-block;
  color: #000;
  font-weight: 400;
  text-transform: uppercase;
  -webkit-box-shadow: 0px 0px 0px 2px #000, 2px 2px 0px 2px var(--pink);
          box-shadow: 0px 0px 0px 2px #000, 2px 2px 0px 2px var(--pink);
  text-decoration: none;
  -webkit-transition: 0.2s all;
  transition: 0.2s all;
}

.notfound a:hover {
  background-color: var(--pink);
  -webkit-box-shadow: 0px 0px 0px 0px #000, 0px 0px 0px 2px var(--pink);
          box-shadow: 0px 0px 0px 0px #000, 0px 0px 0px 2px var(--pink);
}

.notfound-social {
  margin-top: 35px;
}

.notfound-social>a {
  width: 40px;
  height: 40px;
  line-height: 40px;
  padding: 0px;
  margin: 0px 5px;
}

.notfound-social>a:hover {
  background-color: var(--pink);
  -webkit-box-shadow: 0px 0px 0px 0px #000, 0px 0px 0px 2px var(--pink);
          box-shadow: 0px 0px 0px 0px #000, 0px 0px 0px 2px var(--pink);
}

@media only screen and (max-width: 480px) {
  .notfound .notfound-404 {
    height: 122px;
    line-height: 122px;
  }
  .notfound .notfound-404 h1 {
    font-size: 122px;
  }
  .notfound h2 {
    font-size: 26px;
  }
}

</style>
</head>
<body>
<div id="notfound">
		<div class="notfound-bg">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div class="notfound">
			<div class="notfound-404">
				<h1>404</h1>
			</div>
			<h2>Page Not Found</h2>
			<p>요청하신 페이지가 제거되었거나,<br> 이름이 변경되었거나,<br> 일시적으로 사용이 중단되었습니다.</p>
			<a href="#">여기야!</a>
		</div>
	</div>
</body>
</html>