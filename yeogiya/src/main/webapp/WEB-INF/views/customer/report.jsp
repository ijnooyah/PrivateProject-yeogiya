<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>report</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
    <!-- font awsome-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <!-- fonts-->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- bootstrap css-->
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
   	
   	<!-- sweet alert -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
/* 	스크롤 숨기기 */
	body {
		overflow:hidden;
	}
    .btn-pink{
       color: #fff !important; 
       background-color:#F2C6C2 !important;
       border: 1px solid #F2C6C2 !important;
    }
    
    .btn-pink-outline{
        color: #F2C6C2 !important;
        background-color: #ffffff !important;
        border: 1px solid #F2C6C2 !important;
    }
    
    .btn-pink:hover, .btn-pink-outline:hover{
        color: #ffffff !important; 
        background-color:#3339A6  !important;
        border: 1px solid #3339A6  !important;
    }
    
    .form-control:focus {
	    border-color: #F2C6C2;
	    outline: 0;
	    box-shadow: 0 0 0 0.2rem rgb(242 198 194 / 35%);
    }
    .btn.focus, .btn:focus {
	    outline: 0;
	    box-shadow: 0 0 0 0.2rem rgb(51 57 166 / 25%);
	}
</style>
</head>
<body>
	<div class="container my-5" style="padding-left: 40px; padding-right: 40px;">
    	 <form method="post" action="">
	     	<div class="form-group row">
		     	 <label for="report_title" class="col-sm-3 col-form-label">신고 제목</label>
		      	 <div class="col-sm-9">
		      	 	<input type="text" class="form-control" 
		      	 		id="report_title" name="report_title" 
		      	 		placeholder="신고 제목을 입력해 주세요." required
		      	 		spellcheck="false" autocomplete="off">
	    		 </div>
	     	</div>
	
	         <div class="form-group row">
	             <label class="input-group-addon col-sm-3 col-form-label">신고 사유</label>
	             <div class="col-sm-9">
		             <select class="form-control small" id="category" name="cate_no" required>
		                 <option value="1">홍보</option>
		             </select>
	             </div>
	         </div>
	         <div class="form-group row">
	             <label for="report_content" class="col-sm-3 col-form-label">신고 내용</label>
	             <div class="col-sm-9">
	              <textarea class="form-control" id="report_content" 
	              	name="report_content" rows="10" style="resize: none;" 
	              	placeholder="신고 내용을 입력해 주세요." required
		      	 	spellcheck="false" autocomplete="off"></textarea>
	             </div>
	         </div>
	         <div class="form-group row">
		         	<div class="col-sm-12" style="text-align:center; margin-top:30px;">
		             <button type="submit" class="btn btn-pink">신고</button>
		              <button class="btn btn-pink-outline" onclick="self.close();">취소</button>
		          </div>
	         </div>
     	</form>
   	</div>
</body>
</html>