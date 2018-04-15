<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>		
		<style>
			/* Make the image fully responsive */
			.carousel-inner img {
				width: 100%;	
				height: 100%;
			}
		</style>
	</head>

	<body>
		<div class="card">
    		<div  class="horizontally-center" >
    			<div id="demo" class="carousel slide" data-ride="carousel">
					<!-- 指示符 -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
		
					<!-- 轮播图片 -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="img/index_bg1.jpg" >
						</div>
						<div class="carousel-item">
							<img src="img/index_bg2.jpg" >
						</div>
						<div class="carousel-item">
							<img src="img/index_bg3.jpg" >
						</div>
					</div>
					<div>
						<h1 style="width:542px;position:fixed;top:100px;left:50%;margin-left:-271px;" class="text-dark">欢迎登录100test在线考试系统</h1>
					</div>
					<div style="width:372px;position:fixed;bottom:150px;left:50%;margin-left:-186px;color:red;">
						<!--<h1 style="width:542px;position:fixed;top:100px;left:50%;margin-left:-271px;color:red;" class="text-dark">欢迎登录100test在线考试系统</h1>
						-->
						<a href="${pageContext.request.contextPath }/login_dump?role=student" class="btn btn-lg btn-outline-dark">学生登录</a>
						<a href="${pageContext.request.contextPath }/login_dump?role=teacher" class="btn btn-lg btn-outline-dark">教师登录</a>
						<a href="${pageContext.request.contextPath }/login_dump?role=admin" class="btn btn-lg btn-outline-dark">管理员登录</a>
					</div>
				</div>
	    	</div>
	  	</div>
	</body>
</html>