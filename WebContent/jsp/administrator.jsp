<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/build.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	<body background="${pageContext.request.contextPath }/img/index_bg1.jpg">
		<div class="container" style="height: 800px; background-color: rgba(255,255,255,0.8);">
			<div id="tou">
				<nav class="navbar navbar-light bg-faded">
					<a class="navbar-brand" href="">
						<h1>100test</h1>
						<!--<p>&nbsp;we are the best</p>-->
					</a>
					<div> 
						<a style="text-align: right;">欢迎你！管理员</a>
						<a class="btn btn-outline-secondary" href="">退出</a>
					</div>
				</nav>
			</div>
			<div id="mymenu" style="float:left ;  width:17%;  height:100%; text-align: center;">
				<!-- Nav pills -->
				<ul class="nav nav-pills flex-column " role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="pill" href="#CheckPaper">试卷审核</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#stu_manage">学生管理</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#tea_manage">教师管理</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#info_manage">个人信息</a>
					</li>
				</ul>
			</div>

			<div id="show" style="float:left ;  width:83%;  height:100%;">
				<div class="tab-content">
					<div id="CheckPaper" class="container tab-pane active">
						
					</div>
					<div id="stu_manage" class="container tab-pane fade">
						
					</div>
					<div id="tea_manage" class="container tab-pane fade">
						<div>
							<h3 align="center">欢迎使用100test在线考试系统</h3>
						</div>
					</div>
					<div id="info_manage" class="container tab-pane fade">
						<table class="table table-hover" style="border: hidden;">
							<tbody>
								<tr>
									<td><p style="text-align: center;">学号:</p></td>
									<td>201524133215</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">姓名:</p></td>
									<td>张创恒</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">性别:</p></td>
									<td>男</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">身份证号:</p></td>
									<td>445381199608250457</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">系别:</p></td>
									<td>计算机</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">班别:</p></td>
									<td>15软件2班</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">电话:</p></td>
									<td>15767044123</td>
								</tr>
								<tr>
									<td><a href=""><p style="text-align: center;">修改密码</p></a></td>
									
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div id="footer">
				<div style="text-align: center;">
					<p>
						<a href="#">关于我们</a> | 
						<a href="#">联系我们</a> | 
						<a href="#">帮助我们</a>
					</p>
					<p>Design by @菜鸟A队</p>
				</div>
	  		</div>
		
		</div>
	</body>
</html>
 