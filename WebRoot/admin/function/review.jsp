<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.UserBean,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <style type="text/css">
          .div-inline{
             display: inline;
          }
          .div1{
             float: left;
          }
     </style>
     <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/myValidate.js"></script>
     <link rel="stylesheet"type="text/css"href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css"/>
  </head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jilian.js"></script>
  <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/yanzheng.js"></script> -->
  <body onload="initSelArray('selA','selB','selC');buildSelect('0','selA')">   
     <div style="text-align:center;">
          <h2>河北省重大技术需求征集表</h2>                    
     </div>         
     <div style="text-align:center;">
         <form action="${pageContext.request.contextPath}/DemandServlet" id="checkForm" method="post" target="mainAction">          
            <table align="center"  border="1">
               <tr>
                  <td>机构名称                 
                  <td>                                     
                      <input id="unitname" name="unitname" type="text" size="50" value="${userBean.company}" onblur="IsValid(this)">                                     
                  </td>                                
               </tr>
               <tr>
                  <td>通讯地址
                  <td><input id="address" name="address" type="text" size="50" value="${userBean.address}" onblur="IsValid(this)"></td>	                
               </tr>
               <tr>
                  <td>单位网址<input id="website" name="website" type="url" autofocus="autofocus" value="${userBean.website}" onblur="checkUrl(this.value,this.id)">
                  <td>电子信箱<input type="email" id="email" name="email" value="${userBean.mailbox}" onblur="checkemail(this.value,this.id)">
               </tr> 
               <tr>
                  <td>法人代表<input type="text" id="legalperson" name="legalperson" value="${userBean.legalperson}" onblur="checkName(this.value,this.id)">
                  <td>邮政编码<input type="text" id="postcode" name="postcode" value="${userBean.postcode}"onblur="checkpostcode(this.value,this.id)">
               </tr>
               <tr>
                  <td>联系人&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="contactperson" name="contactperson" value="${userBean.address}" onblur="checkName(this.value,this.id)"></td>
                  <td>
                      <table>
                         <tr>
                             <td>电话
                             <td><input id="telephone" name="telephone" onblur="checktelephone(this.value,this.id);blu(this.id)" onfocus="foc(this.id)"  type="text" value="固定电话">
                              &nbsp;&nbsp;<input id="mobile" name="mobile" onblur="checkPhone(this.value,this.id);blu(this.id)" onfocus="foc(this.id)" type="text" value="手机电话">                           
                         </tr>
                         <tr>
                             <td>传真
                             <td><input type="text" id="tax" name="tax" onblur="checktax(this.value, this.id)">
                         </tr>
                      </table>                                             
                  </td>              
               </tr>
               <tr>
                  <td>机构属性</td>
                  <td>
                      <input id="unit" name="unit" type="radio" value="企业" checked onchange="checkunit(this.value)">企业
                      <input id="unit" name="unit" type="radio" value="高等院校" onchange="checkunit(this.value)">高等院校
                      <input id="unit" name="unit" type="radio" value="研究机构" onchange="checkunit(this.value)">研究机构
                      <input id="unit" name="unit" type="radio" value="其他" onchange="checkunit(this.value)">其他
                      <input style="display: none;" id="hid1" type="text">
                  </td>
               </tr>  
               <tr>
                  <td>机构简介</td>
                  <td>                
                 <textarea id="unitbrief" name="unitbrief" onblur="IsValid(this);blu(this.id,this.value);" onfocus="foc(this.value,this.id)" onpropertychange="checkLength(this,200);" oninput="checkLength(this,200);" rows="6" cols="50">
(单位基本情况，研究基础等，限200字)
	               </textarea>
	             </td>
               </tr>                                                                       
               <tr>
                  <td>技术需求名称
                  <td><input type="text" size="80" id="demandname" name="demandname" onblur="IsValid(this)"></td>	                
               </tr>
               <tr>
                 <td>重大技术需求概述</td>                  
                 <td>                
                 <textarea id="demand" name="demand" onblur="IsValid(this);blu(this.id,this.value)" onfocus="foc(this.value,this.id)" onpropertychange="checkLength(this,500);" oninput="checkLength(this,500);" rows="4" cols="50">
