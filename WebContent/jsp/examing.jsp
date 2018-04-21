<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/struts-tags" prefix="s"%> 
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
		<%-- <s:debug></s:debug> --%>
		
		<div class="container">
			<%-- <form action="${pageContext.request.contextPath }/exam_handPaper"> --%>
  			<div class="card" style="float:left ;  width:87%; ">
  				<div class="card-header" id="examInfo" style="text-align:center;">
					<p style="font-size:22px;padding-top:7px;">${exam.testpaper.tpname}</p>
				</div>
  				<div id="SingleQuestion">
  					<c:if test="${not empty exam.testpaper.squestions}">
		  				<div class="card-header" style="height: 70px;">
		  					<div class="form-inline">
		  						<h5 style="margin-right: 20px;">单选题</h5>
		  						<p class="myspan-fraction">
									<span>共</span><samp>${exam.testpaper.squestionSize}</samp><span>题，合计</span><samp>${exam.testpaper.sTotal}</samp><span>分</span>
								</p>
		  					</div>
		  				</div>
	  				</c:if>
	    			<div class="card-body">
	    				<c:forEach items="${exam.testpaper.squestions}" var="squestion" varStatus="status">
		    				<div id="sq-${status.index}" class="sqtimu">
		    					<label class="mylabel-num">${status.index}</label>
		    					<p> ${squestion.squestion }</p>
		    					<div class="radio radio-success radio-inline">
									<input type="radio" id="sq-${status.index}-option1" value="A" name="${squestion.sqno}">
									<label for="sq-${status.index}-option1">A. ${squestion.schoiceA }</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sq-${status.index}-option2" value="B" name="${squestion.sqno}">
									<label for="sq-${status.index}-option2">B. ${squestion.schoiceB }</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sq-${status.index}-option3" value="C" name="${squestion.sqno}">
									<label for="sq-${status.index}-option3">C. ${squestion.schoiceC }</label>
								</div>
								<div class="radio radio-success radio-inline">
									<input type="radio" id="sq-${status.index}-option4" value="D" name="${squestion.sqno}">
									<label for="sq-${status.index}-option4">D. ${squestion.schoiceD }</label>
								</div>
		    				</div>
		    				<br/>
	    				</c:forEach>
	    			</div>
    			</div>
    			<div id="MultipleQuestion">
    				<c:if test="${not empty exam.testpaper.mquestions}">
		  				<div class="card-header" style="height: 70px;">
		  					<div class="form-inline">
		  						<h5 style="margin-right: 20px;">多选题</h5>
		  						<p class="myspan-fraction">
									<span>共</span><samp>${exam.testpaper.mquestionSize}</samp><span>题，合计</span><samp>${exam.testpaper.mTotal}</samp><span>分</span>
								</p>
		  					</div>
		  				</div>
		  			</c:if>
	    			<div class="card-body">
	    				<c:forEach items="${exam.testpaper.mquestions}" var="mquestion" varStatus="status">
		    				<div id="mq-${status.index}" class="mqtimu">
		    					<label class="mylabel-num">${status.index}</label>
		    					<p>  ${mquestion.mquestion}</p>
		    					<div class="checkbox checkbox-success">
									<input id="mq-${status.index}-option1" class="styled" type="checkbox" value="A" name="${mquestion.mqno}">
								    <label for="mq-${status.index}-option1">A. ${mquestion.mchoiceA}</label>
								</div>
								<div class="checkbox checkbox-success">
									<input id="mq-${status.index}-option2" class="styled" type="checkbox" value="B" name="${mquestion.mqno}">
								    <label for="mq-${status.index}-option2">B. ${mquestion.mchoiceB}</label>
								</div>
								<div class="checkbox checkbox-success">
									<input id="mq-${status.index}-option3" class="styled" type="checkbox" value="C" name="${mquestion.mqno}">
								    <label for="mq-${status.index}-option3">C. ${mquestion.mchoiceC}</label>
								</div>
								<div class="checkbox checkbox-success">
									<input id="mq-${status.index}-option4" class="styled" type="checkbox" value="D" name="${mquestion.mqno}">
								    <label for="mq-${status.index}-option4">D. ${mquestion.mchoiceD}</label>
								</div>
		    				</div>
		    				<br/>
		    			</c:forEach>
	    			</div>
    			</div> 
    			<div id="FullQuestion">
    				<c:if test="${not empty exam.testpaper.fquestions}">
		  				<div class="card-header" style="height: 70px;">
		  					<div class="form-inline">
		  						<h5 style="margin-right: 20px;">填空题</h5>
		  						<p class="myspan-fraction">
									<span>共</span><samp>${exam.testpaper.fquestionSize}</samp><span>题，合计</span><samp>${exam.testpaper.fTotal}</samp><span>分</span>
								</p>
		  					</div>
		  				</div>
	  				</c:if>
	    			<div class="card-body">
	    				<c:forEach items="${exam.testpaper.fquestions}" var="fquestion" varStatus="status">
		    				<div id="fq-${status.index}" class="mqtimu">
		    					<label class="mylabel-num">${status.index}</label>
		    					<p>${fquestion.fquestion}</p>
		    					<div class="input-group input-group-sm">
								  <label style="margin-top: 6px;">请输入答案：</label>
								  <input type="text" class="form-control myfullinput col-3" name="${fquestion.fqno}" id= "fq-answer-${status.index}">
								</div>
		    				</div>
		    				<br />
	    				</c:forEach>
	    			</div>
    			</div>
    			<div class="card-footer">
	    			<div class="float-right">
						<button type="button" class="btn btn-outline-info" onclick="submitExam()">交卷</button>
					</div>
    			</div>
  			</div>
  			<!-- </form> -->
  			
  			<div class="card" style="float:right ;  width:12%;">
  				<div class="Answer-card">
  					<div class="card-header input-group">
	  						<div style="text-align: center;margin:auto;">
	  							<span>答题卡</span>
	  						</div>
	  						<div style="text-align: center;margin:auto">
	  							<span id="timer" class="myspan-time">${exam.examtime}</span>
	  						</div>
	  					</div>
	  				<c:if test="${not empty exam.testpaper.squestions}">
	  					<div id="sq-card">
		  					<div class="card-header input-group" style="background-color: #ffffff;">
		  						<div style="text-align: center;margin:auto;">
		  							<span>单选题</span>
		  						</div>
		  						<div style="text-align: center;margin:auto">
		  							<span>共${exam.testpaper.squestionSize}题</span>
		  						</div>
		  					</div>
		  					<div class="card-body" style="border-bottom: 1px solid #e4e4e4;">
		  						<c:forEach items="${exam.testpaper.squestions}" var="squestion" varStatus="status">
			  						<a href="#sq-${status.index}"><span class="myspan-Qu-Num" id="s-card-${status.index}">${status.index}</span></a>
		  						</c:forEach>
		  					</div>
	  					</div>
  					</c:if>
  					<c:if test="${not empty exam.testpaper.mquestions}">
	  					<div id="mq-card">
		  					<div class="card-header input-group" style="background-color: #ffffff;">
		  						<div style="text-align: center;margin:auto;">
		  							<span>多选题</span>
		  						</div>
		  						<div style="text-align: center;margin:auto">
		  							<span>共${exam.testpaper.mquestionSize}题</span>
		  						</div>
		  					</div>
		  					<div class="card-body" style="border-bottom: 1px solid #e4e4e4;" >
		  						<c:forEach items="${exam.testpaper.mquestions}" var="mquestion" varStatus="status">
		  							<a href="#mq-${status.index}"><span class="myspan-Qu-Num" id="m-card-${status.index}">${status.index}</span></a>
		  						</c:forEach>
		  					</div>
	  					</div>
  					</c:if>
  					<c:if test="${not empty exam.testpaper.fquestions}">
	  					<div id="fq-card">
							<div class="card-header input-group" style="background-color: #ffffff;">
								<div style="text-align: center;margin:auto;">
									<span>填空题</span>
								</div>
								<div style="text-align: center;margin:auto">
									<span>共${exam.testpaper.fquestionSize}题</span>
								</div>
							</div>
							<div class="card-body" style="border-bottom: 1px solid #e4e4e4;" >
								<c:forEach items="${exam.testpaper.mquestions}" var="mquestion" varStatus="status">
									<a href="#fq-${status.index}"><span class="myspan-Qu-Num" id="f-card-${status.index}">${status.index}</span></a>
								</c:forEach>
							</div>
						</div>
					</c:if>	
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
			    var CardId = QId.split('-');
			    var numCId="s-card-"+CardId[1];
			    $("span#"+numCId).css("background-color","#20c997");
			});
			$(document).on('change', '.mqtimu :checkbox', function() {
			    var QId = $(this).attr("id");
			    var CardId = QId.split('-');
			    var numCId="m-card-"+CardId[1];
			    var checkName = $(this).attr("name");
			    
			   if($('input[name='+checkName+']:checked').length > 0 ){
			   	
					$("span#"+numCId).css("background-color","#20c997");
				}else{
					$("span#"+numCId).css("background-color","#fff");
				}
			});
			
			$(document).on('keyup', '.mqtimu :text', function() {
			    var QId = $(this).attr("id");
			    var CardId = QId.split('-');
			    var numCId="f-card-"+CardId[2];

				if($(this).val().length > 0){
					$("span#"+numCId).css("background-color","#20c997");
				}else{
					$("span#"+numCId).css("background-color","#fff");
				}
			    
			});
		</script>
		
		<script type="text/javascript">
			function submitExam(){
				var sArr = new Array();
				var sAnswer ="";
				var mArr = new Array();
				var mAnswer ="";
				var fArr = new Array();
				var fAnswer = "";
				//获取所有radio的值
				$("#SingleQuestion").find("input[type='radio']").each(function(){
			        if($(this).is(":checked")){
			        	var sname = $(this).attr("name");
			        	
			            var oneQu = $(this).attr("name")+":"+$(this).val();
			        }
			        sAnswer += (","+oneQu);
			    });
			    console.log(sAnswer);
				// 获取所有checkbox的值
				$("#MultipleQuestion").find("input[type='checkbox']").each(function(){
			        if($(this).is(":checked")){
			            var oneQu = $(this).attr("name")+":"+$(this).val();
			        }
			        mAnswer += (","+oneQu);
			    });
			    console.log(mAnswer);


				// 获取所有text的值
				$("#FullQuestion").find("input[type='text']").each(function(){

			        var oneQu = $(this).attr("name")+":"+$(this).val();

			        fAnswer += (","+oneQu);
			    });
			    console.log(fAnswer);
			}
			/*
				,undefined,123:B,undefined,undefined,undefined,124:B,undefined,undefined
					
				,undefined,12:B,12:C,undefined,undefined,12:B,12:C,12:D
				
				,22:不是,23:是不是

				,undefined,123:B,undefined,undefined,undefined,124:B,undefined,undefined
				
				,undefined,12:B,12:C,undefined,undefined,12:B,12:C,12:D
				
				,22:,23:是不是

				,123:A,undefined,undefined,undefined,undefined,124:B,undefined,undefined
				
				,undefined,12:B,12:C,undefined,12:A,12:B,12:C,12:D
				
				,22:哈哈,23
			*/

		</script>
		
	</body>
</html>