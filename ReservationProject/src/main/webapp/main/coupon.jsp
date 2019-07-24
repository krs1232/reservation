<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form action="insert.do" method="post">
	<input type="hidden" name="redeem" id="redeem">
	<input type="hidden" name="phone" id="phone">
	<div class="col-xs-12">
		<div class="box-content card white">
			<h4 class="box-title">쿠폰</h4>
			<!-- /.box-title -->
			<div class="card-content">
				<ul class="list-inline margin-bottom-0">
					<li class="form-group">
						<input id="txt" type="text" class="form-control">
					</li>
					<li class="form-group">
						<input id="coupon" type="submit" class="btn btn-info waves-effect waves-light" value="발 급"/>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</form>
</body>
</html>