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
		<div class="container" style="background-color: rgba(255,255,255,0.8);">
			<div class="card" style="margin: 0 auto;  width:87%; padding-bottom: 50px;">
				<div class="card-header">
					<span style="font-size:25px;">开始选择双选题:</span>
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
							<tr>
								<td>1</td>
								<td>
									<p class="card-title ">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</p>
								</td>
								<td>
									简单
								</td>
								<td>
									<input id="sq1" class="styled" type="checkbox" value="1" name="testPaper.mqid">
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td>
									<p class="card-title ">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</p>
								</td>
								<td>
									简单
								</td>
								<td>
									<input id="sq2" class="styled" type="checkbox" value="1" name="SqNum">
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				
				<div class="card-footer" align="center">
					<button type="submit" class="btn btn-outline-info ">继续，下一步</button>
				</div>
				
			</div>
		</div>
	</body>
</html>