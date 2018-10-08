<%@ page language="java" import="bean.UserBean,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">  
    <title>管理员界面</title>
    
  </head>
<frameset frameborder="no" rows="135px,900px">     
    <frame name="head" src="${pageContext.request.contextPath}/frame/head.jsp">
	<frameset  cols="285px, *">	    
		<frame name="left" src="${pageContext.request.contextPath}/frame/left.jsp">
		<frameset rows="40px,*">
		     <frame name="time" src="${pageContext.request.contextPath}/frame/time.jsp?username=${param.username}">
		     <frame name="mainAction">
		</frameset>				
	</frameset>
</frameset>
</html>
