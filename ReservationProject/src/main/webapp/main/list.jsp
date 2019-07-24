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
<style type="text/css">
.fixed-navbar { background: #ff5000 }
.menu-mobile-button { background: #ff5000 }
.header .logo { background: #ff5000 }
.navigation .menu>li.current>a { background: #ff5000 }
</style>
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
				<li class="">
					<a class="waves-effect" href="main.do"><i class="menu-icon mdi mdi-view-dashboard"></i><span>사전 예약</span></a>
				</li>
				<li class="current">
					<a class="waves-effect" href="list.do"><i class="menu-icon mdi mdi-table"></i><span>목록 조회</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="fixed-navbar">
	<div class="pull-left">
		<button type="button" class="menu-mobile-button glyphicon glyphicon-menu-hamburger js__menu_mobile"></button>
		<h1 class="page-title">쿠폰 목록</h1>
		<!-- /.page-title -->
	</div>
</div>
<div id="wrapper">
	<div class="main-content">
		<div class="row small-spacing">
			<div class="col-xs-12">
				<div class="box-content">
					<h4 class="box-title">목록조회</h4>
					<!-- /.dropdown js__dropdown -->
						<div id="example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-12">
									<table id="example" class="table table-striped table-bordered display dataTable" style="width: 100%;" role="grid"aria-describedby="example_info">
										<thead>
											<tr role="row">
												<th class="sorting_desc" tabindex="0"
													aria-controls="example" rowspan="1" colspan="1"
													aria-label="Name: activate to sort column ascending"
													style="width: 165px;" aria-sort="descending">No</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 252px;">휴대폰 번호</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 119px;">쿠폰 번호</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="Age: activate to sort column ascending"
													style="width: 53px;">발급 일시</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="vo" items="${list }">
											<tr role="row">
													<td>${vo.no }</td>
													<td>${vo.phone }</td>
													<td>${vo.couponNo }</td>
													<td>${vo.issuedDate }</td>							
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-5">
									<div class="dataTables_info" id="example_info" role="status"
										aria-live="polite">Showing ${count } entries</div>
								</div>
							</div>
						</div>
					</div>
				<!-- /.box-content -->
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