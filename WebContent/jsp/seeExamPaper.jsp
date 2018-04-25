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
</head>
<body>
	<div class="container">
		<div class="card" style="float: left; width: 87%;">
			<div class="card-header" id="examInfo" style="text-align: center;">
				<p style="font-size: 22px; padding-top: 7px;">全国英语四级考试---A卷</p>
			</div>
			<div id="SingleQuestion">
				<div class="card-header" style="height: 70px;">
					<div class="form-inline">
						<h5 style="margin-right: 20px;">单选题</h5>
						<p class="myspan-fraction">
							<span>共</span>
							<samp>5</samp>
							<span>题，合计</span>
							<samp>5</samp>
							<span>分</span>
						</p>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-hover ">
						<tbody>
							<tr>
								<td>
									<div class="card">
										<div class="card-header" id="sq-1">
											<label class="mylabel-num">1</label>
											<p class="card-title ">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</p>
										</div>
										<div class="card-body ">
											<p>A. 程咬金-爱与正义</p>
											<p>B. 吕布</p>
											<p>C. 赵云</p>
											<p>D. 关羽</p>
											<a class="card-link " data-toggle="collapse"
												data-parent="#accordion " href="#collapse_1 "> 查看解析 </a>
										</div>
										<div class="collapse" id="collapse_1 ">
											<div class="card-footer ">
												<p>答案：</p>
												<span>选C，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”</span>
											</div>
										</div>
									</div>

								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="MultipleQuestion">
				<div class="card-header" style="height: 70px;">
					<div class="form-inline">
						<h5 style="margin-right: 20px;">多选题</h5>
						<p class="myspan-fraction">
							<span>共</span>
							<samp>5</samp>
							<span>题，合计</span>
							<samp>5</samp>
							<span>分</span>
						</p>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-hover ">
						<tbody>
							<tr>
								<td>
									<div class="card ">
										<div class="card-header" id="mq-2">
											<label class="mylabel-num">2</label>
											<p class="card-title ">王者荣耀中，草丛三婊指的是哪三婊（）？</p>
										</div>
										<div class="card-body ">
											<p>A. 露娜、貂蝉、甄姬</p>
											<p>B. 安琪丽、妲己、王昭君</p>
											<p>C. 亚瑟、钟馗、牛魔</p>
											<p>D. 刘备、关羽、张飞</p>
											<a class="card-link " data-toggle="collapse"
												data-parent="#accordion " href="#collapse_2 "> 查看解析 </a>
										</div>
										<div class="collapse " id="collapse_2 ">
											<div class="card-footer ">
												<p>答案：</p>
												<span>选B，因为所以，科学道理</span>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="card" style="float: right; width: 12%;">
			<div class="Answer-card">
				<div class="card-header input-group">
					<div style="text-align: center; margin: auto;">
						<span>答题卡</span>
					</div>
				</div>
				<div id="sq-card">
					<div class="card-header input-group"
						style="background-color: #ffffff;">
						<div style="text-align: center; margin: auto;">
							<span>单选题</span>
						</div>
						<div style="text-align: center; margin: auto">
							<span>共5题</span>
						</div>
					</div>
					<div class="card-body" style="border-bottom: 1px solid #e4e4e4;">
						<a href="#sq-1"><span class="myspan-Qu-Num" id="card-sq-01">1</span></a>
						<a href="#sq-2"><span class="myspan-Qu-Num" id="card-sq-02">2</span></a>
						<a href="#sq-3"><span class="myspan-Qu-Num" id="card-sq-03">3</span></a>
					</div>
				</div>
				<div id="mq-card">
					<div class="card-header input-group"
						style="background-color: #ffffff;">
						<div style="text-align: center; margin: auto;">
							<span>多选题</span>
						</div>
						<div style="text-align: center; margin: auto">
							<span>共5题</span>
						</div>
					</div>
					<div class="card-body" style="border-bottom: 1px solid #e4e4e4;">
						<a href="#mq-1"><span class="myspan-Qu-Num" id="card-mq-01">1</span></a>
						<a href="#mq-2"><span class="myspan-Qu-Num" id="card-mq-02">2</span></a>
						<a href="#mq-3"><span class="myspan-Qu-Num" id="card-mq-03">3</span></a>
					</div>
				</div>
				<div id="backHome" style="text-align: center; margin: auto;">
					<a href="student.jsp"><button class="btn btn-outline-info">返回主页</button></a>
				</div>
			</div>
		</div>
	</div>
	<script>//答题卡选中事件
			$(document).on('click', '.sqtimu :radio', function() {
			    var QId = $(this).attr("id");
			    var CardId = QId.substr(0, 5);
			    var numCId="card-"+CardId;
			    $("span#"+numCId).css("background-color","#20c997");
			});
			$(document).on('click', '.mqtimu :checkbox', function() {
			    var QId = $(this).attr("id");
			    var CardId = QId.substr(0, 5);
			    var numCId="card-"+CardId;
			    $("span#"+numCId).css("background-color","#20c997");
			});
		</script>
</body>
</html>