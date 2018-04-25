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
		
		<script type="text/javascript">
			$(function(){
				//
				getTestPaper();
				getStudents();
				getTeachers();
	
			});
			function getStudents(){
				var url = "${pageContext.request.contextPath }/admin_getAllStudents";//getAllStudents
				var param = {};
				$.post(url,param,function(data){loadStu(data)},"json");
			}
			
			function getTeachers(){
				var url = "${pageContext.request.contextPath }/admin_getAllTeachers";//
				var param = {};
				$.post(url,param,function(data){loadTea(data)},"json");
			}
			
			function getTestPaper(){
				var url = "${pageContext.request.contextPath }/admin_getAllTestPaper";//getAllStudents
				var param = {};
				$.post(url,param,function(data){loadPaper(data)},"json");
			}
			
		</script>
		<script>//加载数据
			function loadStu(data){//加载学生数据
				var nobody="<h3 style='color:red;'>暂无数据！</h3>"
				var tou = "<tr><th>学号</th><th>姓名</th><th>性别</th><th>身份证号</th><th>系别</th><th>班别</th><th>手机号</th><th>操作</th></tr>";
				var info = "";
				var item = "";
				if(data == ""){
					$("#stus_info").html(nobody);
					alert("没有数据！");
					return;
				}
				$.each(data,function(i,n){
					
					 item = "<tr>"+
								"<td>"+data[i].sno+"</td>"+
								"<td>"+data[i].sname+"</td>"+
								"<td>"+data[i].gender+"</td>"+
								"<td>"+data[i].idcardnum+"</td>"+
								"<td>"+data[i].department+"</td>"+
								"<td>"+data[i].grade+"</td>"+
								"<td>"+data[i].phone+"</td>"+
								"<td><a class='btn btn-outline-secondary btn-sm' href='${pageContext.request.contextPath }/admin_delStu?sid="+data[i].sid+"'>删除</a></td>"+
							"</tr>";
					info += item; 
				});
				$("#stus_head").html(tou);
				$("#stus_info").html(info);
			}
			
			function loadTea(data){//加载教师数据
				var nobody="<h3 style='color:red;'>暂无数据！</h3>";
				var tou = "<tr><th>教工号</th><th>姓名</th><th>性别</th><th>身份证号</th><th>手机号</th><th>操作</th></tr>";
				var info = "";
				var item = "";
				if(data == ""){
					$("#teas_info").html(nobody);
					alert("没有数据！");
					return;
				}
				$.each(data,function(i,n){
					
						item = "<tr>"+
								"<td>"+data[i].tno+"</td>"+
								"<td>"+data[i].tname+"</td>"+
								"<td>"+data[i].gender+"</td>"+
								"<td>"+data[i].idcardnum+"</td>"+
								"<td>"+data[i].phone+"</td>"+
								"<td><a class='btn btn-outline-secondary btn-sm' href='${pageContext.request.contextPath }/admin_delTea?tid="+data[i].tid+"'>删除</a></td>"+
							"</tr>";
					info += item; 
				});
				$("#teas_head").html(tou);
				$("#teas_info").html(info);
			}

			function loadPaper(data){//加载试卷
				var nopaper="<h3 style='color:red;'>暂无数据！</h3>";
				var info = "";
				var item = "";
				if(data == ""){
					$("#thePapers").html(nobody);
					alert("没有数据！");
					return;
				}
				var state=new Array();
					state[0]="未审核";
					state[1]="通过审核";
					state[2]="不通过审核";
				$.each(data,function(i,n){
					var state_index=Number(data[i].state);
					item = "<tr><td><div class='card'>"+
								"<div class='card-header input-group'>"+
									"<h3>"+data[i].tpname+"</h3>"+
									"<div style='margin-left: auto'>"+
										"<a class='btn btn-outline-success btn-sm' role='button' value='"+data[i].tpid+"'  onclick='passExam(this)'>通过审核</a>"+
										"<a class='btn btn-outline-secondary btn-sm' role='button' value='"+data[i].tpid+"' onclick='unpassExam(this)' >审核不通过</a>"+
									"</div>"+
								"</div>"+
								"<div class='card-body'>"+
									"<p>试卷编号: <span class='card-text'>"+data[i].tpno+"</span></p>"+
									"<span>审核状态："+state[state_index]+"</span>"+
									"<a href='' value='"+data[i].tpid+"' onclick='seePaper(this)' class='card-link'><p style='padding-top:10px;'>查看试卷</p></a>"+
								"</div>"+
						"</div></td></tr>";
					info += item; 
				});
				$("#thePapers").html(info);
			}
		</script>
		<script type="text/javascript">//查找用户
			function stuFind(){
				var url = "${pageContext.request.contextPath }/admin_findStuByKey";//
				var key=$("#stu_key").val();
				var param = {"stu_key":key};
				$("#stus_head").empty();
				$("#stus_info").empty();
				$.post(url,param,function(data){loadStu(data)},"json");
			}
			function teaFind(){
				var url = "${pageContext.request.contextPath }/admin_findTeaByKey";//
				var key=$("#tea_key").val();
				var param = {"tea_key":key};
				$("#teas_head").empty();
				$("#teas_info").empty();
				$.post(url,param,function(data){loadTea(data)},"json");
			}
		</script>
		<script>//添加用户
			function addAStu(){
				var newsno=$("#sno").val();
				var newsname = $("#sname").val();
				var newsgender=$("input[name='addstu_gender']:checked").val();
				var newsidcardnum=$("#addstu_idcardnum").val();
				var newdepartment=$("#addstu_department").val();
				var newgrade= $("#addstu_grade").val();
				var newsphone=$("#addstu_phone").val();
				var param = {"sno":newsno,"sname":newsname,"sgender":newsgender,"sidcardnum":newsidcardnum,
							"department":newdepartment,"grade":newgrade,"sphone":newsphone};
				var url = "${pageContext.request.contextPath }/admin_addAStu";
				$.post(url,param,function(data){StuTips(data)},"json");	
			}
			function StuTips(data){
				if(data>0){
					getStudents();
					alert("添加成功！");
				}else{
					alert("添加失败！");
				}
			}
			function addATea(){
				var newtno=$("#tno").val();
				var newtname = $("#tname").val();
				var newtgender=$("input[name='addtea_gender']:checked").val();
				var newtidcardnum=$("#addtea_idcardnum").val();
				var newtphone=$("#addtea_phone").val();
				var param = {"tno":newtno,"tname":newtname,"tgender":newtgender,"tidcardnum":newtidcardnum,"tphone":newtphone};
				var url = "${pageContext.request.contextPath }/admin_addATea";
				$.post(url,param,function(data){TeaTips(data)},"json");	
			}
			function TeaTips(data){
				if(data>0){
					getTeachers();
					alert("添加成功！");
				}else{
					alert("添加失败！");
				}
			}

		</script>
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
								<span>试卷状态：</span>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="tp_state_0" value="all" name="TPState" checked>
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
							<tbody id="thePapers">
							</tbody>
						</table>		
					</div>
					<div id="stu_manage" class="container tab-pane fade">
						<div class="input-group card-header">
							<input class="form-control col-6"  type="text" id="stu_key" name="stu_key" placeholder="学生信息">
							<button class="btn btn-success-outline"  onclick ="stuFind();">Search</button>
							
							<div style="margin-left:auto;">
								<a href="" data-toggle="modal" data-target="#addStu"> <button class="btn btn-outline-info btn-sm">添加学生</button></a>
							</div>
						</div>
						<table class="table">
							<thead class="thead-inverse" id="stus_head">
							</thead>
							<tbody id="stus_info">
							</tbody>
						</table>
								  
					</div>
					<div id="tea_manage" class="container tab-pane fade">
						<div class="input-group card-header">
								
								<input class="form-control col-6"  type="text" id="tea_key"  name="tea_key" placeholder="教师信息">
								<button class="btn btn-success-outline " onclick ="teaFind();">Search</button>
									
								<div style="margin-left:auto;">
									<a href="" data-toggle="modal" data-target="#addTea"> <button class="btn btn-outline-info btn-sm">添加教师</button></a>
								</div>
							</div>
							<table class="table">
								<thead class="thead-inverse" id="teas_head">
								</thead>
								<tbody id="teas_info">
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
			
			<div class="modal fade" id="changePaw"><!-- 修改密码 -->
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
			<div class="modal fade" id="addStu"><!-- 添加学生 -->
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">添加学生 </h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- 模态框主体 -->
						<div class="modal-body">
							<fieldset class="form-group">
								<label for="sno">请输入学号:</label>
								<input type="text" class="form-control" id="sno" placeholder="Enter Student no">
								
							</fieldset>
							<fieldset class="form-group">
								<label for="sname">请输入姓名:</label>
								<input type="text" class="form-control" id="sname" placeholder="Enter Student name">
							</fieldset>
							<fieldset class="form-group">
								<label>性别:</label>
								<div class="form-inline">
									<div class="radio radio-success radio-inline">
										<input type="radio" id="stu_gender_man" value="男" name="addstu_gender" checked>
										<label for="stu_gender_man">男</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="stu_gender_women" value="女" name="addstu_gender">
										<label for="stu_gender_women">女</label>
									</div>	
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label for="addstu_idcardnum">身份证号:</label>
								<input type="text" class="form-control" id="addstu_idcardnum" placeholder="Enter idcardnum">
							</fieldset>
							<fieldset class="form-group">
								<label for="addstu_department">系别:</label>
								<input type="text" class="form-control" id="addstu_department" placeholder="Enter department">
							</fieldset>
							<fieldset class="form-group">
								<label for="addstu_grade">班别:</label>
								<input type="text" class="form-control" id="addstu_grade" placeholder="Enter grade">
							
							</fieldset>
							<fieldset class="form-group">
								<label for="addstu_phone">手机号:</label>
								<input type="text" class="form-control" id="addstu_phone" placeholder="Enter phone">
							</fieldset>

							<div class="modal-footer">
								<button onclick="addAStu();" type="button" data-dismiss="modal" class="btn btn-outline-light text-dark">添加</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="addTea"><!-- 添加教师 -->
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">添加教师 </h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
							
						<!-- 模态框主体 -->
						<div class="modal-body">
							<fieldset class="form-group">
								<label for="tno">请输入教工号:</label>
								<input type="text" class="form-control" id="tno" placeholder="Enter Teacher no">
								
							</fieldset>
							<fieldset class="form-group">
								<label for="tname">请输入姓名:</label>
								<input type="text" class="form-control" id="tname" placeholder="Enter Teacher name">
							</fieldset>
							<fieldset class="form-group">
								<label>性别:</label>
								<div class="form-inline">
									<div class="radio radio-success radio-inline">
										<input type="radio" id="tea_gender_man" value="男" name="addtea_gender" checked>
										<label for="tea_gender_man">男</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="tea_gender_women" value="女" name="addtea_gender">
										<label for="tea_gender_women">女</label>
									</div>	
								</div>
							</fieldset>
							<fieldset class="form-group">
								<label for="addtea_idcardnum">身份证号:</label>
								<input type="text" class="form-control" id="addtea_idcardnum" placeholder="Enter idcardnum">
							</fieldset>
							<fieldset class="form-group">
								<label for="addtea_phone">手机号:</label>
								<input type="text" class="form-control" id="addtea_phone" placeholder="Enter phone">
							</fieldset>

							<div class="modal-footer">
								<button onclick="addATea();" type="button" data-dismiss="modal" class="btn btn-outline-light text-dark">添加</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>//审核试卷
			function passExam(obj){
				var paperid=$(obj).attr("value");
				var url = "${pageContext.request.contextPath }/admin_passPaper";//getAllStudents
				var param = {"tpid":paperid};
				$.post(url,param,function(data){checkTips(data)},"json");
				getTestPaper();
			}
			function unpassExam(obj){
				var paperid=$(obj).attr("value");
				console.log(paperid);

				var url = "${pageContext.request.contextPath }/admin_unpassPaper";//getAllStudents
				var param = {"tpid":paperid};
				$.post(url,param,function(data){checkTips(data);},"json");
				getTestPaper();
			}
			function checkTips(data){
				if(data>0){
					getStudents();
					alert("审核已通过");
				}else{
					alert("取消通过成功！");
				}
				getTestPaper();
			}
		</script>
		
		<script>
			function seePaper(obj){
				var paperid=$(obj).attr("value");
				//window.location.href="${pageContext.request.contextPath }/admin_seePaper?tpid="+paperid;	
				 var url = "${pageContext.request.contextPath }/admin_seePaper";//getAllStudents
				 var param = {"tpid":paperid};
				 $.post(url,param,function(data){},"json");
			}
			function toSeePaper(){
				//window.location.href=
			}
		</script>

		<script type="text/javascript">// 修改密码的js代码
		
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
 