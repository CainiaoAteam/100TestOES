<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<h1>100Test</h1>
					</a>
					<div> 
						<a style="text-align: right;">欢迎你！${sessionScope.user.adminname}</a>
						<a class="user_a" href="${pageContext.request.contextPath }/login_logout">退出</a>
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
						<form action="">
							<div class="input-group">
								<sapn>试卷状态：</sapn>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="tp_state_0" value="all" name="TPState">
									<label for="tp_state_0">全部</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="tp_state_1" value="checked" name="TPState">
									<label for="tp_state_1">已审核</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="tp_state_2" value="unchecked" name="TPState">
									<label for="tp_state_2">未审核</label>
								</div>
							</div>
						</form>
						
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>
										<div class="card">
											<div class="card-header input-group">
												<h3 name="examTitle">全国英语四级考试</h3>
												<div style="margin-left: auto">
													<a class="btn btn-outline-success btn-sm" role="button" value="examID" id="pass-examID" onclick="passExam(this)">通过审核</a>
													<a class="btn btn-outline-secondary btn-sm" role="button" value="examID" id="unpass-examID" onclick="unpassExam(this)" >审核不通过</a>
												</div>
											</div>
											<div class="card-body">
												<!-- <h4 class="card-title" name="examTitle">全国英语四级考试</h4> -->
												<p>试卷编号: <span class="card-text">1531p</span></p>
												<p>考试时间: <span class="card-text">2018年8月8日 </span>
															<span class="card-text">9:00-11:30</span>
												</p>
												<span>审核状态：</span><span id="tpState">待审核</span>
												<a href="seeExamPaper.html?examID=''" class="card-link">
													<p style="padding-top:10px;">查看试卷</p>
												</a>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>		
					</div>
					<div id="stu_manage" class="container tab-pane fade">
						<div class="input-group card-header">
							<div>
								<form class="form-inline">
									<input class="form-control"  type="text " name="key" placeholder="学生信息">
									<button class="btn btn-success-outline " type="submit ">Search</button>
								</form>
							</div>
							<div style="margin-left:auto;">
								<a href="" data-toggle="modal" data-target="#addStu"> <button class="btn btn-outline-info btn-sm">添加学生</button></a>
							</div>
						</div>
						<table class="table">
							<thead class="thead-inverse">
								<tr>
									<th>#</th>
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>身份证号</th>
									<th>系别</th>
									<th>班别</th>
									<th>手机号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>201524133215</td>
									<td>张创恒</td>
									<td>男</td>
									<td>445381199608250457</td>
									<td>软件学院</td>
									<td>15软件2班</td>
									<td>15767515364</td>
									<td><a class="btn btn-outline-secondary btn-sm" href="">删除</a></td>
								</tr>
							</tbody>
						</table>
								  
					</div>
					<div id="tea_manage" class="container tab-pane fade">
						<div class="input-group card-header">
								<div>
									<form class="form-inline">
										<input class="form-control"  type="text " name="key" placeholder="教师信息">
										<button class="btn btn-success-outline " type="submit ">Search</button>
									</form>
								</div>
								<div style="margin-left:auto;">
									<a href="" data-toggle="modal" data-target="#addTea"> <button class="btn btn-outline-info btn-sm">添加教师</button></a>
								</div>
							</div>
							<table class="table">
								<thead class="thead-inverse">
									<tr>
										<th>#</th>
										<th>教工号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>身份证号</th>
										<th>手机号</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>201524133215</td>
										<td>张创恒</td>
										<td>男</td>
										<td>445381199608250457</td>
										<td>15767515364</td>
										<td><a class="btn btn-outline-secondary btn-sm" href="">删除</a></td>
									</tr>
								</tbody>
							</table>
					</div>
					<div id="info_manage" class="container tab-pane fade">
						<table class="table table-hover" style="border: hidden;">
							<tbody>
								<tr>
									<td><p style="text-align: center;">ID:</p></td>
									<td>${sessionScope.user.adminid}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">称呼:</p></td>
									<td>${sessionScope.user.adminname}</td>
								</tr>
								<tr>
									<td><a href="" data-toggle="modal" data-target="#changePaw"><p style="text-align: center;">修改密码</p></a></td>
									
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
							<form action="${pageContext.request.contextPath }/admin_modifyPsw" method="post">
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
			<div class="modal fade" id="addStu">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">添加学生 </h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- 模态框主体 -->
						<div class="modal-body">
							<form action="" method="post">
								<fieldset class="form-group">
									<label for="sutNo">请输入学号:</label>
									<input type="text" class="form-control" id="sutNo" placeholder="Enter Student no" onblur="">
									<span id="sutNoTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label for="sutName">请输入姓名:</label>
									<input type="text" class="form-control" id="sutName" placeholder="Enter Student name" onblur="">
									<span id="sutNameTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label>性别:</label>
									<div class="form-inline">
										<div class="radio radio-success radio-inline">
											<input type="radio" id="gender_1" value="man" name="gender" checked>
											<label for="gender_1">男</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="gender_2" value="women" name="gender">
											<label for="gender_2">女</label>
										</div>	
									</div>
									
								</fieldset>
								<fieldset class="form-group">
									<label for="idcardnum">身份证号:</label>
									<input type="text" class="form-control" id="idcardnum" placeholder="Enter idcardnum" onblur="">
									<span id="idcardnumTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label for="department">系别:</label>
									<input type="text" class="form-control" id="department" placeholder="Enter department" onblur="">
									<span id="departmentTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label for="grade">班别:</label>
									<input type="text" class="form-control" id="grade" placeholder="Enter grade" onblur="">
									<span id="gradetTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label for="phone">手机号:</label>
									<input type="text" class="form-control" id="phone" placeholder="Enter phone" onblur="">
									<span id="phoneTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<div class="text-center">
										<button id="modifyPsw" id="submit" type ="submit" class="btn">添加</button>
									</div> 
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="addTea">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">添加教师 </h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
							
						<!-- 模态框主体 -->
						<div class="modal-body">
							<form action="" method="post">
								<fieldset class="form-group">
									<label for="tno">请输入教工号:</label>
									<input type="text" class="form-control" id="tno" placeholder="Enter Teacher no" onblur="">
									<span id="tnoTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label for="tname">请输入姓名:</label>
									<input type="text" class="form-control" id="tname" placeholder="Enter Teacher name" onblur="">
									<span id="tnameTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label>性别:</label>
									<div class="form-inline">
										<div class="radio radio-success radio-inline">
											<input type="radio" id="gender_1" value="man" name="gender" checked>
											<label for="gender_1">男</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="gender_2" value="women" name="gender">
											<label for="gender_2">女</label>
										</div>	
									</div>
								</fieldset>
								<fieldset class="form-group">
									<label for="idcardnum">身份证号:</label>
									<input type="text" class="form-control" id="idcardnum" placeholder="Enter idcardnum" onblur="">
									<span id="idcardnumTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<label for="phone">手机号:</label>
									<input type="text" class="form-control" id="phone" placeholder="Enter phone" onblur="">
									<span id="phoneTip"></span>
								</fieldset>
								<fieldset class="form-group">
									<div class="text-center">
										<button id="modifyPsw" id="submit" type ="submit" class="btn">添加</button>
									</div> 
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			var examid;
			function passExam(obj){
				examid=$(obj).attr("value");
				console.log(examid);
				//根据examid加载数据库
				// $("#unpass-examID").removeClass('disabled');
				// $("#pass-examID").addClass('disabled');
				$("#tpState").text("已通过");
				alert("审核已通过！");
			}
			function unpassExam(obj){
				examid=$(obj).attr("value");
				console.log(examid);
				// $("#unpass-examID").addClass('disabled');
				// $("#pass-examID").removeClass('disabled');
				$("#tpState").text("未通过");
			}
		</script>
		
		<script type="text/javascript">
		// 修改密码的js代码
		// 首先对比输入的旧密码是否正确
		function checkOldPassword(obj){
			if($("#oldPassword").val() != "${sessionScope.user.adminpwd}"){
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
	</body>
</html>
 