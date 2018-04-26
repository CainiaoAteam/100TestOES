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
							<div class="timu_type">
								<div class="input-group">
									<span style="margin-left: 30px; ">题目类型：</span>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sq" value="sq" name="questionType" checked>
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
							</div>	
							<div class="timu_difficulty">
								<div class="input-group">
									<span style="margin-left: 30px; ">题目难度：</span>
									<div class="radio radio-success radio-inline">
										<input id="v0" type="radio" value="全部" name="difficulty" checked>
										<label for="v0">全部</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input id="v1" type="radio" value="简单" name="difficulty">
										<label for="v1">简单</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input id="v2" type="radio" value="一般" name="difficulty">
										<label for="v2">一般</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input id="v3" type="radio" value="困难" name="difficulty">
										<label for="v3">困难</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input id="v4" type="radio" value="绝望" name="difficulty">
										<label for="v4">困难</label>
									</div>
								</div>
							</div>
							<div class="clearfix ">
								<div class="float-right ">
									<a href="${pageContext.request.contextPath }/jsp/teacher_toAddJsp"><button type="button " class="btn btn-outline-info ">添加题目</button></a>
								</div>
							</div>
						</div>
						<br />
						<div id="accordion">
							<table class="table table-hover">
								<tbody id="loadQuestion">
									
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
								<span>考试状态：</span>
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
							<form action="${pageContext.request.contextPath }/teacher_updataSQ" method="POST" id="newSQ">
								<div class="form-group">
									<div class="input-group">
										<sapn>题目难度：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty1" value="简单" name="singleQuestion.difficulty" >
											<label for="sqdifficulty1">简单</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty2" value="普通" name="singleQuestion.difficulty">
											<label for="sqdifficulty2">普通</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty3" value="困难" name="singleQuestion.difficulty">
											<label for="sqdifficulty3">困难</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqdifficulty4" value="绝望" name="singleQuestion.difficulty">
											<label for="sqdifficulty4">绝望</label>
										</div>
									</div>
									
									<div class="input-group">
										<sapn>题目答案：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer1" value="A" name="singleQuestion.sanswer" >
											<label for="sqanswer1">A</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer2" value="B" name="singleQuestion.sanswer">
											<label for="sqanswer2">B</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer3" value="C" name="singleQuestion.sanswer">
											<label for="sqanswer3">C</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="sqanswer4" value="D" name="singleQuestion.sanswer">
											<label for="sqanswer4">D</label>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header">
											<h5>题目:</h5>
											<textarea class="form-control" name="singleQuestion.squestion"></textarea>
										</div>
										<div class="card-body">
											<div class="">
												<span style="margin:7px 8px;">选项A:</span>
												<input class="form-control"  type="text" name="singleQuestion.schoiceA" placeholder=""/>
												<span style="margin:7px 8px;">选项B:</span>
												<input class="form-control"  type="text" name="singleQuestion.schoiceB" placeholder=""/>
												<span style="margin:7px 8px;">选项C:</span>
												<input class="form-control"  type="text" name="singleQuestion.schoiceC" placeholder=""/>
												<span style="margin:7px 8px;">选项D:</span>
												<input class="form-control"  type="text" name="singleQuestion.schoiceD" placeholder=""/>
												<span style="margin:7px 8px;">解析:</span>
												<textarea class="form-control" name="singleQuestion.sexplanation"></textarea>
											</div>
										</div>
	
									</div>
								</div>
							</form>
						</div>
						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button onclick="updataSQ()" data-dismiss="modal" class="btn btn-outline-light text-dark">确定修改</button>
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
						<!-- 模态框主体mutipleQuestion.manswers -->
						<div class="modal-body">
							<form action="" id="newMQ">
								<div class="form-group">
									<div class="input-group">
										<sapn>题目难度：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty1" value="简单" name="mutipleQuestion.difficulty" >
											<label for="mqdifficulty1">简单</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty2" value="普通" name="mutipleQuestion.difficulty">
											<label for="mqdifficulty2">普通</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty3" value="困难" name="mutipleQuestion.difficulty">
											<label for="mqdifficulty3">困难</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="mqdifficulty4" value="绝望" name="mutipleQuestion.difficulty">
											<label for="mqdifficulty4">绝望</label>
										</div>
									</div>
									
									<div class="input-group">
										<sapn>题目答案：</sapn>
										<div class="checkbox checkbox-success">
											<input id="mqanswer1" class="styled" value="A" name="mutipleQuestion.manswers" type="checkbox">
											<label for="mqanswer1">A</label>
										</div>
										<div class="checkbox checkbox-success">
											<input id="mqanswer2" class="styled" value="B" name="mutipleQuestion.manswers" type="checkbox">
											<label for="mqanswer2">B</label>
										</div>
										<div class="checkbox checkbox-success">
											<input id="mqanswer3" class="styled" value="C" name="mutipleQuestion.manswers" type="checkbox">
											<label for="mqanswer3">C</label>
										</div>
										<div class="checkbox checkbox-success">
											<input id="mqanswer4" class="styled" value="D" name="mutipleQuestion.manswers" type="checkbox">
											<label for="mqanswer4">D</label>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header">
											<h5>题目:</h5>
											<textarea class="form-control" name="mutipleQuestion.mquestion"></textarea>
										</div>
										<div class="card-body">
											<div class="">
												<span style="margin:7px 8px;">选项A:</span>
												<input class="form-control"  type="text" name="mutipleQuestion.mchoiceA" placeholder=""/>
												<span style="margin:7px 8px;">选项B:</span>
												<input class="form-control"  type="text" name="mutipleQuestion.mchoiceB" placeholder=""/>
												<span style="margin:7px 8px;">选项C:</span>
												<input class="form-control"  type="text" name="mutipleQuestion.mchoiceC" placeholder=""/>
												<span style="margin:7px 8px;">选项D:</span>
												<input class="form-control"  type="text" name="mutipleQuestion.mchoiceD" placeholder=""/>
												<span style="margin:7px 8px;">解析:</span>
												<textarea class="form-control" name="mutipleQuestion.mexplanation"></textarea>
											</div>
										</div>
	
									</div>
								</div>
							</form>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button onclick="updataMQ();" data-dismiss="modal" class="btn btn-outline-light text-dark">确定修改</button>
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
							<form id="newFQ" action="">
								<div class="form-group">
									<div class="input-group">
										<sapn>题目难度：</sapn>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty1" value="简单" name="fillQuestion.difficulty">
											<label for="fqdifficulty1">简单</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty2" value="普通" name="fillQuestion.difficulty">
											<label for="fqdifficulty2">普通</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty3" value="困难" name="fillQuestion.difficulty">
											<label for="fqdifficulty3">困难</label>
										</div>
										<div class="radio radio-success radio-inline">
											<input type="radio" id="fqdifficulty4" value="绝望" name="fillQuestion.difficulty">
											<label for="fqdifficulty4">绝望</label>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header">
											<h5>题目:</h5>
											<textarea class="form-control" name="fillQuestion.fquestion"></textarea>
										</div>
										<div class="card-body">
											<div class="">
												<span style="margin:7px 8px;">答案:</span>
												<textarea class="form-control" name="fillQuestion.fanswer"></textarea>
												<span style="margin:7px 8px;">解析:</span>
												<textarea class="form-control" name="fillQuestion.fexplanation"></textarea>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button onclick="updataFQ();" data-dismiss="modal" class="btn btn-outline-light text-dark">确定修改</button>
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

		
		<script type="text/javascript">
			// 根据试卷状态加载试卷
			function getTestPaperByState(obj){
				getPaperIsPass(obj.value);
			}
		</script>

		<script>//加载题目---zch
			$(function(){
				getSQuestion();
			});

			$(document).on('click', '.timu_type :radio', function() {
				var qtype = $(this).val();
				if(qtype=='sq'){
					getSQuestion();
				}else if(qtype=='mq'){
					getMQuestion();
				}else if(qtype=='fq'){
					getFQuestion();
				}
			});
			$(document).on('click', '.timu_difficulty :radio', function() {
				var qtype = $("input[name='questionType']:checked").val();
				if(qtype=='sq'){
					getSQuestion();
				}else if(qtype=='mq'){
					getMQuestion();
				}else if(qtype=='fq'){
					getFQuestion();
				}
			});
			function getSQuestion(){
				var qdiff = $("input[name='difficulty']:checked").val();
				var url = "${pageContext.request.contextPath }/teacher_getSQuestion";//getAllStudents
				var param = {"difficulty":qdiff};
				$.post(url,param,function(data){loadSQ(data)},"json");
			}
			function getMQuestion(){
				var qdiff = $("input[name='difficulty']:checked").val();
				var url = "${pageContext.request.contextPath }/teacher_getMQuestion";//getAllStudents
				var param = {"difficulty":qdiff};
				$.post(url,param,function(data){loadMQ(data)},"json");
			}
			function getFQuestion(){
				var qdiff = $("input[name='difficulty']:checked").val();
				var url = "${pageContext.request.contextPath }/teacher_getFQuestion";//getAllStudents
				var param = {"difficulty":qdiff};
				$.post(url,param,function(data){loadFQ(data)},"json");
			}
			
			function loadSQ(data){
				var noquestion="<h3 style='color:red;'>暂无题目！</h3>";
				var info = "";
				var item = "";
				if(data == ""){
					$("#loadQuestion").html(noquestion);
					alert("没有数据！");
					return;
				}
				$.each(data,function(i,n){
					item = "<tr><td><div class='card'>"+
								"<div class='card-header form-inline'>"+
									"<label class='mylabel-num'>"+i+"</label>"+
									"<div style='margin-left: auto;' class='float-right form-inline'>"+
										"<a class='card-link' href='javascript:;' value='"+data[i].sqid+"' onclick='editQusetion(this);'>编辑</a>"+
										"<a href='javascript:;' onclick='deleteSQ(this);' class='card-link' value='"+data[i].sqid+"' >删除</a>"+
									"</div>"+
								"</div>"+
								"<div class='card-body'>"+
									"<p class='title' >"+data[i].squestion+"</p>"+
									"<p class='op1'>A. "+data[i].schoiceA+"</p>"+
									"<p class='op2'>B. "+data[i].schoiceB+"</p>"+
									"<p class='op3'>C. "+data[i].schoiceC+"</p>"+
									"<p class='op4'>D. "+data[i].schoiceD+"</p>"+
									"<a data-toggle='collapse' data-parent='#accordion' href='#collapse_"+data[i].sqno+"' class='card-link'>查看解析</a>"+
								"</div>"+
								"<div class='collapse' id='collapse_"+data[i].sqno+"'>"+
									"<div class='card-footer'><p>答案：选"+data[i].sanswer+"</p>"+
										"<span class='explain'>"+data[i].sexplanation+"</span>"+
									"</div>"+
								"</div>"+
							"</div></td></tr>";
					info += item; 
				});
				$("#loadQuestion").html(info);
			}
			function loadMQ(data){
				var noquestion="<h3 style='color:red;'>暂无题目！</h3>";
				var info = "";
				var item = "";
				if(data == ""){
					$("#loadQuestion").html(noquestion);
					alert("没有数据！");
					return;
				}
				$.each(data,function(i,n){
					item = "<tr><td><div class='card'>"+
								"<div class='card-header'>"+
									"<label class='mylabel-num'>"+i+"</label>"+
									"<div style='margin-left: auto;' class='float-right form-inline'>"+
										"<a class='card-link' href='javascript:;' value='"+data[i].mqid+"' onclick='editQusetion(this);'>编辑</a>"+
										"<a href='javascript:;' onclick='deleteMQ(this);' class='card-link' value='"+data[i].mqid+"' >删除</a>"+
									"</div>"+
								"</div>"+
								"<div class='card-body'>"+
									"<p class='title' >"+data[i].mquestion+"</p>"+
									"<p class='op1'>A. "+data[i].mchoiceA+"</p>"+
									"<p class='op2'>B. "+data[i].mchoiceB+"</p>"+
									"<p class='op3'>C. "+data[i].mchoiceC+"</p>"+
									"<p class='op4'>D. "+data[i].mchoiceD+"</p>"+
									"<a data-toggle='collapse' data-parent='#accordion' href='#collapse_"+data[i].mqno+"' class='card-link'>查看解析</a>"+
								"</div>"+
								"<div class='collapse' id='collapse_"+data[i].mqno+"'>"+
									"<div class='card-footer'><p>答案：选"+data[i].manswer+"</p>"+
										"<span class='explain'>"+data[i].mexplanation+"</span>"+
									"</div>"+
								"</div>"+
							"</div></td></tr>";
					info += item; 
				});
				$("#loadQuestion").html(info);
			}
			function loadFQ(data){
				var noquestion="<h3 style='color:red;'>暂无题目！</h3>";
				var info = "";
				var item = "";
				if(data == ""){
					$("#loadQuestion").html(noquestion);
					alert("没有数据！");
					return;
				}
				$.each(data,function(i,n){
					item = "<tr><td><div class='card'>"+
								"<div class='card-header'>"+
									"<label class='mylabel-num'>"+i+"</label>"+
									"<div style='margin-left: auto;' class='float-right form-inline'>"+
										"<a class='card-link' href='javascript:;' value='"+data[i].fqid+"' onclick='editQusetion(this);'>编辑</a>"+
										"<a href='javascript:;' onclick='deleteFQ(this);' class='card-link' value='"+data[i].fqid+"' >删除</a>"+
									"</div>"+
								"</div>"+
								"<div class='card-body'>"+
									"<p class='title' >"+data[i].fquestion+"</p>"+
									"<a data-toggle='collapse' data-parent='#accordion' href='#collapse_"+data[i].fqno+"' class='card-link'>查看解析</a>"+
								"</div>"+
								"<div class='collapse' id='collapse_"+data[i].fqno+"'>"+
									"<div class='card-footer'><p>答案:"+data[i].fanswer+"</p>"+
										"<span class='explain'>"+data[i].fexplanation+"</span>"+
									"</div>"+
								"</div>"+
							"</div></td></tr>";
					info += item; 
				});
				$("#loadQuestion").html(info);
			}



		</script>

		<script>//这是修改题目时的js
			function editQusetion(obj){
				var qtype = $("input[name='questionType']:checked").val();//获取题目的类型（是单选还是多选）
				//alert(qtype);
				if(qtype=='sq'){//如果是单选，把数据填进--修改单选题的提示框
					var sqid=$(obj).attr("value");
					var url = "${pageContext.request.contextPath }/teacher_getOneSQ";//getAllStudents
					var param = {"sqid":sqid};
					$.post(url,param,function(data){load_A_SQ(data)},"json");
					
				}else if(qtype=='mq'){//如果是多选
					var mqid=$(obj).attr("value");
					var url = "${pageContext.request.contextPath }/teacher_getOneMQ";//getAllStudents
					var param = {"mqid":mqid};
					$.post(url,param,function(data){load_A_MQ(data)},"json");
				}else if(qtype=='fq'){//如果是填空
					var fqid=$(obj).attr("value");
					var url = "${pageContext.request.contextPath }/teacher_getOneFQ";//getAllStudents
					var param = {"fqid":fqid};
					$.post(url,param,function(data){load_A_FQ(data)},"json");
				}
			}

			function load_A_SQ(data){
				//alert(data.squestion);
				
				var diff=data.difficulty;
				var thediff;
				var a_answer;
				if(diff=="简单"){
					thediff=0;
				}else if(diff=="一般"){
					thediff=1;
				}else if(diff=="困难"){
					thediff=2;
				}
				if(data.sanswer=="A"){
					a_answer=0;
				}else if(data.sanswer=="B"){
					a_answer=1;
				}else if(data.sanswer=="C"){
					a_answer=2;
				}else if(data.sanswer=="D"){
					a_answer=3;
				}
				$("input:radio[name='singleQuestion.difficulty']").eq(thediff).attr("checked",true);//设置题目难度为...
				$("input:radio[name='singleQuestion.sanswer']").eq(a_answer).attr("checked",true);//设置题目答案为...
				$("textarea[name='singleQuestion.squestion']").val(data.squestion);//设置题目问题为...singleQuestion.squestion
				$("input[name='singleQuestion.schoiceA']").val(data.schoiceA);//设置题目选项为...
				$("input[name='singleQuestion.schoiceB']").val(data.schoiceB);
				$("input[name='singleQuestion.schoiceC']").val(data.schoiceC);
				$("input[name='singleQuestion.schoiceD']").val(data.schoiceD);
				$("textarea[name='singleQuestion.sexplanation']").val(data.sexplanation);//设置题目解析为...
				$("#editSq").modal('show');

				
			}
			function load_A_MQ(data){
				var diff;
				if(data.difficulty=="简单"){
					diff=0;
				}else if(data.difficulty=="一般"){
					diff=1;
				}else if(data.difficulty=="困难"){
					diff=2;
				}
				var m_an=data.manswer;
				if(m_an.indexOf("A")>-1){
					$("input:checkbox[name='mutipleQuestion.manswers']").eq(0).attr("checked",true);
				}
				if(m_an.indexOf("B")>-1){
					$("input:checkbox[name='mutipleQuestion.manswers']").eq(1).attr("checked",true);
				}
				if(m_an.indexOf("C")>-1){
					$("input:checkbox[name='mutipleQuestion.manswers']").eq(2).attr("checked",true);
				}
				if(m_an.indexOf("D")>-1){
					$("input:checkbox[name='mutipleQuestion.manswers']").eq(3).attr("checked",true);
				}
				$("input:radio[name='mutipleQuestion.difficulty']").eq(diff).attr("checked",true);
				$("textarea[name='mutipleQuestion.mquestion']").val(data.mquestion);
				$("input[name='mutipleQuestion.mchoiceA']").val(data.mchoiceA);
				$("input[name='mutipleQuestion.mchoiceB']").val(data.mchoiceB);
				$("input[name='mutipleQuestion.mchoiceC']").val(data.mchoiceC);
				$("input[name='mutipleQuestion.mchoiceD']").val(data.mchoiceD);
				$("textarea[name='mutipleQuestion.mexplanation']").val(data.mexplanation);
				$("#editMq").modal('show');
			}
			function load_A_FQ(data){
				var diff;
				var answer;
				$("#editFq").modal('show');
				if(data.difficulty=="简单"){
					diff=0;
					//$("input:radio[name='fillQuestion.difficulty']").eq(0).attr("checked",true);
				}else if(data.difficulty=="一般"){
					diff=1;
					//$("input:radio[name='fillQuestion.difficulty']").eq(1).attr("checked",true);
				}else if(data.difficulty=="困难"){
					diff=2;
					//$("input:radio[name='fillQuestion.difficulty']").eq(2).attr("checked",true);
				}
				$("input:radio[name='fillQuestion.difficulty']").eq(diff).attr("checked",true);
				$("textarea[name='fillQuestion.fquestion']").val(data.fquestion);
				$("textarea[name='fillQuestion.fanswer']").val(data.fanswer);
				$("textarea[name='fillQuestion.fexplanation']").val(data.fexplanation);//fexplanationfillQuestion.fanswer
				$("#editFq").modal('show');
			}

			function updataSQ(){
				$.ajax({
				type: "POST",//方法类型
				dataType: "json",//预期服务器返回的数据类型
				url: "${pageContext.request.contextPath }/teacher_updataSQ" ,//url
				data: $('#newSQ').serialize(),
				success: function (data) {
				updataTips(data);
				},
				error : function() {
					alert("异常！");
					}
				});
				$("#editSq").modal('hide');
				getSQuestion();
			}
			function updataMQ(){
				$.ajax({
				type: "POST",//方法类型
				dataType: "json",//预期服务器返回的数据类型
				url: "${pageContext.request.contextPath }/teacher_updataMQ" ,//url
				data: $('#newMQ').serialize(),
				success: function (data) {
				updataTips(data);
				},
				error : function() {
					alert("异常！");
					}
				});
				$("#editMq").modal('hide');
				getMQuestion();
			}
			function updataFQ(){
				$.ajax({
				type: "POST",//方法类型
				dataType: "json",//预期服务器返回的数据类型
				url: "${pageContext.request.contextPath }/teacher_updataFQ" ,//url
				data: $('#newFQ').serialize(),
				success: function (data) {
				updataTips(data);
				},
				error : function() {
					alert("异常！");
					}
				});
				$("#editFq").modal('hide');
				getFQuestion();
			}
			function updataTips(data){
				if (result>0) {
					alert("修改成功");
				}else{
					alert("修改失败");
				}
			}
		</script>

		<script>
			function deleteSQ(obj){
				var sqid=$(obj).attr("value");
				var url = "${pageContext.request.contextPath }/teacher_delectSQuestion";//getAllStudents
				var param = {"sqid":sqid};
				$.post(url,param,function(data){delTip(data)},"json");
			}
			function deleteMQ(obj){
				var mqid=$(obj).attr("value");
				var url = "${pageContext.request.contextPath }/teacher_delectMQuestion";//getAllStudents
				var param = {"mqid":mqid};
				$.post(url,param,function(data){delTip(data)},"json");
			}
			function deleteFQ(obj){
				var fqid=$(obj).attr("value");
				var url = "${pageContext.request.contextPath }/teacher_delectFQuestion";//getAllStudents
				var param = {"fqid":fqid};
				$.post(url,param,function(data){delTip(data)},"json");
			}
			function delTip(data){
				if(data>0){
					alert("删除成功！");
				}else{
					alert("删除失败！");
				}

			}
		</script>

	<body/>

</html>