<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>修改密码</title>
<meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"type="text/css"href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css"/>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/confirmPass.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
    $(function(){
          $("#oldpassword").blur(function(){             
              judge(this.value,'${userBean}'==''?'${adminBean.password}':'${userBean.password}','${userBean}'==''?'${adminBean.salt}':'${userBean.salt}');        
          });            
    });
</script>
<body>
	<div class="row-fluid">		
		<form role="form" class="form-horizontal"
			action="${pageContext.request.contextPath}/${empty userBean?'AdminServlet':'UserServlet'}?method=password"
			method="post" id="checkForm">
			<div class="col-md-6">
			    ${userBean.name}							      
			    <label class="col-md-3 control-label" for="oldpassword">原密码</label>
			    <div id="old">
				   <input class="form-control" name="oldpassword" type="password" id="oldpassword" placeholder="oldPassword" autofocus="autofocus"/>
			    </div>
			    <label class="col-md-3 control-label" for="inputPassword">新密码</label>
			    <div >
				   <input class="form-control" name="inputPassword" type="password" id="inputPassword" placeholder="newPassword"/>				   
		        </div>
		        <label class="col-md-3 control-label" for="password2">确认密码</label>
			    <div >
				   <input class="form-control" name="password2" type="password" id="password2" placeholder="confirmPassword"/>				   
		        </div>
		        <div>
					<button type="submit" class="btn btn-primary btn-block">提交</button>
				</div>
				<c:if test="${param.sta.equals('1')}">
				<div class="alert alert-danger" role="alert">修改成功</div>
				</c:if>				
				<c:if test="${param.sta.equals('2')}">
					<div class="alert alert-danger" role="alert">修改失败</div>
			    </c:if>
			</div>				      			      			  			      				    			  																
		</form>
	</div>		
	
	<script
		src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.validate.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/myValidate.js"
		type="text/javascript"></script>
</body>
</html>