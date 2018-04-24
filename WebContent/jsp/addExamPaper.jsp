<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mycss.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body  style="height: 100%;" background="${pageContext.request.contextPath }/img/index_bg1.jpg">
	<div class="container"
		style="height: 100%; background-color: rgba(255, 255, 255, 0.8);">
		<div style="width: 800px; margin: auto; padding-top: 100px;padding-bottom: 100px; position: relative;">
			<form action="${pageContext.request.contextPath }/teacher_addPaper" method="post">
				<div id="paperInfo" style="padding-left: 30px;">
					<div class="card-header">
						<span style="font-size: 25px;">填写试卷信息:</span>
					</div>
					<div class="card">
						<table class="table table-hover" style="text-align: left;">
							<tbody>
								<tr>
									<td colspan="2">
										<label for="papername">试卷名称:</label>
										<input type="text" id="papername"  name="testPaper.tpname">

									</td>
								</tr>
								<tr>
									<td>
										<label for="SqNum">单选题 共:</label>
										<input type="text" id="SqNum" name="testPaper.squestionSize">题
									</td>
									<td>
										<label for="SqScore">每题</label>
										<input type="text" id="SqScore"  name="testPaper.squestionscore">分
									</td>
								</tr>
								<tr>
									<td>
										<label for="MqNum">双选题 共:</label>
										<input type="text" id="MqNum" name="testPaper.mquestionSize">题
									</td>
									<td>
										<label for="MqScore">每题</label>
										<input type="text" id="MqScore"  name="testPaper.mquestionscore">分
									</td>
								</tr>
								<tr>
									<td>
										<label for="FqNum">填空题 共:</label>
										<input type="text" id="FqNum"  name="testPaper.fquestionSize">题
									</td>
									<td>
										<label for="FqScore">每题</label>
										<input type="text" id="FqScore"  name="testPaper.fquestionscore">分
									</td>
								</tr>
								<!-- 教师信息 id -->
								<tr>
									<div>
										<input type="hidden" class="form-control" id="tid" placeholder=""
											value="${sessionScope.user.tid}" name="testPaper.teacher.tid">
									</div>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<c:if test="${empty question.singles}">
					<div id="selectSq" style="display: none;">
						<P>你还没有单项选择题可以选择！</P>
					</div>
				</c:if>
				<c:if test="${not empty question.singles}">
					<div id="selectSq" style="display: none;">
						<div class="card-header">
							<span style="font-size: 25px;">开始选择单选题:</span>
						</div>
						<div class="card">
							<table class="table table-hover" style="text-align: center;">
								<thead style="font-weight: 600;">
									<td>序号</td>
									<td>题目</td>
									<td>难度</td>
									<td>选择</td>
								</thead>
								<tbody>
									<c:forEach items="${question.singles}" var="squestion" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>
											<p class="card-title ">${squestion.squestion}</p>
										</td>
										<td>${squestion.difficulty}</td>
										<td><input id="sq${status.index+1}" class="styled" type="checkbox"
											value="${squestion.sqid}" name="testPaper.sqid"></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>
				<c:if test="${empty question.mutiples}">
					<div id="selectMq" style="display: none;">
						<P>你还没有双项选择题可以选择！</P>
					</div>
				</c:if>
				<c:if test="${not empty question.mutiples}">
					<div id="selectMq" style="display: none;">
						<div class="card-header">
							<span style="font-size: 25px;">开始选择双选题:</span>
						</div>
						<div class="card">
							<table class="table table-hover" style="text-align: center;">
								<thead style="font-weight: 600;">
									<td>序号</td>
									<td>题目</td>
									<td>难度</td>
									<td>选择</td>
								</thead>
								<tbody>
									<c:forEach items="${question.mutiples}" var="mquestion" varStatus="status">
										<tr>
											<td>${status.index+1}</td>
											<td>
												<p class="card-title ">${mquestion.mquestion}</p>
											</td>
											<td>${mquestion.difficulty}</td>
											<td><input id="mq${status.index+1}" class="styled" type="checkbox"
												value="${mquestion.mqid}" name="testPaper.mqid"></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</c:if>
				<c:if test="${empty question.fills}">
					<div id="selectFq" style="display: none;">
						<P>你还没有填空题可以选择！</P>
					</div>
				</c:if>
				<c:if test="${not empty question.fills}">
					<div id="selectFq" style="display: none;">
						<div class="card-header">
							<span style="font-size: 25px;">开始选择填空题:</span>
						</div>
						<div class="card">
							<table class="table table-hover" style="text-align: center;">
								<thead style="font-weight: 600;">
									<td>序号</td>
									<td>题目</td>
									<td>难度</td>
									<td>选择</td>
								</thead>
								<tbody>
									<c:forEach items="${question.fills}" var="fquestion" varStatus="status">
										<tr>
											<td>${status.index+1}</td>
											<td>
												<p class="card-title ">${fquestion.fquestion}</p>
											</td>
											<td>${fquestion.difficulty}</td>
											<td><input id="fq${status.index+1}" class="styled" type="checkbox"
												value="${fquestion.fqid}" name="testPaper.fqid"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>
				<div id="commit" align="center" style="position: absolute;bottom: 30px;right: 350px;display: none;">
					<button type="submit" class="btn btn-outline-info">完 成</button>
				</div>
				
				<div align="center" id="nextBtn" style="position: absolute;bottom: 30px;right: 350px;">
					<button type="button" class="btn btn-outline-info">下一步</button>
				</div>
			</form>
		</div>
	</div>
</body>

<!-- 选择题目的控制 -->
<script type="text/javascript">

	var idArr = ["paperInfo","selectSq","selectMq","selectFq"];
	var i = 0;
	var pre = i;
	$id("nextBtn").onclick = function(){
		i++;
		if(i>3){
			i = 0;
		}
		// alert(idArr[i]);
		$id(idArr[pre]).style.display = "none";
		$id(idArr[i]).style.display = "block";
		
		// 显示完成按钮
		if(i == 3){
			$id("commit").style.display = "block";
			this.style.display = "none";
		}

		pre = i;
	}

	function $id(id) {
		return document.getElementById(id);
	}

</script>
</html>
