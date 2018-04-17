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
		<div class="container" style=" background-color: rgba(255,255,255,0.8);">
			<div>
				<nav class="navbar navbar-light bg-faded">
					<a class="navbar-brand" href="">
						<h1>100test</h1>
					</a>
					<div> 
						<a style="text-align: right;">欢迎你！老师</a>
						<a class="btn btn-outline-secondary" href="home.html">退出</a>
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
						<a class="nav-link" data-toggle="pill" href="#myPaper">我的试卷</a>
					</li>
					<br />
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#stuScore">学生成绩</a>
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
					<div id="myQuestion" class="container tab-pane active" >
						<div style="height: 50px;text-align: center;margin-left: 10%;margin-top: 3%;">
							<div class="input-group ">
					    		<input class="form-control col-sm-6 "  type="text " placeholder="题目/类型 ">
								<button class="btn btn-success-outline " type="submit ">Search</button>
							</div>
						</div>	
							
						<div  style="height: 130px; ">
							<p>
								<span style="margin-left: 30px; ">题目类型：</span>
								<a href="# "><span style="margin-right: 20px; ">全部</span></a>
								<a href="# "><span style="margin-right: 20px; ">单选</span></a>
								<a href="# "><span style="margin-right: 20px; ">多选</span></a>
								<a href="# "><span style="margin-right: 20px; ">填空</span> </a>
							</p>
							<p>
								<span style="margin-left: 30px; ">题目难度：</span>
								<a href="# "><span style="margin-right: 20px; ">全部</span></a>
								<a href="# "><span style="margin-right: 20px; ">容易</span></a>
								<a href="# "><span style="margin-right: 20px; ">普通</span></a>
								<a href="# "><span style="margin-right: 20px; ">困难</span> </a>
								<a href="# "><span style="margin-right: 20px; ">绝望</span> </a>
							</p>
							<div class="clearfix ">
								<div class="float-right ">
								<a href="addquestion.html "><button type="button " class="btn btn-outline-info ">添加题目</button></a>
								</div>
							</div>
					</div>		
				  	<br />
					<div id="accordion">
						<table class="table table-hover ">
							<tbody>
								<tr>
									<td>
										<div class="card ">
											<div class="card-header " >
												<label class="mylabel-num">1</label>
												<div class="float-right ">
													<button type="button " class="btn btn-outline-secondary btn-sm ">编辑</button>
													<button type="button " class="btn btn-outline-secondary btn-sm ">删除</button>
												</div>
											</div>
    										<div class="card-body "  >
												<p class="card-title ">在王者荣耀世界观中，貂蝉到底喜欢谁（）？</p>
	    										<p>A. 程咬金-爱与正义</p>
	    										<p>B. 吕布</p>
	    										<p>C. 赵云</p>
												<p>D. 关羽</p>
												<a class="card-link " data-toggle="collapse"  data-parent="#accordion " href="#collapse_1 ">
														查看解析
												</a>
    										</div>
											<div class="collapse" id="collapse_1 "> 
												<div class="card-footer " >
													<p>答案：</p>
													<span>选C，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”</span>
												</div>
											</div>
										</div>
										
									</td>
								</tr>
								<tr>
									<td>
										<div class="card ">
											<div class="card-header " >
												<label class="mylabel-num">2</label>
												<div class="float-right ">
													<button type="button " class="btn btn-outline-secondary btn-sm ">编辑</button>
													<button type="button " class="btn btn-outline-secondary btn-sm ">删除</button>
												</div>
											</div>
											<div class="card-body "  >
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
												<div class="card-footer " >
													<p>答案：</p>
													<span>选B，因为所以，科学道理</span>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="card ">
											<div class="card-header " >
												<label class="mylabel-num">3</label>
												<div class="float-right ">
													<button type="button " class="btn btn-outline-secondary btn-sm ">编辑</button>
													<button type="button " class="btn btn-outline-secondary btn-sm ">删除</button>
												</div>	
											</div>
											<div class="card-body "  >
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
												<div class="card-footer " >
													<p>答案：</p>
													<span>选C</span>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
						
					<div style="margin:0 auto; " align="center ">
						<ul class="pagination pagination-sm ">
							<li class="page-item "><a class="page-link " href="# ">上一页</a></li>
							<li class="page-item "><a class="page-link " href="# ">1</a></li>
							<li class="page-item active "><a class="page-link " href="# ">2</a></li>
							<li class="page-item "><a class="page-link " href="# ">3</a></li>
							<li class="page-item "><a class="page-link " href="# ">下一页</a></li>
						</ul>
					</div>
					</div>	
					<div id="myPaper" class="container tab-pane fade">
						<div class="input-group ">
					    	<input class="form-control col-sm-6 "  type="text " placeholder="题目/类型 ">
							<button class="btn btn-success-outline " type="submit ">Search</button>
						</div>
						<br />
						<div class="input-group">
							<sapn>试卷状态：</sapn>
							<div class="checkbox checkbox-success">
								<input id="mqanswer1" class="styled" type="checkbox">
							    <label for="mqanswer1">制作中</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mqanswer2" class="styled" type="checkbox">
							    <label for="mqanswer2">制作完成</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mqanswer3" class="styled" type="checkbox">
							    <label for="mqanswer3">审核中</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mqanswer4" class="styled" type="checkbox">
							    <label for="mqanswer4">即将开考</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mqanswer5" class="styled" type="checkbox">
							    <label for="mqanswer5">已考</label>
							</div>
						</div>
						<br />
						<div class="clearfix ">
							<div class="float-right ">
							<a href="addtestpaper.html"><button type="button " class="btn btn-outline-info ">制作新试卷</button></a>
							</div>
						</div>
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>
										<div class="card">
    										<div class="card-body">
    										<h4 class="card-title">全国英语四级考试</h4>
      										<p class="card-text">试卷编号：1531p</p>
      										<p class="card-text">考试时间：2018年8月8日 <span>9:00-11:30</span></p>
      										<p class="card-text">状态：制作中...</p>
      										<a href="" data-toggle="modal" data-target="#myModal" class="card-link"><p style="text-align: right;">查看试卷</p></a>
    										</div>
  										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="card">
    										<div class="card-body">
    										<h4 class="card-title">全国英语六级考试</h4>
      										<p class="card-text">考试编号：1531p</p>
      										<p class="card-text">考试时间：2018年8月8日 14:30-16:30</p>
      										<p class="card-text">状态：制作完成</p>
      										<a href="" data-toggle="modal" data-target="#myModal" class="card-link"><p style="text-align: right;">查看试卷</p></a>
    										</div>
  										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="card">
    										<div class="card-body">
    										<h4 class="card-title">全国英语四级模拟考试</h4>
      										<p class="card-text">考试编号：1531p</p>
      										<p class="card-text">考试时间：2018年8月8日 14:30-16:30</p>
      										<p class="card-text">状态：审核中...</p>
      										<a href="" data-toggle="modal" data-target="#myModal" class="card-link"><p style="text-align: right;">查看试卷</p></a>
    										</div>
  										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="card">
    										<div class="card-body">
    										<h4 class="card-title">全国英语六级模拟考试</h4>
      										<p class="card-text">考试编号：1531p</p>
      										<p class="card-text">考试时间：2018年8月8日 14:30-16:30</p>
      										<p class="card-text">状态：即将开考</p>
      										<a href="" data-toggle="modal" data-target="#myModal" class="card-link"><p style="text-align: right;">查看试卷</p></a>
    										</div>
  										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="card">
    										<div class="card-body">
    										<h4 class="card-title">英语期末考试</h4>
      										<p class="card-text">考试编号：1531p</p>
      										<p class="card-text">考试时间：2017年8月8日 14:30-16:30</p>
      										<p class="card-text">状态：已考</p>
      										<a href="" data-toggle="modal" data-target="#myModal" class="card-link"><p style="text-align: right;">查看试卷</p></a>
    										</div>
  										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="stuScore" class="container tab-pane fade">
						
					</div>
					<div id="myInfo" class="container tab-pane fade">
						<table class="table table-hover" style="border: hidden;">
							<tbody>
								<tr>
									<td><p style="text-align: center;">学号:</p></td>
									<td>201524133215</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">姓名:</p></td>
									<td>张创恒</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">性别:</p></td>
									<td>男</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">身份证号:</p></td>
									<td>445381199608250457</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">系别:</p></td>
									<td>计算机</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">班别:</p></td>
									<td>15软件2班</td>
								</tr>
								<tr>
									<td><p style="text-align: center;">电话:</p></td>
									<td>15767044123</td>
								</tr>
								<tr>
									<td><a href=""><p style="text-align: center;">修改密码</p></a></td>
									
								</tr>
							</tbody>
						</table>
					</div>
					<div id="about" class="container tab-pane fade">
						<div>
							<h3 align="center">欢迎使用100test在线考试系统</h3>
							<!--<p align="center">
								100test在线考试系统是全球最专业、最完美的考试系统，
								它是由宇宙知名队伍“菜鸟A队”出品，集合世界上最先进的技术--ssh框架+Bootstrap开发而成！
								具有超强的专业性、可靠性、以及可扩展性！
							</p>-->
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">请确认考生信息</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
					
						<!-- 模态框主体 -->
						<div class="modal-body">
							<p>姓名:张恒</p>
							<p>身份证号:445381199605250457</p>
							<p>确认进入考试？</p>
						</div>
					
						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="examing.html" type="button" class="btn btn-outline-light text-dark">确定</a>
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
	<body/>
</html>