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