<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/build.css" />
		<link rel="stylesheet" href="css/mycss.css" />

		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>

	<body background="img/kaoshi_002.jpg">
		<div class="container" style="background-color: rgba(255,255,255,0.8);">
			<div class="card" style="float:left ;  width:87%;">
				<div class="card-header">
					<span style="font-size:25px;">开始选择单选题:</span>
					<div class="float-right ">
						<button type="button " class="btn btn-outline-info ">随机出题</button>
					</div>
				</div>
				<div style="margin-top: 30px; margin-bottom:20px">
					<div class="input-group " style="margin-left: 30px;">
					    <input class="form-control col-sm-6 "  type="text " placeholder="题目/选项">
						<button class="btn btn-success-outline " type="submit ">Search</button>
					</div>
						
					<p>
						<span style="margin-left: 30px; ">题目难度：</span>
						<a href="# "><span style="margin-right: 20px; ">全部</span></a>
						<a href="# "><span style="margin-right: 20px; ">容易</span></a>
						<a href="# "><span style="margin-right: 20px; ">普通</span></a>
						<a href="# "><span style="margin-right: 20px; ">困难</span> </a>
						<a href="# "><span style="margin-right: 20px; ">绝望</span> </a>
					</p>
				</div>
				<div class="card">
					<table class="table table-hover ">
						<tbody>
							<tr>
								<td>
									<div class="card ">
										<div class="card-header">
											<label class="mylabel-num">1</label>
											<div class="float-right ">
												<div class="checkbox checkbox-success">
													<input id="sq01" class="styled" type="checkbox" value="1" name="SqNum">
													<label for="sq01">选中</label>
												</div>
											</div>
										</div>
										<div class="card-body ">
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
												<span>选C，因为貂蝉说“子龙哥哥，纵使天各一方，小婵依然....”</span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="card ">
										<div class="card-header ">
											<label class="mylabel-num">2</label>
											<div class="float-right ">
												<div class="checkbox checkbox-success">
													<input id="sq02" class="styled" type="checkbox" value="2" name="SqNum">
													<label for="sq02">选中</label>
												</div>
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
												<span>选B，因为所以，科学道理</span>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="card ">
										<div class="card-header ">
											<label class="mylabel-num">3</label>
											<div class="float-right ">
												<div class="checkbox checkbox-success">
													<input id="sq03" class="styled" type="checkbox" value="3" name="SqNum">
													<label for="sq03">选中</label>
												</div>
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
												<span>选C</span>
											</div>
										</div>
									</div>
								</td>	
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="card-footer" align="center">
					<button type="submit" class="btn btn-outline-info ">继续，下一步</button>
				</div>
				
			</div>
			<div class="card" style="float:right ;  width:12%;">
  				<div class="Answer-card">
  					<div class="card-header input-group">
	  						<div style="text-align: center;margin:auto;">
	  							<span>选题卡</span>
	  						</div>
	  					</div>
  					<div id="sq-card">
	  					<div class="card-header input-group" style="background-color: #ffffff;">
	  						<div style="text-align: center;margin:auto;">
	  							<span>已选单选题</span>
	  						</div>
	  						<div style="text-align: center;margin:auto">
	  							<span id="sqCount">共0题</span>
	  						</div>
	  					</div>
	  					<div class="card-body"  style="border-bottom: 1px solid #e4e4e4;" id="chooseCard">
	  						
	  					</div>
  					</div>
  				</div>
  			</div>
		</div>
		<script>//选题卡事件
			$(document).ready(function(){
				var arrNum=new Array();
				var i=0;
			    $("input[type='checkbox']").change(function(){
				  	var SquNum=$(this).val();
				    if($.inArray(SquNum, arrNum) >= 0){
				    	arrNum.splice($.inArray(SquNum,arrNum),1);
				    	$('div#chooseCard a#card-sq-'+SquNum).remove();
	                }
				    else{
	                	arrNum[i]=SquNum+"";i++;
	                	var htmltext='<a href="#sq-1" id="card-sq-'+SquNum+'"><span class="myspan-Qu-Num" style="background-color: #20c997;">'+SquNum+'</span></a>';
	                    $('div#chooseCard').append(htmltext);
	                }
				    var allnum=$('div#chooseCard a').length;
	                 $('#sqCount').text('共'+allnum+'题');
	                 //('共'+sqCount+'题');
			  });
			});
		</script>
	</body>
</html>