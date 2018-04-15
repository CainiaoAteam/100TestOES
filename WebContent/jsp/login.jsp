<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>登录</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js" ></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
  
  <script type="text/javascript">
  // 	var thisURL = document.URL;
		// var getval = thisURL.split('?')[1];
		// var showval = getval.split("=")[1];
		// function showvalf() {
		// 	document.getElementById('type').value = showval;
		// }
  </script>
  
  <!--<script type="text/javascript">
  	function showform(){
  		var uname=document.getElementById('usr').value;
  		var utype=document.getElementById("type").value;
  		
  		alert(uname+utype);
  	}
  </script>-->
</head>
<script>
</script>
<body style="background-image: url(${pageContext.request.contextPath }/img/index_bg2.jpg);" onload="showvalf()">
<div>
  <div class= "vertically-center" style="width:350px;background: white;padding: 30px;border-radius: 10px;opacity: 0.8;">
  <form action="${pageContext.request.contextPath }/login_login">
    <div class="form-group">
      <label for="usr">账号:</label>
      <input type="text" class="form-control" id="user" name="username" placeholder="Enter username">
    </div>
    <div class="form-group">
      <label for="pwd">密码:</label>
      <input type="password" class="form-control" id="pwd" name="password" placeholder="Enter password">
    </div>
    <div>
      <input type="hidden" name="type" value="${sessionScope.role}">
    </div>
    <!-- <div style="display:none">
      <label for="type">类型:</label>
      <input type="test" class="form-control" id="type" name="type" value="${sessionScope.role}">
    </div> -->
    <div class="form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox">记住密码
      </label>
    </div>
    <div class="text-center">
    	<button type="submit" class="btn" onclick="showform()">登陆</button>
    </div> 
  </form>
  </div>
</div>
</body>
</html>