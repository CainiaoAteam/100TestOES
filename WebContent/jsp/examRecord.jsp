<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script type="text/javascript">
	function toHomaPage(){
		window.location.href="${pageContext.request.contextPath }/exam_toHomaPage";
	}
</script>

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
	.error-true{
		background: #fff url('${pageContext.request.contextPath }/img/notrue.png') no-repeat 10% 10%;
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
				<span style="font-size: 45px;font-family:'SimSun';">${record.exam.testpaper.tpname}</span>
			</div>
			
			<div class="card" id="showQuestions">
				<c:if test="${not empty record.exam.testpaper.squestions}">
				<table id="sQuestion" class="table table-hover " style="border-bottom:1px solid rgba(0, 0, 0, .125);box-shadow:0 10px 5px rgba(250,0,0,.3);">
					<thead>
						<div class="card-header" align="left">
							<span style="font-size: 25px;font-family:'SimSun';font-weight:600;">一、单选题</span>
						</div>
					</thead>
					<tbody>
						<c:forEach items="${record.exam.testpaper.squestions}" var="squestion" varStatus="status">
						<tr>
							<td>
								<div class="card" id="sq-${status.index+1}">
									<div class="card-header">
										<label class="mylabel-num">${status.index+1}</label>
										<span class="card-title" style="font-weight:600;">${squestion.squestion }</span>
									</div>
									<div class="card-body">
										<p>A.  ${squestion.schoiceA }</p>
										<p>B.  ${squestion.schoiceB }</p>
										<p>C.  ${squestion.schoiceC }</p>
										<p>D.  ${squestion.schoiceD }</p>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_${status.index+1} ">
										<c:if test="${squestion.istrue == 1}">
											<div class="card-footer istrue">
												<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">${squestion.answer}</b></p>
											</div>
										</c:if>
										<c:if test="${squestion.istrue == 0}">
											<div class="card-footer iserror">
												<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">${squestion.answer}</b></p>
											</div>
										</c:if>

									</div>
									<div class="collapse show" id="collapse1_${status.index+1} ">
										<div class="card-footer ">
											<p style="color:#007bff">解析：
												<span style="margin-left: 2em;color: #00f">（难度：<b style="color: red;">困难</b>）</span>
											</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;${squestion.sanswer}&nbsp;</label>，${squestion.sexplanation}
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
				<!-- 双选 -->
				<c:if test="${not empty record.exam.testpaper.mquestions}">
				<table id="mQuestion" class="table table-hover " style="border-bottom:1px solid rgba(0, 0, 0, .125);box-shadow:0 10px 5px rgba(250,0,0,.3);">
					<thead>
						<div class="card-header" align="left">
							<span style="font-size: 25px;font-family:'SimSun';font-weight:600;">二、双选题</span>
						</div>
					</thead>
					<tbody>
						<c:forEach items="${record.exam.testpaper.mquestions}" var="mquestion" varStatus="status">
						<tr>
							<td>
								<div class="card" id="mq-${status.index+1}">
									<div class="card-header">
										<label class="mylabel-num">${status.index+1}</label>
										<span class="card-title" style="font-weight:600;">${mquestion.mquestion}</span>
									</div>
									<div class="card-body">
										<p>A. ${mquestion.mchoiceA}</p>
										<p>B. ${mquestion.mchoiceB}</p>
										<p>C. ${mquestion.mchoiceC}</p>
										<p>D. ${mquestion.mchoiceD}</p>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_1 ">
										<c:if test="${mquestion.istrue == 1}">
											<div class="card-footer istrue">
												<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">${mquestion.answer}</b></p>
											</div>
										</c:if>
										<c:if test="${mquestion.istrue == 0}">
											<div class="card-footer iserror">
												<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">${mquestion.answer}</b></p>
											</div>
										</c:if>
										<c:if test="${mquestion.istrue == 0.5}">
											<div class="card-footer error-true">
												<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">${mquestion.answer}</b></p>
											</div>
										</c:if>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">
												解析：
												<span style="margin-left: 2em;color: #00f">（难度：<b style="color: red;">困难</b>）</span>
											</p>
											<span style="color:red;margin-left:2em;">选<label class="rightAnswer" style="font-weight:600;">&nbsp;${mquestion.manswer}&nbsp;</label>，${mquestion.mexplanation}</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
				<!-- 填空题 -->
				<c:if test="${not empty record.exam.testpaper.fquestions}">
				<table id="fQuestion" class="table table-hover " style="border-bottom:1px solid rgba(0, 0, 0, .125);box-shadow:0 10px 5px rgba(250,0,0,.3);">
					<thead>
						<div class="card-header" align="left">
							<span style="font-size: 25px;font-family:'SimSun';font-weight:600;">三、填空题</span>
						</div>
					</thead>
					<tbody>
						<c:forEach items="${record.exam.testpaper.fquestions}" var="fquestion" varStatus="status">
						<tr>
							<td>
								<div class="card" id="mq-${status.index+1}">
									<div class="card-header">
										<label class="mylabel-num">${status.index+1}</label>
										<span class="card-title" style="font-weight:600;">${fquestion.fquestion}</span>
									</div>
									<div class="collapse show" style="box-shadow:0 5px 5px rgba(250,0,0,.3);" id="collapse_${status.index+1} ">
										<c:if test="${fquestion.istrue == 1}">
											<div class="card-footer istrue">
												<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">${fquestion.answer}</b></p>
											</div>
										</c:if>
										<c:if test="${fquestion.istrue == 0}">
											<div class="card-footer iserror">
												<p style="color:red;font-weight:600;">你的答案：<b style="color:black;">${fquestion.answer}</b></p>
											</div>
										</c:if>
									</div>
									<div class="collapse show" id="collapse_2 ">
										<div class="card-footer ">
											<p style="color:#007bff">正确答案：</p>
											<span style="color:red;margin-left:2em;"><label class="rightAnswer" style="font-weight:600;">&nbsp;${fquestion.fanswer}&nbsp;</label>
											</span>
											<p style="color:#f00">解析：</p>
											<span style="color:red;margin-left:2em;"><label class="rightAnswer" style="font-weight:600;">&nbsp;${fquestion.fexplanation}&nbsp;</label>
											</span>
										</div>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
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
							<span style="font-weight:700;color:red;font-size:60px;">${record.score}</span>
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