(主要内容，技术指标，预期经济和社会效益等，限500字)
	               </textarea>
	             </td>
	           </tr>
	           <tr>
	             <td>
	                                          关键字（查询使用）
	             </td>
	             <td>
	                <input type="text" id="keyword" name="keyword" value="" onblur="IsValid(this)">
	                <input type="text" id="keyword" name="keyword" value="" onblur="IsValid(this)">
	                <input type="text" id="keyword" name="keyword" value="" onblur="IsValid(this)">
	             </td>
	           </tr>
             <tr>
                <td>
                                                   研究类型                           
                <td>                                                 
                   <input type="radio" name="sort" value="基础研究" checked onchange="checkstudytype(this.value)">基础研究
                   <input type="radio" name="sort" value="应用研究" onchange="checkstudytype(this.value)">应用研究
                   <input type="radio" name="sort" value="试验发展" onchange="checkstudytype(this.value)">试验发展<br>                 
                   <input type="radio" name="sort" value="研究发展与成果应用" onchange="checkstudytype(this.value)">研究发展与成果应用
                   <input type="radio" name="sort" value="技术推广与科技服务" onchange="checkstudytype(this.value)">技术推广与科技服务
                </td>	              
             </tr>		             
	           <tr id="studytype"> <!--  style="display: none;" -->           
	               <td colspan="2">   
	                                                      学科分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       
	                 <select name="sel" id="selA" onchange="buildSelect(this.value,'selB')">	
	                      <option value="" selected>---请选择---</option>                                          
	                 </select>
	                 <select style="display: none;" name="sel" id="selB" onchange="buildSelect(this.value,'selC')">
	                      <option value="" selected>---请选择---</option>                        
	                 </select>
	                 <select style="display: none;" name="sel" id="selC">
	                      <option value="" selected>---请选择---</option>                        
	                 </select>
	               </td>
	            </tr>		  		          
	            <tr style="display: none;" id="techfield">
	                <td> 需求技术所属领域      
	                <td>                                        
	                  <input id="techfield" name="techfield" type="checkbox" value="电子信息技术">电子信息技术  
	                  <input id="techfield" name="techfield" type="checkbox" value="光机电一体化">光机电一体化 	               
	                  <input id="techfield" name="techfield" type="checkbox" value="新材料及应用技术" >新材料及应用技术<br>
	                  <input id="techfield" name="techfield" type="checkbox" value="新能源与高效节能技术">新能源与高效节能技术
	                  <input id="techfield" name="techfield" type="checkbox" value="资源与环境保护新技术">资源与环境保护新技术<br>
	                  <input id="techfield" name="techfield" type="checkbox" value="现代农业技术">现代农业技术
	                  <input id="techfield" name="techfield" type="checkbox" value="软件" >软件 
	                  <input id="techfield" name="techfield" type="checkbox" value="其他" onchange="checktech(this.value);">其他
	                  <input style="display: none;" id="hid2" type="text">                            
	                </td>
	            </tr>
	            <tr style="display: none;" id="techsector">
	                <td colspan="2">需求技术应用行业 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
	                 <select name="xsel" id="selA1" onchange="buildSelect(this.value,'selB1')">
	                      <option value="" selected>---请选择---</option>                        
	                 </select>
	                 <select style="display: none;" name="xsel" id="selB1" onchange="buildSelect(this.value,'selC1')">
	                      <option value="" selected>---请选择---</option>                        
	                 </select>
	                 <select style="display: none;" name="xsel" id="selC1">
	                      <option value="" selected>---请选择---</option>                        
	                 </select>              
	            </tr> 	                                	             
	            <tr>
	                <td>
		                                              技术需求合作模式  
		            <td>		                                            
		               <input type="radio" name="need" value="独立开发" checked>独立开发
		               <input type="radio" name="need" value="技术转让">技术转让		                                                               
		               <input type="radio" name="need" value="技术入股">技术入股
		               <input type="radio" name="need" value="合作开发">合作开发           
		            </td>
	            </tr>           	             
	            <tr>
	               <td>项目资金需求及来源
	               <td>
	                   计划总投资<input type="text" name="invest" id="total">万元&nbsp;&nbsp;&nbsp;&nbsp;
	                   企业自筹<input type="text" name="invest" id="zichou" onkeyup="clearNoNum(this)">万元<br>
	       &nbsp;&nbsp;银行贷款<input type="text" name="invest" id="bank" onkeyup="clearNoNum(this)">万元&nbsp;&nbsp;&nbsp;&nbsp;
	                   其他融资<input name="invest" type="text" id="other" onkeyup="clearNoNum(this)">万元                 
	               </td>	                
	            </tr>
          </table>		        		       
            <input id="sub" type="submit" value="通过">
            <input id="res" type="button" value="不通过">
            <input style="display: none;" type="hidden" name="method" value="review">	         
	    </form>  
      </div> 
      <c:if test="${param.sta.equals('1')}">
			<div class="alert alert-danger" role="alert">填报成功</div>
			<script type="text/javascript">alert("填报成功")</script>
	  </c:if>
	  <c:if test="${param.sta.equals('2')}">
			<div class="alert alert-danger" role="alert">填报失败</div>
			<script type="text/javascript">alert("填报失败")</script>
	  </c:if>
      <script
		src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
		type="text/javascript">
	  </script>  
  </body>
</html>
