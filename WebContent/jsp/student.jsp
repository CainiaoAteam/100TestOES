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
		<style type="text/css">
			.user_a{
				text-decoration: none;
				padding: 0 10px;
				font: 500 14px "Microsoft Yahei";
			}
			
		</style>
		
		
		<!-- 一跳转到这个页面就加载相关考试的信息  -->
		<script type="text/javascript">
			// 页面加载成功
			$(function(){
				//加载考试项
				loadExamWhenReady();

			});
			/**
			 * 加载考试项，与谁根据当前时间来加载考试

			 */
			function loadExamWhenReady(){
				var url = "${pageContext.request.contextPath }/exam_loadExamItem";
				var param = {};
				$.post(url,param,function(data){
					console.log(data);
				},"json");
			}
		</script>
		
		
	</head>
	<body background="${pageContext.request.contextPath }/img/index_bg1.jpg">
		<div class="container" style="height: 800px; background-color: rgba(255,255,255,0.8);">
			<div id="topInfo">
				<nav class="navbar navbar-light bg-faded">
					<a class="navbar-brand">
						<h1>100Test</h1>
						<!--<p>&nbsp;we are the best</p>-->
					</a>
					<div> 
						<a style="text-align: right;">欢迎你！${sessionScope.user.sname}</a>
						<!-- <a class="btn btn-outline-secondary" href="home.html">退出</a> -->
						<a class="user_a" href="${pageContext.request.contextPath }/login_logout">退出</a>
					</div>
				</nav>
			</div>
			<div id="mymenu" style="float:left ;  width:17%;  height:100%; text-align: center;">
				<!-- Nav pills -->
				<ul class="nav nav-pills flex-column " role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="pill" href="#toExam">参加考试</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#record">考试记录</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#myInfo">个人信息</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#about">关于</a>
					</li>
				</ul>
			</div>

			<div id="show" style="float:left ;  width:83%;  height:100%;">
				<div class="tab-content">
					<div id="toExam" class="container tab-pane active">
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>
										<div class="card">
    										<div class="card-body">
    										<h4 class="card-title">全国英语四级考试</h4>
      										<p class="card-text">考试编号：1531p</p>
      										<p class="card-text">考试时间：2018年8月8日 9:00-11:30</p>
      										<a href="" data-toggle="modal" data-target="#confirmInfo" class="card-link"><p style="text-align: right;">进入考试</p></a>
    										</div>
  										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="card">
    										<div class="card-body">
    										<h4 class="card-title">全国英语六级考试</h4>
      										<p class="card-text">考试编号：1531p</p>
      										<p class="card-text">考试时间：2018年8月8日 14:30-16:30</p>
      										<a href="" data-toggle="modal" data-target="#confirmInfo" class="card-link"><p style="text-align: right;">进入考试</p></a>
    										</div>
  										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="record" class="container tab-pane fade">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>编号</th>
									<th>名称</th>
									<th>时间</th>
									<th>分数</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>12315</td>
									<td>语文考试</td>
									<td>2018-3-9</td>
									<td>100</td>
									<td><a href="seeExamPaper.jsp"><button class="btn btn-outline-info btn-sm">查看试卷</button></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="myInfo" class="container tab-pane fade">
						<table class="table table-hover" style="border: hidden;">
							<tbody>
								<tr>
									<td><p style="text-align: center;">学号:</p></td>
									<td>${sessionScope.user.sno}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">姓名:</p></td>
									<td>${sessionScope.user.sname}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">性别:</p></td>
									<td>${sessionScope.user.gender}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">身份证号:</p></td>
									<td>${sessionScope.user.idcardnum}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">系别:</p></td>
									<td>${sessionScope.user.department}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">班别:</p></td>
									<td>${sessionScope.user.grade}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">电话:</p></td>
									<td>${sessionScope.user.phone}</td>
								</tr>
								<tr>
									<td><a href="" data-toggle="modal" data-target="#changePaw"><p style="text-align: center;">修改密码</p></a></td>
									
								</tr>
							</tbody>
						</table>
					</div>
					
					<div id="about" class="container tab-pane fade">
						<div>
							<h3 align="center">欢迎使用100test在线考试系统</h3>
							<!--<p align="center">
								100test在线考试系统是全球最专业、最完美的考试系统，
								它是由宇宙知名队伍“菜鸟A队”出品，集合世界上最先进的技术--ssh框架开发而成！
								具有超强的专业性、可靠性、以及可扩展性！
							</p>-->
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="confirmInfo">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">请确认考生信息</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
					
						<!-- 模态框主体 -->
						<div class="modal-body">
							<p>姓名:张恒</p>
							<p>身份证号:445381199605250457</p>
							<p>确认进入考试？</p>
						</div>
					
						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="myexam.jsp" type="button" class="btn btn-outline-light text-dark">确定</a>
						</div>
			
					</div>
				</div>
			</div>
			<div class="modal fade" id="changePaw">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">修改密码</h4>
							<!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
						</div>
					
						<!-- 模态框主体 -->
						<div class="modal-body">
							<form>
							  <fieldset class="form-group">
							    <label for="oldPassword">请输入旧密码：</label>
							    <input type="password" class="form-control" id="oldPassword" placeholder="Enter old password">
							    <!--<small class="text-muted">We'll never share your email with anyone else.</small>-->
							  </fieldset>
							  <fieldset class="form-group">
							    <label for="newPassword">请输入新密码：</label>
							    <input type="password" class="form-control" id="newPassword" placeholder="Enter new password">
							  </fieldset>
							  <fieldset class="form-group">
							    <label for="newPasswordAgain">请再次输入新密码：</label>
							    <input type="password" class="form-control" id="newPasswordAgain" placeholder="Enter again">
							  </fieldset>
							</form>
						</div>
					
						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="" type="button" class="btn btn-outline-light text-dark">确定</a>
						</div>
			
					</div>
				</div>
			</div>
			<div id="aboutUs">
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