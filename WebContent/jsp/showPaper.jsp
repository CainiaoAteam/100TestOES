<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mycss.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/build.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<style type="text/css">
	.istrue{
		background: #fff url('${pageContext.request.contextPath }/img/true.png') no-repeat 10% 1%;
		background-size:40px auto;
		-moz-background-size:40px auto;
	}
	.iserror{
		background: #fff url('${pageContext.request.contextPath }/img/error.png') no-repeat 10% 10%;
		background-size:40px auto;
		-moz-background-size:40px auto;
	}
</style>
</head>
<body>
	<div class="container"
		style="background-color: rgba(255, 255, 255, 0.8);">
		<div class="card" style="float: left; width: 87%;">
			<div class="card-header" align="center" id="showScore">
				<span style="font-size: 45px;font-family:'SimSun';">考试标题--测试考试</span>
			</div>
			<div class="card" id="showQuestions">
				<table id="sQuestion" class="table table-hover " style="border-bottom:1px solid rgba(0, 0, 0, .125);box-shadow:0 10px 5px rgba(250,0,0,.3);">
					<thead>
						<div class="card-header" align="left">
							<span style="font-size: 25px;font-family:'SimSun';font-weight:600;">一、单选题</span>
						</div>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="card" id="sq-1">
									<div class="card-header">
										<label class="mylabel-num">1</label>
										<span class="card-title" style="font-weight:600;">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</span>
									</div>
									<div class="card-body">
										<p>A. 程咬金-爱与正义</p>
										<p>B. 吕布</p>
										<p>C. 赵云</p>
										<p>D. 关羽</p>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_1 ">
										<div class="card-footer istrue">
											<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">A</b></p>
										</div>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">解析：</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;C&nbsp;</label>，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="card" id="sq-2">
									<div class="card-header">
										<label class="mylabel-num">2</label>
										<span class="card-title" style="font-weight:600;">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</span>
									</div>
									<div class="card-body">
										<p>A. 程咬金-爱与正义</p>
										<p>B. 吕布</p>
										<p>C. 赵云</p>
										<p>D. 关羽</p>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_1 ">
										<div class="card-footer iserror">
											<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">A</b></p>
										</div>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">解析：</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;C&nbsp;</label>，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<table id="mQuestion" class="table table-hover " style="border-bottom:1px solid rgba(0, 0, 0, .125);box-shadow:0 10px 5px rgba(250,0,0,.3);">
					<thead>
						<div class="card-header" align="left">
							<span style="font-size: 25px;font-family:'SimSun';font-weight:600;">二、双选题</span>
						</div>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="card" id="mq-1">
									<div class="card-header">
										<label class="mylabel-num">1</label>
										<span class="card-title" style="font-weight:600;">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</span>
									</div>
									<div class="card-body">
										<p>A. 程咬金-爱与正义</p>
										<p>B. 吕布</p>
										<p>C. 赵云</p>
										<p>D. 关羽</p>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_1 ">
										<div class="card-footer istrue">
											<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">AD</b></p>
										</div>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">解析：</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;C&nbsp;</label>，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="card" id="mq-2">
									<div class="card-header">
										<label class="mylabel-num">2</label>
										<span class="card-title" style="font-weight:600;">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</span>
									</div>
									<div class="card-body">
										<p>A. 程咬金-爱与正义</p>
										<p>B. 吕布</p>
										<p>C. 赵云</p>
										<p>D. 关羽</p>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_1 ">
										<div class="card-footer iserror">
											<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">AC</b></p>
										</div>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">解析：</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;C&nbsp;</label>，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<table id="mQuestion" class="table table-hover " style="border-bottom:1px solid rgba(0, 0, 0, .125);box-shadow:0 10px 5px rgba(250,0,0,.3);">
					<thead>
						<div class="card-header" align="left">
							<span style="font-size: 25px;font-family:'SimSun';font-weight:600;">二、双选题</span>
						</div>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="card" id="mq-1">
									<div class="card-header">
										<label class="mylabel-num">1</label>
										<span class="card-title" style="font-weight:600;">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</span>
									</div>
									<div class="card-body">
										<p>A. 程咬金-爱与正义</p>
										<p>B. 吕布</p>
										<p>C. 赵云</p>
										<p>D. 关羽</p>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_1 ">
										<div class="card-footer istrue">
											<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">AD</b></p>
										</div>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">解析：</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;C&nbsp;</label>，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="card" id="mq-2">
									<div class="card-header">
										<label class="mylabel-num">2</label>
										<span class="card-title" style="font-weight:600;">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</span>
									</div>
									<div class="card-body">
										<label style="margin-top: 6px;">请输入答案：</label>
								  		<input type="text" class="form-control myfullinput col-3" id= "fq-answer-01">
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_1 ">
										<div class="card-footer iserror">
											<p style="color:red;font-weight:600;"><b style="color:black;">貂蝉</b></p>
										</div>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">解析：</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;C&nbsp;</label>，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card" style="float: right; width: 12%;">
			<div class="Answer-card">
				<div class="card-header input-group">
					<div style="text-align: left;">
						<span>你的成绩：</span>
					</div>
				</div>
				<div id="sq-card">
					<div class="card-header input-group"
						style="background-color: #ffffff;">
						<div style="text-align: center; margin: auto;">
							<span style="font-weight:700;color:red;font-size:60px;">96.5</span>
						</div>
						
					</div>
					
				</div>
				<div onclick="toHomaPage()" title="返回主页" id="backHome" style="width:48px;height:48px;background-image: url(${pageContext.request.contextPath }/img/home.png);position:fixed;right:20px;bottom:50px;">
					
				</div>
			</div>
		</div>
	</div>
	<script>
			$(document).ready(function() {
				$(".collapse").addClass('show');
			})
		</script>
	<script>
			$(document).ready(function(){
				var SqSum=$("#sqCount").text();
				console.log(SqSum);
				for(var i=1;i<=SqSum;i++){
					var myAns=$("#sq-"+i+" .myAnswer").text();
					var rightAns=$("#sq-"+i+" .rightAnswer").text();
					if(myAns==rightAns){
						//console.log("答对了");
						$("#card-sq-"+i).css("background-color","#20c997");
					}
					else{
						//console.log("答错了");
						$("#card-sq-"+i).css("background-color","#dc3545");
					}
				}
			})
		</script>
</body>
</html>