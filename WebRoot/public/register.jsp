<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<title>注册</title>
<meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:if test="${param.status.equals('1')}">
	<div class="alert alert-danger" role="alert" id="success">注册成功</div>	
	<script type="text/javascript">
	    var jump = setInterval(go, 1000);  
	    var x = 5;					    			    
	    function go()
	    {					        
	        if(x>0)
	        {
	           $("#success").html("注册成功"+x+"秒后跳转到登录界面<button id='stay' type='button' onclick='clearJump()' class='btn btn-link'>留在页面</button>");
	           x--;
	        }
	        else
	        {
	           window.location.href = "login.html";
	        }					        
	    }
	    function clearJump()
	    {
	         clearInterval(jump);
	         $("#success").remove();
	    }   							    
	</script>				
</c:if>			
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
    $(function(){
	var address;
	$.get("resources/address.xml",function(data){
		address = data;
		init();
	});
	function init() {
	    $(address).find("city").each(function(n){
	     	$("#city").append("<option value='"+$(this).attr("value")+"'>"+$(this).attr("name")+"</option>")
	    });
	    $("#city").change(function(event){
	    	$("#country option:not(:first)").remove();
	     	$(address).find("city[value='"+$(this).val()+"'] country").each(function(n){
	         	$("#country").append("<option value='"+$(this).attr("value")+"'>"+$(this).attr("name")+"</option>")
	     	});
	    });
		// $(address).find("city").each(function(n){
		// 	$("#city").append("<li role='presentation'><a href='' onclick='return false' value='"+$(this).attr("value")
		// 	+"' role='menuitem'>"+$(this).attr("name")+"</a></li>")
		// });
		// $("#city li a").click(function(){
		//         $("#dropdownMenu1").html($(this).html());
		//         $("#dropdownMenu1").val($(this).html())
		//         alert($("#dropdownMenu1").val());
		// 		$(address).find("city[value='"+$(this).attr("value")+"'] country").each(function(n){
		// 			$("#cou").append("<li role='presentation'><a href='' onclick='return false' value='"+$(this).attr("value")
		// 			+"' role='menuitem'>"+$(this).attr("name")+"</a></li>")
		// 		});
		// 		$("#cou li a").click(function(){
		//         		$("#dropdownMenu2").html($(this).html());
		//         		$("#dropdownMenu2").val($(this).html());
		//         		alert($("#dropdownMenu2").val())
		//         });
		// });
	}
});
</script>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/yanzheng.js"></script>
<body>   
	<div class="row-fluid">
		<div class="col-md-6">
			<form role="form" class="form-horizontal"
				action="user-register"
				method="post" id="checkForm">
				<div class="form-group">
					<label class="col-md-3 control-label" for="username">*用户名</label>
					<div class="col-md-9">
						<input class="form-control" name="username" type="text" id="username" placeholder="Name" value="${updateBean.username }" autofocus="autofocus"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="name">*姓名</label>
					<div class="col-md-9">
						<input class="form-control" name="name" type="text" id="name" placeholder="Name" value="${updateBean.name }"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="password">*密码</label>
					<div class="col-md-9">
						<input type="password" name="password" class="form-control" id="inputPassword" placeholder="password" value="${updateBean.password }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="confirmPassword">*确认密码</label>
					<div class="col-md-9">
						<input  type="password" name="confirmPassword2" class="form-control" id="password2" placeholder="conformPassword" value="${updateBean.password }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="identify">*身份证号</label>
					<div class="col-md-9">
						<input type="text" name="identify" class="form-control" id="number" placeholder="number" value="${updateBean.number }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="postcode">邮政编码</label>
					<div class="col-md-9">
						<input onkeyup="checkspecial(this.value)" type="text" name="postcode" class="form-control" id="postcode" placeholder="postcode" value="${updateBean.postcode }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="phone">电话</label>
					<div class="col-md-9">
						<input type="text" name="phone" class="form-control" id="phone" placeholder="phone" value="${updateBean.phone }">
					</div>
				</div>
		        <div class="form-group">
			        <label class="col-md-3 control-label" for="field">所在地域</label>
			            <div class="col-md-9">
				          <select style="width: 240px; float:left;" class="form-control" name="field" id="city">
				            <option>请选择城市</option>
				          </select>
				          <select style="width: 240px; float:center;" class="form-control" name="field" id="country">
				            <option>请选择县份</option>
				          </select>
			            </div>
		        </div>

				   <!--  <select class="form-control" id="city"><option>请选择城市</option></select>
                    <select class="form-control" id="country"><option>请选择县份</option></select>
 -->
					<!-- <div class="col-md-9">
					  <nav class="navbar navbar-default" role="navigation">
						  <div id="x1">
						     <ul class="nav navbar-nav">
							    <li class="dropdown"><a id="dropdownMenu1" name="field1" href="#" onclick="return false" class="dropdown-toggle" data-toggle="dropdown">请选择城市 <b class="caret"></b></a>
								    <ul id="city" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								    </ul>
							    </li>
							    <li class="dropdown"><a id="dropdownMenu2" name="field" href="#" onclick="return false" class="dropdown-toggle" data-toggle="dropdown">请选择县份 <b class="caret"></b></a>
								    <ul id="cou" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
								    </ul>
							    </li>
							 </ul>
						  </div>
					   </nav>
					</div> -->
				<div class="form-group">
					<label class="col-md-3 control-label" for="company">*机构全称</label>
					<div class="col-md-9">
						<input onkeyup="checkspecial(this.value)" type="text" name="company" class="form-control" id="company" placeholder="company" value="${updateBean.company }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="address">通讯地址</label>
					<div class="col-md-9">
						<input onkeyup="checkspecial(this.value)" type="text" name="address" class="form-control" id="address" placeholder="address" value="${updateBean.address }">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-3 col-md-9">
						<button type="submit" class="btn btn-primary btn-block">提交</button>
					</div>
				</div>
				
				<c:if test="${param.status.equals('3')}">
					<div class="alert alert-danger" role="alert">注册失败</div>
				</c:if>
			</form>
		</div>
		<div class="col-md-3"></div>
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