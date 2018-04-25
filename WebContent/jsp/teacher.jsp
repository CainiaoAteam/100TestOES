<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/build.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mycss.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<style type="text/css">
.user_a {
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
<!-- 郭冠志新增 -->
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

<script type="text/javascript">
	/*// 页面已加载就获取全部的关于该老师的题目
	$(function(){
		var url="${pageContext.request.contextPath }/teacher_getAllQuestion";
		var param={"tid":${sessionScope.tid},"pageBean.pageCode":1};

		$.post(url,param,function(data){
			alert(data);
		},"json");

	});*/

	//点击我的试卷默认加载通过审核的试卷
	function getPaperIsPass(ispass){
		var url = "${pageContext.request.contextPath }/teacher_getPaperIsPass";
		var who = ${sessionScope.user.tid};
		var param = {"paperState":ispass,"who":who};
		var tmp ="";
		var inner ="";
		var sta = ["待审核","通过审核","未通过审核"];

		$.post(url,param,function(data){
			if(data.tip == "no"){
				if(ispass == 1){
					$("#paperBody").html("暂无通过审核的试卷！");
				}else if(ispass == 0){
					$("#paperBody").html("暂无待审核的试卷！");
				}else {
					$("#paperBody").html("暂无未通过审核的试卷！");
				}
			}else{
				$.each(data,function(i,n){
					tmp = "<tr>"+
									"<td>"+
										"<div class='card'>"+
											"<div class='card-body'>"+
												"<h4 class='card-title'>"+n.tpname+"</h4>"+
												"<p class='card-text'>试卷编号:"+n.tpno+"</p>"+
												"<p class='card-text'>状态："+sta[Number(n.state)]+"</p>"+
												"<a href=${pageContext.request.contextPath }/teacher_showPaper?tpid="+n.tpid+" class='card-link'>"+
													"<p style='text-align: right;'>查看试卷</p>"+
												"</a>"+
											"</div>"+
										"</div>"+
									"</td>"+
							"</tr>"
					inner += tmp;
				})
				$("#paperBody").html(inner);
			}
		},"json");

	}

</script>

<!-- 获取成绩管理 -->
<script type="text/javascript">
	//获取关于该老师的所有考试
	function getExamByTid(){
		var url="${pageContext.request.contextPath }/teacher_getAllExamByTid";
		var who = ${sessionScope.user.tid};
		var param = {"who":who};
		var tmp = "";
		var inner = "";
		$.post(url,param,function(data){

			if(data.tip == "no"){
				$("#stuScore").html("你还有发布过考试，暂无学生成绩信息！");
			}else{
				$.each(data,function(i,n){
					tmp = "<option value="+data[i].examid+">"+data[i].examname+"</option>";
					inner += tmp;
				});
				$("#examnameshow").html(inner);
			}

		},"json");

	}
	function showScoreByExamIdForTid(obj){
		var examId = obj.value;
		var url="${pageContext.request.contextPath }/teacher_getExamByTid";
		var param = {"examid":examId};

		var tmp = "";
		var inner = "";
		$.post(url,param,function(data){

			if(data.tip == "no"){
				$("#showScore").html("没有关于该考试的学生成绩！");
			}else{
				$.each(data,function(i,n){
					tmp = "<tr>"+
							"<td>"+(i+1)+"</td>"+
							"<td>"+n.exam.examno+"</td>"+
							"<td>"+n.student.sname+"</td>"+
							"<td>"+n.score+"</td>"+
							"<td><a href='${pageContext.request.contextPath }/exam_showPaper?rid="+n.rid+"'><button class='btn btn-outline-info btn-sm'>答题情况</button></a></td>"+
						"</tr>";
				});
				$("#scorelist").html(inner);
			}

		},"json");
	}

	//根据考试的情况查看考试
	function getExams(examstate){
		var url = "${pageContext.request.contextPath }/teacher_getPaperIsPass";
		var who = ${sessionScope.user.tid};
		var param = {"paperState":ispass,"who":who};
		var tmp ="";
		var inner ="";
		var sta = ["已考","未考"];

		$.post(url,param,function(data){
			if(data.tip == "no"){
				if(examstate == -1){
					$("#paperBody").html("暂无你发布考试！");
				}else if(examstate == 0){
					$("#paperBody").html("暂无已考试卷！");
				}else {
					$("#paperBody").html("暂无未通过审核的试卷！");
				}
			}else{
				$.each(data,function(i,n){
					tmp = "<tr>"+
									"<td>"+
										"<div class='card'>"+
											"<div class='card-body'>"+
												"<h4 class='card-title'>"+n.tpname+"</h4>"+
												"<p class='card-text'>试卷编号:"+n.tpno+"</p>"+
												"<p class='card-text'>状态："+sta[Number(n.state)]+"</p>"+
												"<a href=${pageContext.request.contextPath }/teacher_showPaper?tpid="+n.tpid+" class='card-link'>"+
													"<p style='text-align: right;'>查看试卷</p>"+
												"</a>"+
											"</div>"+
										"</div>"+
									"</td>"+
							"</tr>"
					inner += tmp;
				})
				$("#paperBody").html(inner);
			}
		},"json");

	}

</script>

</head>

<body background="${pageContext.request.contextPath }/img/index_bg1.jpg">
		<div class="container" style=" background-color: rgba(255,255,255,0.8);">
			<div>
				<nav class="navbar navbar-light bg-faded">
					<a class="navbar-brand">
						<h1>100Test</h1>
					</a>
					<div> 
						<a style="text-align: right;">欢迎你！${sessionScope.user.tname}</a>
						<a class="user_a" href="${pageContext.request.contextPath }/login_logout">退出</a>
					</div>
				</nav>
			</div>
			<div id="mymenu" style="float:left ;  width:17%;  height:100%; text-align: center;">
				<!-- Nav pills -->
				<ul class="nav nav-pills flex-column " role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="pill" href="#myQuestion">我的题目</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#myPaper" onclick="getPaperIsPass(1)">我的试卷</a>
					</li>
					<br />
					<li class="nav-item"><!-- 新增我的发布-->
						<a class="nav-link" data-toggle="pill" href="#releaseExam" onclick="getExams(-1)">发布考试</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#stuScore" onclick="getExamByTid()">学生成绩</a>
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
					<div id="myQuestion" class="container tab-pane active"><!-- 我的题目管理-->
						<div style="height: 50px;text-align: center;margin-left: 10%;margin-top: 3%;">
							<div class="input-group ">
								<input class="form-control col-sm-6 " type="text " placeholder="题目/类型 ">
								<button class="btn btn-success-outline " type="submit ">Search</button>
							</div>
						</div>

						<div style="height: 130px; ">
							<form>
								<div class="input-group">
									<span style="margin-left: 30px; ">题目类型：</span>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sq" value="sq" name="questionType">
										<label for="sq">单选</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="mq" value="mq" name="questionType">
										<label for="mq">多选</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="fq" value="fq" name="questionType">
										<label for="fq">填空</label>
									</div>
								</div>
									
								<div class="input-group">
									<span style="margin-left: 30px; ">题目难度：</span>
									<div class="checkbox checkbox-success">
										<input id="v1" class="styled" type="checkbox" name="difficulty">
										<label for="v1">简单</label>
									</div>
									<div class="checkbox checkbox-success">
										<input id="v2" class="styled" type="checkbox" name="difficulty">
										<label for="v2">容易</label>
									</div>
									<div class="checkbox checkbox-success">
										<input id="v3" class="styled" type="checkbox" name="difficulty">
										<label for="v3">困难</label>
									</div>
									<div class="checkbox checkbox-success">
										<input id="v4" class="styled" type="checkbox" name="difficulty">
										<label for="v4">绝望</label>
									</div>
								</div>
							</form>
							<div class="clearfix ">
								<div class="float-right ">
									<a href="${pageContext.request.contextPath }/jsp/teacher_toAddJsp"><button type="button " class="btn btn-outline-info ">添加题目</button></a>
								</div>
							</div>
						</div>
						<br />
						<div id="accordion">
							<table class="table table-hover">
								<tbody>
									<tr>
										<td>
											<div class="card ">
												<div class="card-header ">
													<label class="mylabel-num">1</label>
													<div class="float-right form-inline">
														<a href="javascript:;" onclick="editQusetion();" class="card-link">编辑</a>
														<a href="" data-toggle="modal" data-target="#deleteQuestion" class="card-link">删除</a>
													</div>
												</div>
												<div class="card-body ">
													<p class="title" >Not until Ibegan to work ____ how much time I had wasted.</p>
													<p class="op1">A. didn't Irealize</p>
													<p class="op2">B. did I realize</p>
													<p class="op3">C. I didn'trealize</p>
													<p class="op4">D. I realized</p>
													<a class="card-link " data-toggle="collapse" data-parent="#accordion " href="#collapse_1 ">
														查看解析
													</a>
												</div>
												<div class="collapse" id="collapse_1 ">
													<div class="card-footer ">
														<p>答案：</p>
														<span class="explain">我也不知道选什么....</span>
													</div>
												</div>
											</div>

										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="margin:0 auto; " align="center ">
							<ul class="pagination pagination-sm ">
								<li class="page-item ">
									<a class="page-link " onclick="loadPrePage()" href="#">上一页</a>
								</li>
								<li class="page-item ">
									<a class="page-link " onclick="loadThisPage()" href="#">1</a>
								</li>
								<li class="page-item active ">
									<a class="page-link " onclick="loadThisPage()" href="#">2</a>
								</li>
								<li class="page-item ">
									<a class="page-link " onclick="loadThisPage()" href="#">3</a>
								</li>
								<li class="page-item ">
									<a class="page-link " onclick="loadNextPage()" href="#">下一页</a>
								</li>
							</ul>
						</div>
					</div>
					<div id="myPaper" class="container tab-pane fade"><!-- 我的试卷管理-->
						<form >
							<div class="input-group">
								<sapn>试卷状态：</sapn>
								<div class="radio radio-success radio-inline">
									<input id="tpSatae2" checked="checked" type="radio" name="state" value="1" onclick="getTestPaperByState(this)">
									<label for="tpSatae2">通过审核</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input id="tpSatae1" type="radio" name="state" value="2" onclick="getTestPaperByState(this)">
									<label for="tpSatae1">未通过审核</label>
								</div>
								
								<div class="radio radio-success radio-inline">
									<input id="tpSatae3" type="radio" name="state" value="0" onclick="getTestPaperByState(this)">
									<label for="tpSatae3">待审核</label>
								</div>
							</div>
						</form>
						<div class="clearfix ">
							<div class="float-right">
								<a href="${pageContext.request.contextPath }/teacher_addExamPaper"><button type="button " class="btn btn-outline-info ">制作新试卷</button></a>
							</div>
						</div>
						<table class="table table-hover">
							<tbody id="paperBody">
							</tbody>
						</table>
					</div>
					<div id="releaseExam" class="container tab-pane fade"><!-- 发布考试-->
						<form>
							<div class="input-group">
								<sapn>考试状态：</sapn>
								<div class="radio radio-success radio-inline">
									<input id="state1" checked="checked" type="radio" name="state" value="2" onclick="getExamByState(this)">
									<label for="state1">全部</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input id="state2"  type="radio" name="state" value="1" onclick="getExamByState(this)">
									<label for="state2">已考</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input id="state3" type="radio" name="state" value="0" onclick="getExamByState(this)">
									<label for="state3">未考</label>
								</div>
								<div class="float-right" style="margin-left: auto">
									<a href="" data-toggle="modal" data-target="#addANewExam"><button type="button " class="btn btn-outline-info btn-sm">发布考试</button></a>
								</div>
							</div>
						</form>
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>
										<div class="card">
											<div class="card-body">
												<h4 class="card-title">全国英语四级考试</h4>
												<p class="card-text">试卷编号：1531p</p>
												<a href="seeExamPaper.html" class="card-link">
													<p style="text-align: right;">查看试卷</p>
												</a>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="stuScore" class="container tab-pane fade"><!-- 查看学生成绩-->
						<div>
							<table class="table table-hover">
							<tbody>
								<tr>
									<td>
										<div class="card">
											<select onchange="showScoreByExamIdForTid(this)" style="width: 280px;height: 35px;padding:20px; margin: 20px;" name="exmaname" id="examnameshow">
												<option value="-1">---请选择查看成绩的考试---</option>
											</select>
										</div>
										<div id="showScore" class="card">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>序号</th>
														<th>考试编号</th>
														<th>学生姓名</th>
														<th>成绩</th>
														<th>查看答题情况</th>
													</tr>
												</thead>
												<tbody id="scorelist">
													
												</tbody>
											</table>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</div>	
					</div>

					<div id="myInfo" class="container tab-pane fade">
						<table class="table table-hover" style="border: hidden;">
							<tbody>
								<tr>
									<td><p style="text-align: center;">教师编号:</p></td>
									<td>${sessionScope.user.tno}</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">姓名:</p></td>
									<td>${sessionScope.user.tname}</td>
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
									<td><p style="text-align: center;">电话:</p></td>
									<td>${sessionScope.user.phone}</td>
								</tr>
								<tr>
									<!-- 郭冠志修改 -->
									<td><a href="" data-toggle="modal" data-target="#changePaw"><p style="text-align: center;">修改密码</p></a></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="about" class="container tab-pane fade"><!-- 关羽-->
						<div>
							<h3 align="center">欢迎使用100test在线考试系统</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="deleteQuestion"><!-- 删除试卷的提示框-->
				<div class="modal-dialog modal-sm">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">删除题目</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- 模态框主体 -->
						<div class="modal-body">
							<p>确定删除该题目？</p>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="examing.html" type="button" class="btn btn-outline-light text-dark">确定</a>
						</div>

					</div>
				</div>
			</div>
			<div class="modal fade" id="editSq"><!-- 修改单选题题目-->
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">修改题目</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- 模态框主体 -->
						<div class="modal-body">
							<form action="">
								<div class="form-group">
									<div class="input-group">
										<sapn>题目难度：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty1" value="v1" name="sqdifficulty" >
											<label for="sqdifficulty1">简单</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty2" value="v2" name="sqdifficulty">
											<label for="sqdifficulty2">普通</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty3" value="v3" name="sqdifficulty">
											<label for="sqdifficulty3">困难</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty4" value="v4" name="sqdifficulty">
											<label for="sqdifficulty4">绝望</label>
										</div>
									</div>
									
									<div class="input-group">
										<sapn>题目答案：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer1" value="A" name="sqanswer" >
											<label for="sqanswer1">A</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer2" value="B" name="sqanswer">
											<label for="sqanswer2">B</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer3" value="C" name="sqanswer">
											<label for="sqanswer3">C</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer4" value="D" name="sqanswer">
											<label for="sqanswer4">D</label>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header">
											<h5>题目:</h5>
											<textarea class="form-control" name="squestion"></textarea>
										</div>
										<div class="card-body">
											<div class="">
												<span style="margin:7px 8px;">选项A:</span>
												<input class="form-control"  type="text" name="schoiceA" placeholder=""/>
												<span style="margin:7px 8px;">选项B:</span>
												<input class="form-control"  type="text" name="schoiceB" placeholder=""/>
												<span style="margin:7px 8px;">选项C:</span>
												<input class="form-control"  type="text" name="schoiceC" placeholder=""/>
												<span style="margin:7px 8px;">选项D:</span>
												<input class="form-control"  type="text" name="schoiceD" placeholder=""/>
												<span style="margin:7px 8px;">解析:</span>
												<textarea class="form-control" name="sqExplain"></textarea>
											</div>
										</div>
	
									</div>
								</div>
							</form>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="" type="button" class="btn btn-outline-light text-dark">确定修改</a>
						</div>

					</div>
				</div>
			</div>
			<div class="modal fade" id="editMq"><!-- 修改多选题题目-->
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">修改题目</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- 模态框主体 -->
						<div class="modal-body">
							<form action="">
								<div class="form-group">
									<div class="input-group">
										<sapn>题目难度：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty1" value="v1" name="mqdifficulty" >
											<label for="mqdifficulty1">简单</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty2" value="v2" name="mqdifficulty">
											<label for="mqdifficulty2">普通</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty3" value="v3" name="mqdifficulty">
											<label for="mqdifficulty3">困难</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty4" value="v4" name="mqdifficulty">
											<label for="mqdifficulty4">绝望</label>
										</div>
									</div>
									
									<div class="input-group">
										<sapn>题目答案：</sapn>
										<div class="checkbox checkbox-success">
											<input id="mqanswer1" class="styled" name="mqanswer" type="checkbox">
											<label for="mqanswer1">A</label>
										</div>
										<div class="checkbox checkbox-success">
											<input id="mqanswer2" class="styled" name="mqanswer" type="checkbox">
											<label for="mqanswer2">B</label>
										</div>
										<div class="checkbox checkbox-success">
											<input id="mqanswer3" class="styled" name="mqanswer" type="checkbox">
											<label for="mqanswer3">C</label>
										</div>
										<div class="checkbox checkbox-success">
											<input id="mqanswer4" class="styled" name="mqanswer" type="checkbox">
											<label for="mqanswer4">D</label>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header">
											<h5>题目:</h5>
											<textarea class="form-control" name="mquestion"></textarea>
										</div>
										<div class="card-body">
											<div class="">
												<span style="margin:7px 8px;">选项A:</span>
												<input class="form-control"  type="text" name="mchoiceA" placeholder=""/>
												<span style="margin:7px 8px;">选项B:</span>
												<input class="form-control"  type="text" name="mchoiceB" placeholder=""/>
												<span style="margin:7px 8px;">选项C:</span>
												<input class="form-control"  type="text" name="mchoiceC" placeholder=""/>
												<span style="margin:7px 8px;">选项D:</span>
												<input class="form-control"  type="text" name="mchoiceD" placeholder=""/>
												<span style="margin:7px 8px;">解析:</span>
												<textarea class="form-control" name="mqExplain"></textarea>
											</div>
										</div>
	
									</div>
								</div>
							</form>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="" type="button" class="btn btn-outline-light text-dark">确定修改</a>
						</div>

					</div>
				</div>
			</div>
			<div class="modal fade" id="editFq"><!-- 修改填空题题目-->
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">修改题目</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- 模态框主体 -->
						<div class="modal-body">
							<form>
								<div class="form-group">
									<div class="input-group">
										<sapn>题目难度：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty1" value="v1" name="fqdifficulty">
											<label for="fqdifficulty1">简单</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty2" value="v2" name="fqdifficulty">
											<label for="fqdifficulty2">普通</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty3" value="v3" name="fqdifficulty">
											<label for="fqdifficulty3">困难</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty4" value="v4" name="fqdifficulty">
											<label for="fqdifficulty4">绝望</label>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header">
											<h5>题目:</h5>
											<textarea class="form-control" name="fquestion"></textarea>
										</div>
										<div class="card-body">
											<div class="">
												<span style="margin:7px 8px;">答案:</span>
												<textarea class="form-control" name="fqanswer"></textarea>
												<span style="margin:7px 8px;">解析:</span>
												<textarea class="form-control" name="fqExplain"></textarea>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="" type="button" class="btn btn-outline-light text-dark">确定修改</a>
						</div>

					</div>
				</div>
			</div>
			

			<div class="modal fade" id="addANewExam"><!-- 发布新的考试-->
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">发布考试</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
	
						<!-- 模态框主体 -->
						<div class="modal-body" style="padding:15px;">
							<form action="${pageContext.request.contextPath }/teacher_addExam" method="post">
								<div class="form-group row">
									<label for="exmaname" class="form-control-label" style="margin-top: 8px;">考试名称:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" id="exmaname" name="exam.examname">
									</div>
								</div>
								<div class="form-group row">
									<label for="paper">选择试卷:</label>
									<select id="se-paper" onclick="getAllPaperByTid()" class="form-control" id="paper" style="width:250px;">
										<option value="" name="exam.testpaper.tpid">--请选择试卷--</option>
									</select>
									<span id="paperState"></span>
								</div>
								<br/>
								<div class="form-group row">
									<label for="examday" class="form-control-label" style="margin-top: 8px;">考试日期:</label>
									<div class="col-sm-7">
										<input type="datetime-local" class="form-control" id="examday" name="exam.examday">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="examtime" class="form-control-label" style="margin-top: 8px;">考试时长:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" id="examtime" placeholder="单位/分钟" name="exam.examtime">
									</div>
								</div>
								<div class="form-group row">
									<input type="submit" class="form-control" value="发布考试">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 郭冠志新增 -->
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
							<form action="${pageContext.request.contextPath }/teacher_modifyPsw" method="post">
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

			<div class="myfooter">
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
		
		<script type="text/javascript">
			//获取所有关于该老师的试卷
			function getAllPaperByTid(){
				var url = "${pageContext.request.contextPath }/teacher_getAllPaper";
				var who = ${sessionScope.user.tid};
				var param = {"tid":who};
				var tmp = "";
				var inner = "";

				$.post(url,param,function(data){
					data = eval("("+data+")");

					console.log(data);
					if(data.tip == "no"){
						$("#paperState").html("<p style='color:red;'>你赞无可选择的试卷！</p>");
					}else{
						$.each(data,function(i,n){
							tmp="<option value="+data[i].tpid+" name='exam.testpaper.tpid'>"+data[i].tpname+"</option>";
						});
						$("#se-paper").html(inner);
					}
				},"json");

			}
		</script>

		<script>//这是修改题目时的js
			function editQusetion(){
				var qtype = $("input[name='questionType']:checked").val();//获取题目的类型（是单选还是多选）
				//alert(qtype);
				if(qtype=='sq'){//如果是单选，把数据填进--修改单选题的提示框
					$("input:radio[name='sqdifficulty']").eq(0).attr("checked",true);//设置题目难度为...
					$("input:radio[name='sqanswer']").eq(0).attr("checked",true);//设置题目答案为...
					$("textarea[name='squestion']").val("hahah");//设置题目问题为...
					$("input[name='schoiceA']").val("aaaaa");//设置题目选项为...
					$("input[name='schoiceB']").val("aaaaa");
					$("input[name='schoiceC']").val("aaaaa");
					$("input[name='schoiceD']").val("aaaaa");
					$("textarea[name='sqExplain']").val("hahah");//设置题目解析为...
					$("#editSq").modal('show');
				}else if(qtype=='mq'){//如果是多选
					$("input:radio[name='mqdifficulty']").eq(1).attr("checked",true);
					$("input:checkbox[name='mqanswer']").eq(1).attr("checked",true);
					$("textarea[name='mquestion']").val("1111");
					$("input[name='mchoiceA']").val("1111");
					$("input[name='mchoiceB']").val("1111");
					$("input[name='mchoiceC']").val("1111");
					$("input[name='mchoiceD']").val("1111");
					$("textarea[name='mqExplain']").val("1111");
					$("#editMq").modal('show');
				}else if(qtype=='fq'){//如果是填空
					$("input:radio[name='fqdifficulty']").eq(2).attr("checked",true);
					$("textarea[name='fquestion']").val("123");
					$("textarea[name='fqanswer']").val("123");
					$("textarea[name='fqExplain']").val("123");
					$("#editFq").modal('show');
				}
			}
		</script>
		<script type="text/javascript">
			// 根据试卷状态加载试卷
			function getTestPaperByState(obj){
				getPaperIsPass(obj.value);
			}
		</script>
	<body/>

</html>