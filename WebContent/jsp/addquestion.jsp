<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/build.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>

	<body background="${pageContext.request.contextPath }/img/index_bg1.jpg">
		<div class="container" style="height: 800px; background-color: rgba(255,255,255,0.8);">
			<div>
				<nav class="navbar navbar-light bg-faded">
					<a class="navbar-brand" href="">
						<h1>100test</h1>
					</a>
					<div>
						<a class="btn btn-outline-secondary" href="teacher.html">返回主页</a>
					</div>
				</nav>
			</div>
			<div id="mymenu" style="float:left ;  width:17%;  height:100%; text-align: center;">
				<!-- Nav pills -->
				<ul class="nav nav-pills flex-column " role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="pill" href="#addSQ">添加单选</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#addMQ">添加多选</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#addFQ">添加填空</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#addmach">批量导入</a>
					</li>
				</ul>
			</div>

			<div id="show" style="float:left ;  width:83%;  height:100%;">
				<div class="tab-content">
					<div id="addSQ" class="container tab-pane active">
						<form>
							<div class="form-group">
								<div class="input-group">
									<sapn>题目难度：</sapn>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqdifficulty1" value="option1" name="sqdifficulty" checked>
										<label for="sqdifficulty1">简单</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqdifficulty2" value="option2" name="sqdifficulty">
										<label for="sqdifficulty2">普通</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqdifficulty3" value="option1" name="sqdifficulty">
										<label for="sqdifficulty3">困难</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqdifficulty4" value="option2" name="sqdifficulty">
										<label for="sqdifficulty4">绝望</label>
									</div>
								</div>
								
								<div class="input-group">
									<sapn>题目答案：</sapn>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqanswer1" value="option1" name="sqanswer" checked>
										<label for="sqanswer1">A</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqanswer2" value="option2" name="sqanswer">
										<label for="sqanswer2">B</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqanswer3" value="option1" name="sqanswer">
										<label for="sqanswer3">C</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="sqanswer4" value="option2" name="sqanswer">
										<label for="sqanswer4">D</label>
									</div>
								</div>
								
								<div class="card">
									<div class="card-header">
										<h5>题目:</h5>
										<textarea class="form-control" name=""></textarea>
									</div>
									<div class="card-body">
										<div class="">
											<span style="margin:7px 8px;">选项A:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">选项B:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">选项C:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">选项D:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">解析:</span>
											<textarea class="form-control" name=""></textarea>
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
					<div id="addMQ" class="container tab-pane fade">
						<form>
							<div class="form-group">
								<div class="input-group">
									<sapn>题目难度：</sapn>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="mqdifficulty1" value="option1" name="mqdifficulty" checked>
										<label for="mqdifficulty1">简单</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="mqdifficulty2" value="option2" name="mqdifficulty">
										<label for="mqdifficulty2">普通</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="mqdifficulty3" value="option1" name="mqdifficulty">
										<label for="mqdifficulty3">困难</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="mqdifficulty4" value="option2" name="mqdifficulty">
										<label for="mqdifficulty4">绝望</label>
									</div>
								</div>
								
								<div class="input-group">
									<sapn>题目答案：</sapn>
									<div class="checkbox checkbox-success">
										<input id="mqanswer1" class="styled" type="checkbox">
									    <label for="mqanswer1">A</label>
									</div>
									<div class="checkbox checkbox-success">
										<input id="mqanswer2" class="styled" type="checkbox">
									    <label for="mqanswer2">B</label>
									</div>
									<div class="checkbox checkbox-success">
										<input id="mqanswer3" class="styled" type="checkbox">
									    <label for="mqanswer3">C</label>
									</div>
									<div class="checkbox checkbox-success">
										<input id="mqanswer4" class="styled" type="checkbox">
									    <label for="mqanswer4">D</label>
									</div>
								</div>
								
								<div class="card">
									<div class="card-header">
										<h5>题目:</h5>
										<textarea class="form-control" name=""></textarea>
									</div>
									<div class="card-body">
										<div class="">
											<span style="margin:7px 8px;">选项A:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">选项B:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">选项C:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">选项D:</span>
											<input class="form-control"  type="text" placeholder=""/>
											<span style="margin:7px 8px;">解析:</span>
											<textarea class="form-control" name=""></textarea>
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
					<div id="addFQ" class="container tab-pane fade">
						<form>
							<div class="form-group">
								<div class="input-group">
									<sapn>题目难度：</sapn>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="fqdifficulty1" value="option1" name="fqdifficulty" checked>
										<label for="fqdifficulty1">简单</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="fqdifficulty2" value="option2" name="fqdifficulty">
										<label for="fqdifficulty2">普通</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="fqdifficulty3" value="option1" name="fqdifficulty">
										<label for="fqdifficulty3">困难</label>
									</div>
									<div class="radio radio-success radio-inline">
										<input type="radio" id="fqdifficulty4" value="option2" name="fqdifficulty">
										<label for="fqdifficulty4">绝望</label>
									</div>
								</div>
								
								<div class="card">
									<div class="card-header">
										<h5>题目:</h5>
										<textarea class="form-control" name=""></textarea>
									</div>
									<div class="card-body">
										<div class="">
											<span style="margin:7px 8px;">答案:</span>
											<textarea class="form-control" name=""></textarea>
											<span style="margin:7px 8px;">解析:</span>
											<textarea class="form-control" name=""></textarea>
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