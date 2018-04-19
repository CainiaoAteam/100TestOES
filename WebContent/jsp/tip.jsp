<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>TIP</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- FONT AWESOME CSS -->
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" />
    <!--GOOGLE FONT -->
 	<link href='http://fonts.googleapis.com/css?family=Nova+Flat' rel='stylesheet' type='text/css'>
    <!-- custom CSS here -->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="row pad-top text-center">
            <div class="col-md-6 col-md-offset-3 text-center">
                <h1 style="color: red;"> TIP: </h1>
                <h5> 100Test By CAINIAO A TEAM</h5> 
              	<span style="font-size: 50px;padding: 10px;">MODIFY THE PASSWORD SUCCEED</span>
                <h2>after <i id="second" style="color: red;"></i> seconds to turn....</h2>
			</div>
        </div>

        <div class="row text-center">
            <div class="col-md-8 col-md-offset-2">  
                <h3> <i  class="fa fa-lightbulb-o fa-5x"></i> </h3>
                <a style="font-size: 23px;" href="${pageContext.request.contextPath }/basic_toUserIndex" class="btn btn-primary">Turn Now</a> 
			</div>
        </div>
    </div>
    <!-- /.container -->
 
    <!--Core JavaScript file  -->
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.js"></script>
    <!--bootstrap JavaScript file  -->
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
     <!--Count Number JavaScript file  -->
    <script src="${pageContext.request.contextPath }/js/countUp.js"></script>
       <!--Custom JavaScript file  -->
    <script src="${pageContext.request.contextPath }/js/custom.js"></script>

	<script type="text/javascript">
		window.onload = function(){
			//页面一加载将该提示秒数变成3
			alert("hahha");
			$("#second").html("3");
			var arr=['2','1'];
			var i = 0;
			var time = setInterval(function(){
				if(i>1){
					i=0;
				}
				$("#second").html(arr[i]);
				i++;
			},1000);

			//q清除定时器
			setTimeout(function(){
				clearInterval(time);
				//修改成功的话回到这个页面，之后在跳转到index
				window.location.href="${pageContext.request.contextPath }/basic_toUserIndex";
			},3000);

		}
	</script>
</body>
</html>
