<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			<div class="card" style="float:left ;  width:87%;">
				<div class="card-header">
					<span style="font-size:25px;">开始选择填空题:</span>
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
													<input id="fq01" class="styled" type="checkbox" value="1" name="FqNum">
													<label for="fq01">选中</label>
												</div>
											</div>
										</div>
										<div class="card-body ">
						    				<p>西游记的作者是:（）.</p>
											<a class="card-link " data-toggle="collapse" data-parent="#accordion " href="#collapse_1 ">
												查看解析
											</a>
										</div>
										<div class="collapse" id="collapse_1 ">
											<div class="card-footer ">
												<p>答案：</p>
												<span>是我</span>
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
													<input id="fq02" class="styled" type="checkbox" value="2" name="FqNum">
													<label for="fq02">选中</label>
												</div>
											</div>
										</div>
										<div class="card-body ">
											<p class="card-title ">1+1=（）？</p>
											<a class="card-link " data-toggle="collapse" data-parent="#accordion " href="#collapse_2 ">
												查看解析
											</a>
										</div>
										<div class="collapse " id="collapse_2 ">
											<div class="card-footer ">
												<p>答案：</p>
												<span>=3</span>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="card-footer" align="center">
					<button type="submit" class="btn btn-outline-info" >完成并生成试卷</button>
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
	  							<span>已选填空题</span>
	  						</div>
	  						<div style="text-align: center;margin:auto">
	  							<span id="fqCount">共0题</span>
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