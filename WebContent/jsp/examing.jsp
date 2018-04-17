<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/build.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	<body >
		<div class="container">
  			<div class="card" style="float:left ;  width:87%; ">
  				<div id="SingleQuestion">
	  				<div class="card-header" style="height: 70px;">
	  					<div class="form-inline">
	  						<h5 style="margin-right: 20px;">单选题</h5>
	  						<p class="myspan-fraction">
								<span>共</span><samp>5</samp><span>题，合计</span><samp>5</samp><span>分</span>
							</p>
	  					</div>
	  				</div>
	    			<div class="card-body">
	    				<div id="sq-1" class="sqtimu">
	    					<label class="mylabel-num">1</label>
	    					<p> 在生产管理信息系统中，下列操作步骤能正确将工单推进流程的是（ ）</p>
	    					<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-01-option1" value="option1" name="sq-01-sqdifficulty">
								<label for="sq-01-option1">A. 在工具栏中点击“workflow”标签</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-01-option2" value="option2" name="sq-01-sqdifficulty">
								<label for="sq-01-option2">B. 在缺陷单界面中点击“推进流程”按钮</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-01-option3" value="option3" name="sq-01-sqdifficulty">
								<label for="sq-01-option3">C. 在缺陷单界面中点击“提交”按钮</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-01-option4" value="option4" name="sq-01-sqdifficulty">
								<label for="sq-01-option4">D. 后台启动流程推进</label>
							</div>
	    				</div>
	    				<br/>
	    				<div id="sq-2" class="sqtimu">
	    					<label class="mylabel-num">2</label>
	    					<p> 在生产管理信息系统中，下列操作步骤能正确将工单推进流程的是（ ）</p>
	    					<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-02-option1" value="option1" name="sq-02-sqdifficulty">
								<label for="sq-02-option1">A. 在工具栏中点击“workflow”标签</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-02-option2" value="option2" name="sq-02-sqdifficulty">
								<label for="sq-02-option2">B. 在缺陷单界面中点击“推进流程”按钮</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-02-option3" value="option3" name="sq-02-sqdifficulty">
								<label for="sq-02-option3">C. 在缺陷单界面中点击“提交”按钮</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-02-option4" value="sq-2-option4" name="sq-02-sqdifficulty">
								<label for="sq-02-option4">D. 后台启动流程推进</label>
							</div>
	    				</div>
	    				<br/>
	    				<div id="sq-3" class="sqtimu">
	    					<label class="mylabel-num">3</label>
	    					<p> 在生产管理信息系统中，下列操作步骤能正确将工单推进流程的是（ ）</p>
	    					<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-03-option1" value="option1" name="sq-03-sqdifficulty">
								<label for="sq-03-option1">A. 在工具栏中点击“workflow”标签</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-03-option2" value="option2" name="sq-03-sqdifficulty">
								<label for="sq-03-option2">B. 在缺陷单界面中点击“推进流程”按钮</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-03-option3" value="option3" name="sq-03-sqdifficulty">
								<label for="sq-03-option3">C. 在缺陷单界面中点击“提交”按钮</label>
							</div>
							<div class="radio radio-success radio-inline">
								<input type="radio" id="sq-03-option4" value="option4" name="sq-03-sqdifficulty">
								<label for="sq-03-option4">D. 后台启动流程推进</label>
							</div>
	    				</div>
	    			</div>
    			</div>
    			<div id="MultipleQuestion">
	  				<div class="card-header" style="height: 70px;">
	  					<div class="form-inline">
	  						<h5 style="margin-right: 20px;">多选题</h5>
	  						<p class="myspan-fraction">
								<span>共</span><samp>5</samp><span>题，合计</span><samp>5</samp><span>分</span>
							</p>
	  					</div>
	  				</div>
	    			<div class="card-body">
	    				<div id="mq-1" class="mqtimu">
	    					<label class="mylabel-num">1</label>
	    					<p>  对 “热爱祖国、热爱南网、热爱岗位”理解正确的是()</p>
	    					<div class="checkbox checkbox-success">
								<input id="mq-01-answer1" class="styled" type="checkbox">
							    <label for="mq-01-answer1">A. 坚持南网的利益高于一切</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-01-answer2" class="styled" type="checkbox">
							    <label for="mq-01-answer2">B. 忠诚南网事业，维护南网利益</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-01-answer3" class="styled" type="checkbox">
							    <label for="mq-01-answer3">C. 人往高处走，水往低处流，专注于爬上更高的岗位</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-01-answer4" class="styled" type="checkbox">
							    <label for="mq-01-answer4">D. 个人利益第一，南网利益第二</label>
							</div>
	    				</div>
	    				<br />
	    				<div id="mq-2" class="mqtimu">
	    					<label class="mylabel-num">2</label>
	    					<p>  对 “热爱祖国、热爱南网、热爱岗位”理解正确的是()</p>
	    					<div class="checkbox checkbox-success">
								<input id="mq-02-answer1" class="styled" type="checkbox">
							    <label for="mq-02-answer1">A. 坚持南网的利益高于一切</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-02-answer2" class="styled" type="checkbox">
							    <label for="mq-02-answer2">B. 忠诚南网事业，维护南网利益</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-02-answer3" class="styled" type="checkbox">
							    <label for="mq-02-answer3">C. 人往高处走，水往低处流，专注于爬上更高的岗位</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-02-answer4" class="styled" type="checkbox">
							    <label for="mq-02-answer4">D. 个人利益第一，南网利益第二</label>
							</div>
	    				</div>
	    				<br />
	    				<div id="mq-3" class="mqtimu">
	    					<label class="mylabel-num">13</label>
	    					<p>  对 “热爱祖国、热爱南网、热爱岗位”理解正确的是()</p>
	    					<div class="checkbox checkbox-success">
								<input id="mq-03-answer1" class="styled" type="checkbox">
							    <label for="mq-03-answer1">A. 坚持南网的利益高于一切</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-03-answer2" class="styled" type="checkbox">
							    <label for="mq-03-answer2">B. 忠诚南网事业，维护南网利益</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-03-answer3" class="styled" type="checkbox">
							    <label for="mq-03-answer3">C. 人往高处走，水往低处流，专注于爬上更高的岗位</label>
							</div>
							<div class="checkbox checkbox-success">
								<input id="mq-03-answer4" class="styled" type="checkbox">
							    <label for="mq-03-answer4">D. 个人利益第一，南网利益第二</label>
							</div>
	    				</div>
	    			</div>
	    			
    			</div> 
    			<div class="card-footer">
	    			<div class="float-right">
						<button type="submit" class="btn btn-outline-info">交卷</button>
					</div>
    			</div>
    			<!--<div>
    				<div class="card-footer" style="position: fixed;bottom: 0;left: 20%;right: 20%;">
	    				<span id="timer" class="myspan-time">150</span>
	    				<div class="float-right">
							<button type="submit" class="btn btn-outline-info">交卷</button>
						</div>
    				</div>
    			</div>-->
  			</div>
  			
  			<div class="card" style="float:right ;  width:12%;">
  				<div class="Answer-card">
  					<div class="card-header input-group">
	  						<div style="text-align: center;margin:auto;">
	  							<span>答题卡</span>
	  						</div>
	  						<div style="text-align: center;margin:auto">
	  							<span id="timer" class="myspan-time">150</span>
	  						</div>
	  					</div>
  					<div id="sq-card">
	  					<div class="card-header input-group" style="background-color: #ffffff;">
	  						<div style="text-align: center;margin:auto;">
	  							<span>单选题</span>
	  						</div>
	  						<div style="text-align: center;margin:auto">
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
	  					<div class="card-header input-group" style="background-color: #ffffff;">
	  						<div style="text-align: center;margin:auto;">
	  							<span>多选题</span>
	  						</div>
	  						<div style="text-align: center;margin:auto">
	  							<span>共5题</span>
	  						</div>
	  					</div>
	  					<div class="card-body" style="border-bottom: 1px solid #e4e4e4;" >
	  						<a href="#mq-1"><span class="myspan-Qu-Num" id="card-mq-01">1</span></a>
	  						<a href="#mq-2"><span class="myspan-Qu-Num" id="card-mq-02">2</span></a>
	  						<a href="#mq-3"><span class="myspan-Qu-Num" id="card-mq-03">3</span></a>
	  					</div>
  					</div>
  					
  				</div>
  			</div>
		</div>
  		<script type="text/javascript">//考试倒计时
			var Counttime=document.getElementById("timer").textContent;		
			var allSecond = Counttime * 60000; //计算剩余的小时
			function dateFtt(fmt, date) { 
				var o = {
					"h+": date.getHours()-8, //小时   
					"m+": date.getMinutes(), //分   
					"s+": date.getSeconds(), //秒   
					"S": date.getMilliseconds() //毫秒   
				};
				if(/(y+)/.test(fmt))
					fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
				for(var k in o)
					if(new RegExp("(" + k + ")").test(fmt))
						fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
				return fmt;
			}
			var crtTime = new Date(allSecond);
			document.getElementById("timer").innerHTML = dateFtt("hh:mm:ss", crtTime);
			setInterval(function(){ 
				allSecond -= 1000;
				var crtTime = new Date(allSecond);
				document.getElementById("timer").innerHTML = dateFtt("hh:mm:ss", crtTime);
			},1000);
		</script>
		
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