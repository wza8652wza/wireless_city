<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Error Page</title>
  </head>
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <body>
    访问出错！<span id="count">10</span>秒后回到主页！
    <script type="text/javascript">
    	$(function(){
    		var count=$("#count").text();
    		var timer=null;
    		clearInterval(timer);
    		timer=setInterval(function(){
        		count--;
        		if(count<1){window.location.href="font/index.jsp";}
        		if(count==0){count++;}
        		$("#count").text(count);
    		},1000);
    	});
    </script>
  </body>
</html>