<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="bootstrap.css" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
  <script type="text/javascript">
	    var initializationTime=(new Date()).getTime();
		function showLeftTime()
		{
			var now=new Date();
			var year=now.getYear();
			var month=now.getMonth();
			var day=now.getDate();
			var hours=now.getHours();
			var minutes=now.getMinutes();
			var seconds=now.getSeconds();
			document.all.show.innerHTML=""+(year-100+2000)+"年"+(month+1)+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
			//一秒刷新一次显示时间
			var timeID=setTimeout(showLeftTime,1000);
		}
		//width="1285" height="159"
		//<img src="http://localhost:8080/Demand/images/index_01.jpg" alt="加载失败">
</script>
  <body onload="showLeftTime()">             
      <div class="navbar-default">     
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
	         <tr> 
	            <td width="50%">您好，${sessionScope.userBean.username}</td>           
	            <td width="30%">当前时间<label id="show">显示时间的位置</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <a target="_parent" href="${pageContext.request.contextPath}/AdminServlet?method=end&status=1">退出登录</a></td>	             
	         </tr>
	     </table>
	  </div>	                                             
  </body>
</html>
