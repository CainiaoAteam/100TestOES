<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/build.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="background-color: rgba(255,255,255,0.8);">
			<div class="card" style="float:left ;  width:87%;">
				<div class="card-header" align="center" id="showScore">
					<span style="font-size:25px;">本次考试得分:</span>
					<span id="myScore" style="color: red;font-size: 35px;">100</span>
				</div>
				<div class="card" id="showQuestions">
					<table class="table table-hover ">
						<tbody>
							<tr>
								<td>
									<div class="card" id="sq-1">
										<div class="card-header">
											<label class="mylabel-num">1</label>
											<div id="showMyAnswer">
												<label>你的答案：</label>
												<label class="myAnswer">C</label>
											</div>
										</div>
										<div class="card-body">
											<p class="card-title ">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</p>
											<p>A. 程咬金-爱与正义</p>
											<p>B. 吕布</p>
											<p>C. 赵云</p>
											<p>D. 关羽</p>
											<a class="card-link " data-toggle="collapse" data-parent="#accordion " href="#collapse_1 ">
												查看解析
											</a>
										</div>
										<div class="collapse" id="collapse_1 ">
											<div class="card-footer ">
												<p>答案：</p>
												<span>选<label  class="rightAnswer">C</label>，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”</span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="card" id="sq-2">
										<div class="card-header ">
											<label class="mylabel-num">2</label>
											<div class="showMyAnswer">
												<label>你的答案：</label>
												<label class="myAnswer">C</label>
											</div>
										</div>
										<div class="card-body ">
											<p class="card-title ">王者荣耀中，草丛三婊指的是哪三婊（）？</p>
											<p>A. 露娜、貂蝉、甄姬</p>
											<p>B. 安琪丽、妲己、王昭君</p>
											<p>C. 亚瑟、钟馗、牛魔</p>
											<p>D. 刘备、关羽、张飞</p>
											<a class="card-link " data-toggle="collapse" data-parent="#accordion " href="#collapse_2 ">
												查看解析
											</a>
										</div>
										<div class="collapse " id="collapse_2 ">
											<div class="card-footer ">
												<p>答案：</p>
												<span>选<label  class="rightAnswer">B</label>，因为所以，科学道理</span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="card" id="sq-3">
										<div class="card-header ">
											<label class="mylabel-num">3</label>
											<div id="showMyAnswer">
												<label>你的答案：</label>
												<label class="myAnswer">C</label>
											</div>
										</div>
										<div class="card-body ">
											<p class="card-title ">这题答案选B，那么这题选（）</p>
											<p>A. 选B </p>
											<p>B. 选A</p>
											<!--<p>C. 7</p>
													<p>D. 9</p>-->
											<a class="card-link " data-toggle="collapse" data-parent="#accordion " href="#collapse_3 ">
												查看解析
											</a>
										</div>
										<div class="collapse " id="collapse_3 ">
											<div class="card-footer ">
												<p>答案：</p>
												<span>选<label  class="rightAnswer">B</label></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card" style="float:right ;  width:12%;">
				<div class="Answer-card">
					<div class="card-header input-group">
						<div style="text-align: center;margin:auto;">
							<span>答题卡</span>
						</div>
					</div>
					<div id="sq-card">
						<div class="card-header input-group" style="background-color: #ffffff;">
							<div style="text-align: center;margin:auto;">
								<span>单选题</span>
							</div>
							<div style="text-align: center;margin:auto">
								<span>共<label id="sqCount">3</label>题</span>
							</div>
						</div>
						<div class="card-body" style="border-bottom: 1px solid #e4e4e4;">
							<a href="#sq-1"><span class="myspan-Qu-Num" id="card-sq-1">1</span></a>
							<a href="#sq-2"><span class="myspan-Qu-Num" id="card-sq-2">2</span></a>
							<a href="#sq-3"><span class="myspan-Qu-Num" id="card-sq-3">3</span></a>
						</div>
					</div>
					<div id="mq-card">
						<div class="card-header input-group" style="background-color: #ffffff;">
							<div style="text-align: center;margin:auto;">
								<span>多选题</span>
							</div>
							<div style="text-align: center;margin:auto">
								<span>共<label id="mqCount">3</label>题</span>
							</div>
						</div>
						<div class="card-body" style="border-bottom: 1px solid #e4e4e4;">
							<a href="#mq-1"><span class="myspan-Qu-Num" id="card-mq-01">1</span></a>
							<a href="#mq-2"><span class="myspan-Qu-Num" id="card-mq-02">2</span></a>
							<a href="#mq-3"><span class="myspan-Qu-Num" id="card-mq-03">3</span></a>
						</div>
					</div>
					<div id="backHome" style="text-align: center;margin:auto;">
						<a href="student.jsp"><button class="btn btn-outline-info">返回主页</button></a>
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