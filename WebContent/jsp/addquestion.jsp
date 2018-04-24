<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>

<body background="${pageContext.request.contextPath }/img/index_bg1.jpg">
	<c:if test="${not empty sessionScope.msg}">
		<div style="width:400px;background-color:red;color:#fff;margin:0 auto;text-align: center;">
			<p>${sessionScope.msg}</p>
		</div>
	</c:if>
	<div class="container"
		style="height: 800px; background-color: rgba(255, 255, 255, 0.8);">
		<div>
			<nav class="navbar navbar-light bg-faded">
				<a class="navbar-brand" href="">
					<h1>100Test</h1>
				</a>
				<div>
					<a class="btn btn-outline-secondary"
						href="${pageContext.request.contextPath }/jsp/teacher.jsp">返回主页</a>
				</div>
			</nav>
		</div>
		<div id="mymenu"
			style="float: left; width: 17%; height: 100%; text-align: center;">
			<!-- Nav pills -->
			<ul class="nav nav-pills flex-column " role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="pill" href="#addSQ">添加单选</a></li>
				<br />
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="#addMQ">添加多选</a></li>
				<br />
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="#addFQ">添加填空</a></li>
				<br />
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="#addmach">批量导入</a></li>
			</ul>
		</div>

		<div id="show" style="float: left; width: 83%; height: 100%;">
			<div class="tab-content">
				<div id="addSQ" class="container tab-pane active">
					<form
						action="${pageContext.request.contextPath }/teacher_addSingle"
						method="post">
						<div class="form-group">
							<div class="input-group">
								<sapn>题目难度：</sapn>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqdifficulty1" value="简单"
										name="singleQuestion.difficulty" checked> <label
										for="sqdifficulty1">简单</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqdifficulty2" value="普通"
										name="singleQuestion.difficulty"> <label
										for="sqdifficulty2">普通</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqdifficulty3" value="困难"
										name="singleQuestion.difficulty"> <label
										for="sqdifficulty3">困难</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqdifficulty4" value="绝望"
										name="singleQuestion.difficulty"> <label
										for="sqdifficulty4">绝望</label>
								</div>
							</div>

							<div class="input-group">
								<sapn>题目答案：</sapn>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqanswer1" value="A"
										name="singleQuestion.sanswer" checked> <label
										for="sqanswer1">A</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqanswer2" value="B"
										name="singleQuestion.sanswer"> <label for="sqanswer2">B</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqanswer3" value="C"
										name="singleQuestion.sanswer"> <label for="sqanswer3">C</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sqanswer4" value="D"
										name="singleQuestion.sanswer"> <label for="sqanswer4">D</label>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5>题目:</h5>
									<textarea class="form-control" name="singleQuestion.squestion"></textarea>
								</div>
								<div class="card-body">
									<div class="">
										<span style="margin: 7px 8px;">选项A:</span> <input
											class="form-control" type="text"
											name="singleQuestion.schoiceA" placeholder="" /> <span
											style="margin: 7px 8px;">选项B:</span> <input
											class="form-control" type="text"
											name="singleQuestion.schoiceB" placeholder="" /> <span
											style="margin: 7px 8px;">选项C:</span> <input
											class="form-control" type="text"
											name="singleQuestion.schoiceC" placeholder="" /> <span
											style="margin: 7px 8px;">选项D:</span> <input
											class="form-control" type="text"
											name="singleQuestion.schoiceD" placeholder="" /> <span
											style="margin: 7px 8px;">解析:</span>
										<textarea class="form-control"
											name="singleQuestion.sexplanation"></textarea>
									</div>
								</div>
								<div>
									<input type="hidden" name="singleQuestion.tid"
										value="${sessionScope.user.tid}">
								</div>
								<div class="card-footer float-right">
									<div class="float-right">
										<button type="submit" class="btn btn-outline-primary">添加题目</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="addMQ" class="container tab-pane fade">
					<form
						action="${pageContext.request.contextPath }/teacher_addMutiple"
						method="post">
						<div class="form-group">
							<div class="input-group">
								<sapn>题目难度：</sapn>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="mqdifficulty1" value="简单"
										name="mutipleQuestion.difficulty" checked> <label
										for="mqdifficulty1">简单</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="mqdifficulty2" value="普通"
										name="mutipleQuestion.difficulty"> <label
										for="mqdifficulty2">普通</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="mqdifficulty3" value="困难"
										name="mutipleQuestion.difficulty"> <label
										for="mqdifficulty3">困难</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="mqdifficulty4" value="绝望"
										name="mutipleQuestion.difficulty"> <label
										for="mqdifficulty4">绝望</label>
								</div>
							</div>

							<div class="input-group">
								<sapn>题目答案：</sapn>
								<div class="checkbox checkbox-success">
									<input id="mqanswer1" class="styled"
										name="mutipleQuestion.manswers" value="A" type="checkbox">
									<label for="mqanswer1">A</label>
								</div>
								<div class="checkbox checkbox-success">
									<input id="mqanswer2" class="styled"
										name="mutipleQuestion.manswers" value="B" type="checkbox">
									<label for="mqanswer2">B</label>
								</div>
								<div class="checkbox checkbox-success">
									<input id="mqanswer3" class="styled"
										name="mutipleQuestion.manswers" value="C" type="checkbox">
									<label for="mqanswer3">C</label>
								</div>
								<div class="checkbox checkbox-success">
									<input id="mqanswer4" class="styled"
										name="mutipleQuestion.manswers" value="D" type="checkbox">
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
										<span style="margin: 7px 8px;">选项A:</span> <input
											class="form-control" type="text"
											name="mutipleQuestion.mchoiceA" placeholder="" /> <span
											style="margin: 7px 8px;">选项B:</span> <input
											class="form-control" type="text"
											name="mutipleQuestion.mchoiceB" placeholder="" /> <span
											style="margin: 7px 8px;">选项C:</span> <input
											class="form-control" type="text"
											name="mutipleQuestion.mchoiceC" placeholder="" /> <span
											style="margin: 7px 8px;">选项D:</span> <input
											class="form-control" type="text"
											name="mutipleQuestion.mchoiceD" placeholder="" /> <span
											style="margin: 7px 8px;">解析:</span>
										<textarea class="form-control"
											name="mutipleQuestion.mexplanation"></textarea>
									</div>
								</div>
								<div>
									<input type="hidden" name="mutipleQuestion.tid"
										value="${sessionScope.user.tid}">
								</div>
								<div class="card-footer float-right">
									<div class="float-right">
										<button type="submit" class="btn btn-outline-primary">添加题目</button>
									</div>
								</div>

							</div>
						</div>
					</form>
				</div>
				<div id="addFQ" class="container tab-pane fade">
					<form action="${pageContext.request.contextPath }/teacher_addFill"
						method="post">
						<div class="form-group">
							<div class="input-group">
								<sapn>题目难度：</sapn>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="fqdifficulty1" value="简单"
										name="fillQuestion.difficulty" checked> <label
										for="fqdifficulty1">简单</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="fqdifficulty2" value="普通"
										name="fillQuestion.difficulty"> <label
										for="fqdifficulty2">普通</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="fqdifficulty3" value="困难"
										name="fillQuestion.difficulty"> <label
										for="fqdifficulty3">困难</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="fqdifficulty4" value="绝望"
										name="fillQuestion.difficulty"> <label
										for="fqdifficulty4">绝望</label>
								</div>
							</div>

							<div>
								<input type="hidden" name="fillQuestion.tid"
									value="${sessionScope.user.tid}">
							</div>

							<div class="card">
								<div class="card-header">
									<h5>题目:</h5>
									<textarea class="form-control" name="fillQuestion.fquestion"></textarea>
								</div>
								<div class="card-body">
									<div class="">
										<span style="margin: 7px 8px;">答案:</span>
										<textarea class="form-control" name="fillQuestion.fanswer"></textarea>
										<span style="margin: 7px 8px;">解析:</span>
										<textarea class="form-control"
											name="fillQuestion.fexplanation"></textarea>
									</div>
								</div>

								<div class="card-footer float-right">
									<div class="float-right">
										<button type="submit" class="btn btn-outline-primary">添加题目</button>
									</div>
								</div>

							</div>
						</div>
					</form>
				</div>
				<div id="addmach" class="container tab-pane fade">
					<h2 align="center">敬请期待.....</h2>
				</div>
			</div>
		</div>
		<div>
			<div style="text-align: center;">
				<p>
					<a href="#">关于我们</a> | <a href="#">联系我们</a> | <a href="#">帮助我们</a>
				</p>
				<p>Design by @菜鸟A队</p>
			</div>
		</div>

	</div>


</body>

</html>
