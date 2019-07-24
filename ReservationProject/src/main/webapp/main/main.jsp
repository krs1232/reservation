<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>사전 예약</title>
	<!-- Main Styles -->
	<link rel="stylesheet" href="../assets/styles/style.min.css">
	<!-- Material Design Icon -->
<link rel="stylesheet" href="../assets/fonts/material-design/css/materialdesignicons.css">
	<script src="../assets/scripts/jquery.min.js"></script>	
<script type="text/javascript">
function formChk() {
	var tel1 = $("#tel1").val();
	var tel2 = $("#tel2").val();
	var tel3 = $("#tel3").val();
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
	var pattern_eng = /[a-zA-Z]/;
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; 
	
	if (tel1.trim() === "" || tel2.trim() === "" || tel3.trim() === "") {
		alert("핸드폰 번호를 입력해주세요.");
	} else if (pattern_eng.test(tel1) || pattern_eng.test(tel2) || pattern_eng.test(tel3)) { 
		alert("정확한 번호를 입력해주세요.");
	} else if (pattern_kor.test(tel1) || pattern_kor.test(tel2) || pattern_kor.test(tel3)) { 
		alert("정확한 번호를 입력해주세요.");
	} else if (pattern_spc.test(tel1) || pattern_spc.test(tel2) || pattern_spc.test(tel3)) { 
		alert("정확한 번호를 입력해주세요.");
	} else {
		phoneForm.submit();
	}
}

$(function() {
	var usedPhone = <%=request.getAttribute("usedPhone")%>
	var unusedPhone = <%=request.getAttribute("unusedPhone")%>

	if (usedPhone != null) {
		alert("이미 쿠폰이 발급된 번호입니다.");	
	} else if (unusedPhone != null) {
		console.log(<%=request.getAttribute("tel2")%>);
		$("#tel1").val("010");
		$("#tel2").val(<%=request.getAttribute("tel2")%>);
		$("#tel3").val(<%=request.getAttribute("tel3")%>);
		
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();

		// 쿠폰화면 jsp 추가
		$.ajax({
			type : "POST",
	       	url : "coupon.do",
	        success : function(res) {
	      		$("#print").html(res);
	       	}
		});
		
		// 쿠폰리딤코드 데이터 출력
		$.ajax({
			type : "POST",
	       	url : "couponVO.do",
	       	data : {"tel2":tel2},
	        success : function(res) {
	      		$("#txt").val(res);
	      		var redeemCode = $("#txt").val();
	      		
	      		$("#coupon").click(function() {
	      			$("#redeem").val(redeemCode);
	      			$("#phone").val(tel1 + "-" + tel2 + "-" + tel3);
	      			alert("쿠폰이 발급되었습니다!");
	      		});
	       	}
		});
		
	}
	
});
</script>
<style type="text/css">
.fixed-navbar { background: #ff5000 }
.menu-mobile-button { background: #ff5000 }
.header .logo { background: #ff5000 }
.navigation .menu>li.current>a { background: #ff5000 }
</style>
</head>
</head>
<body>
<div class="main-menu">
	<header class="header">
		<a href="#" class="logo"><i class="ico mdi mdi-cube-outline"></i>Smilegate</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="#" class="avatar"><img src="../assets/images/main.JPG" alt=""><span class="status online"></span></a>
			<h5 class="name">Rasung Ki</h5>
			<h5 class="position">Administrator</h5>
		</div>
	</header>
	<div class="content">
		<div class="navigation">
			<h5 class="title">Menu</h5>
			<!-- /.title -->
			<ul class="menu js__accordion">
				<li class="current">
					<a class="waves-effect" href="main.do"><i class="menu-icon mdi mdi-view-dashboard"></i><span>사전 예약</span></a>
				</li>
				<li class="">
					<a class="waves-effect" href="list.do"><i class="menu-icon mdi mdi-table"></i><span>목록 조회</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="fixed-navbar">
	<div class="pull-left">
		<button type="button" class="menu-mobile-button glyphicon glyphicon-menu-hamburger js__menu_mobile"></button>
		<h1 class="page-title">사전 예약</h1>
		<!-- /.page-title -->
	</div>
</div>
<div id="wrapper">
	<div class="main-content">
		<div class="row small-spacing">
			<div class="col-xs-12">
				<div class="box-content card white">
					<h4 class="box-title">사용자 번호 입력</h4>
					<form name="phoneForm" action="main.do" method="post">
					<input type="hidden" name="phoneNumber" id="phoneNumber" value="">
					<div class="card-content">
						<ul class="list-inline margin-bottom-0">
							<li class="form-group">
								<input type="text" class="form-control" id="tel1" placeholder="010" name="tel1"> 
							</li>
							<li class="form-group">
								<input type="text" class="form-control" id="tel2" placeholder="tel1" name="tel2"> 
							</li>
							<li class="form-group">
								<input type="text" class="form-control" id="tel3" placeholder="tel2" name="tel3">
							</li>
							<li class="form-group">
								<input type="button" id="btn" class="btn btn-orange waves-effect waves-light" 
								 onclick="javascript:formChk()" value="쿠폰 발급">
							</li>
						</ul>
					</div>
					</form>
				</div>
			</div>
			<div id="print">
					
			</div>
		</div>
		<footer class="footer">
			<ul class="list-inline">
				<li>2019 Reservation Project</li>
				<li><a href="#">Made By</a></li>
				<li><a href="#">Rasung Ki</a></li>
			</ul>
		</footer>
	</div>
</div>
</body>
</html>