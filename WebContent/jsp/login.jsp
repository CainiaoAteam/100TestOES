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
  <style type="text/css">
    .tipErro{
      color: red;
    }
    .tipTrue{
    	color: green;
    }
  </style>
  <script type="text/javascript">
  	function checkName(){
      //获取输入框中的内容
      var $sno = $("#user").val();
      var oTip = $("#checkTip");
      //输入内容为空
      if($sno.trim() == "" || $sno == "Enter username"){
        oTip.html("输入内容不能为空！");
        oTip.addClass("tipErro");
      }else {
        //输入内容不为空，发送请求
        var url="${pageContext.request.contextPath }/login_checkNameIsExit";
        var param = {"sno":$sno, "type":$("#usertype").val()};

        //发送请求
        $.post(url,param,function(data){

          if(data.msg == "no"){
        	  oTip.html("输入学号不正确！");
              oTip.addClass("tipErro");
              checkPassword();
          }
          else if(data.msg == "yes"){
        	  oTip.html("输入学号正确！");
    		  oTip.removeClass("tipErro");
              oTip.addClass("tipTrue");
          }

        },"json");
      }
    }
  	
  	//检查密码是否正确
  	
  	function checkPassword(){
  	//获取输入框中的内容
        var $sno = $("#user").val();
  		var $psw = $("#psw").val();
        var oTip = $("#pswTip");
        //输入内容为空
        if($psw.trim() == "" || $psw == "Enter password"){
          oTip.html("密码不能为空！");
          oTip.addClass("tipErro");
        }else {
          //输入内容不为空，发送请求
          var url="${pageContext.request.contextPath }/login_checkPassword";
          var param = {"sno":$sno,"password":$psw ,"type":$("#usertype").val()};

          //发送请求
          $.post(url,param,function(data){

            if(data.msg == "no"){
          	  oTip.html("输入密码不正确！");
                oTip.addClass("tipErro");
            }
            else if(data.msg == "yes"){
          	  oTip.html("输入密码正确！");
      		  oTip.removeClass("tipErro");
              oTip.addClass("tipTrue");
               
              //让登录按钮可以作用
              $("#submit").removeAttr("disabled");
            }
          },"json");
        }
  	}
  	
  </script>
</head>
<script>
</script>
<body style="background-image: url(${pageContext.request.contextPath }/img/index_bg2.jpg);">
<div>
  <div class= "vertically-center" style="width:350px;background: white;padding: 30px;border-radius: 10px;opacity: 0.8;">
  <form action="${pageContext.request.contextPath }/login_login" method="post">
    <div class="form-group">
      <label for="usr">账号:</label>
      <input type="text" class="form-control" id="user" name="sno" onblur="checkName()" placeholder="Enter username">
      <span id="checkTip"></span>
    </div>
    <div class="form-group">
      <label for="pwd">密码:</label>
      <input id="psw" type="password" class="form-control" id="pwd" name="password" onblur="checkPassword()" placeholder="Enter password">
      <span id="pswTip"></span>
    </div>
    <div>
      <input id="usertype" type="hidden" name="type" value="${sessionScope.role}">
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
    	<button id="submit" disabled="disabled" type ="submit" class="btn">登陆</button>
    </div> 
  </form>
  </div>
</div>
</body>
</html>