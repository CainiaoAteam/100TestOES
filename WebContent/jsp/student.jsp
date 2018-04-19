<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			.trueTip{
				color: green;
			}
			.erroTip{
				color: red;
			}
			
		</style>
		
		
		<!-- 一跳转到这个页面就加载相关考试的信息  -->
		<script type="text/javascript">
			var action;
			// 页面加载成功
			$(function(){
				//加载考试项
				loadExamWhenReady();

			});
			/**
			 * 加载考试项，与谁根据当前时间来加载考试
			 data-toggle='modal' data-target='#confirmInfo'
			 */
			function loadExamWhenReady(){
				var url = "${pageContext.request.contextPath }/exam_loadExamItem";
				var param = {};
				$.post(url,param,function(data){
					var inner = "";
					var item = "";
					$.each(data,function(i,n){
						item = "<tr>"+
									"<td>"+
										"<div class='card'>"+
											"<div class='card-body'>"+
											"<h4 class='card-title'>"+data[i].examname+"</h4>"+
												"<p class='card-text'>考试编号："+data[i].examno+"</p>"+
												"<p class='card-text'>考试时间："+data[i].startTime+"</p>"+
												"<a href='javascript:;' name='${pageContext.request.contextPath }/exam_loadPaper?pid="+data[i].testpaper.tpid+"' class='card-link' onclick='checkInfo(this)'><p style='text-align: right;'>进入考试</p></a>"+
											"</div>"+
										"</div>"+
									"</td>"+
								"</tr>";
						inner += item;
					});

					$("#examBody").html(inner);
				},"json");
			}
			function checkInfo(obj){
				action = obj.name;
				$("#confirmInfo").show();
			}
			function closeWin(){
				$("#confirmInfo").hide();
			}
			function enterExam(){
				window.location.href=action;
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
							<!-- 加载考试的数据 -->
							<tbody id="examBody">
								
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
			
			<div class="modal" id="confirmInfo">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">请确认考生信息</h4>
							<button id="close" type="button" class="close" data-dismiss="modal" onclick="closeWin()">&times;</button>
						</div>
					
						<!-- 模态框主体 -->
						<div class="modal-body">
							<p>姓名:${sessionScope.user.sname}</p>
							<p>身份证号:${sessionScope.user.idcardnum}</p>
							<p>确认进入考试？</p>
						</div>
					
						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a id="sure" href="javascript:;" type="button" class="btn btn-outline-light text-dark" onclick="enterExam()">确定</a>
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
							<form action="${pageContext.request.contextPath }/stu_modifyPsw" method="post">
							  <fieldset class="form-group">
							    <label for="oldPassword">请输入旧密码：</label>
							    <input type="password" class="form-control" id="oldPassword" placeholder="Enter old password" onblur="checkOldPassword(this)">
							    <span id="oldPasswordTip"></span>
							    <!--<small class="text-muted">We'll never share your email with anyone else.</small>-->
							  </fieldset>
							  <fieldset class="form-group">
							    <label for="newPassword">请输入新密码：</label>
							    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password">
							  </fieldset>
							  <fieldset class="form-group">
							    <label for="newPasswordAgain">请再次输入新密码：</label>
							    <input type="password" class="form-control" id="newPasswordAgain" placeholder="Enter again" onkeyup="
							    checkNewPswModify(this)">
							    <span id="newPasswordTip"></span>
							  </fieldset>
							  <fieldset class="form-group">
							    <div class="text-center">
							      <button id="modifyPsw" id="submit" disabled="disabled" type ="submit" class="btn">修改</button>
							    </div> 
							  </fieldset>

							</form>
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

	<script type="text/javascript">
		// 修改密码的js代码
		// 首先对比输入的旧密码是否正确
		function checkOldPassword(obj){
			if($("#oldPassword").val() != "${sessionScope.user.password}"){
				$("#oldPasswordTip").html("旧密码输入不正确！");
				$("#oldPasswordTip").addClass("erroTip");
			}else{
				$("#oldPasswordTip").html("旧密码输入正确！");
				$("#oldPasswordTip").removeClass("erroTip");
				$("#oldPasswordTip").addClass("trueTip");
			}
		}

		//检查两次输入的新密码是否正确
		function checkNewPswModify(obj){
			//密码不一致
			if($("#newPassword").val() != $("#newPasswordAgain").val()){
				$("#newPasswordTip").html("两次密码输入不一致！");
				$("#newPasswordTip").addClass("erroTip");
			}else{
				$("#newPasswordTip").html("可以修改密码！");
				$("#newPasswordTip").removeClass("erroTip");
				$("#newPasswordTip").addClass("trueTip");

				$("#modifyPsw").removeAttr("disabled");
			}
		}

	</script>

</html>