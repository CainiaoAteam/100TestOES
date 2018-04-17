<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</head>
	<body background="${pageContext.request.contextPath }/img/index_bg1.jpg">
		<div class="container" style="height: 800px; background-color: rgba(255,255,255,0.8);">
			<div style="width: 500px;margin: auto;padding-top: 100px;">
				<form>
					<p style="font-size: 20px;">请输入试卷信息：</p>
					<div class="form-group row">
					    <label for="papername" class="form-control-label" style="margin-top: 8px;">试卷名称:</label>
					    <div class="col-sm-7">
					      <input type="text" class="form-control" id="papername" placeholder="">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="examday" class="form-control-label" style="margin-top: 8px;">考试日期:</label>
					    <div class="col-sm-7">
					      <input type="datetime-local" class="form-control" id="examday" placeholder="">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="examtime" class="form-control-label" style="margin-top: 8px;">考试时长:</label>
					    <div class="col-sm-7">
					      <input type="text" class="form-control" id="examtime" placeholder="单位/分钟">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="SqNum" class="form-control-label" style="margin-top: 8px;">单选题共:</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control" id="SqNum" placeholder="">
					    </div>
					    <label for="SqScore" class="form-control-label" style="margin-top: 8px;">题，每题</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control" id="SqScore" placeholder="">
					    </div>
					    <label for="SqScore" class="form-control-label" style="margin-top: 8px;">分</label>
					</div>
					<div class="form-group row">
					    <label for="MqNum" class="form-control-label" style="margin-top: 8px;">多选题共:</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control" id="MqNum" placeholder="">
					    </div>
					    <label for="MqScore" class="form-control-label" style="margin-top: 8px;">题，每题</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control" id="MqScore" placeholder="">
					    </div>
					    <label for="MqScore" class="form-control-label" style="margin-top: 8px;">分</label>
					</div>
					<div class="form-group row">
					    <label for="FqNum" class="form-control-label" style="margin-top: 8px;">多选题共:</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control" id="FqNum" placeholder="">
					    </div>
					    <label for="FqScore" class="form-control-label" style="margin-top: 8px;">题，每题</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control" id="FqScore" placeholder="">
					    </div>
					    <label for="FqScore" class="form-control-label" style="margin-top: 8px;">分</label>
					</div>
					<div align="center">
						<button type="submit" class="btn btn-outline-info" >下一步</button>
					</div>
					
				</form>
			</div>
			
		</div>
	</body>
</html>
