<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.UserBean,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
      <c:if test="${param.sta.equals('1')}">
			<div class="alert alert-danger" role="alert">填报成功</div>
	  </c:if>
	  <c:if test="${param.sta.equals('2')}">
			<div class="alert alert-danger" role="alert">填报失败</div>
	  </c:if>
	  <c:if test="${param.status.equals('1')}">
			<div class="alert alert-danger" role="alert">该需求已通过</div>
	  </c:if>
	  <c:if test="${param.status.equals('2')}">
			<div class="alert alert-danger" role="alert">该需求已驳回</div>
	  </c:if>
	  <c:if test="${param.status.equals('3')}">
			<div class="alert alert-danger" role="alert">审核失败</div>
	  </c:if>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/myValidate.js"></script>
     <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css"/>
     <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/yanzheng.js"></script>

     <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/click.js"></script>
     <style type="text/css">
        .invalid:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color: red;
            opacity: 1;
        }
        .invalid::-moz-placeholder { /* Mozilla Firefox 19+ */
            color: red;
            opacity: 1;
        }
        input.invalid:-ms-input-placeholder{
            color: red;
        }
        input.invalid::-webkit-input-placeholder {
            color: red;
        }
		textarea.tvalid::-webkit-input-placeholder {
		    color: #f00;
		}
     </style>
  </head>
  <script type="text/javascript">
	     $(function()
         {
	           $("input:not(:radio,:submit,:checkbox,:button,#hid1,#hid2,#hid3,#teamunit,#start,#end,[name='keyword'])").css({border:"none",width:"100%",height:"100%"});
	           $("td:not([name='5'])").css({"vertical-align":"middle","text-align":"center"});
	           if(${!empty model})
	           {	          		               
                   var qsdate =  new Date('${qsdate}');
                   var jzdate = new Date('${jzdate}');
                   var setqsDate = qsdate.getFullYear()+"-"+("0"+(qsdate.getMonth()+1)).slice(-2)+"-"+("0"+qsdate.getDate()).slice(-2);
                   var setjzDate = jzdate.getFullYear()+"-"+("0"+(jzdate.getMonth()+1)).slice(-2)+"-"+("0"+jzdate.getDate()).slice(-2);                              
                   if('${advise}'!="")
                   {
                      $("#advise").val('${advise}');
                      $("#advisetr").show();
                   }                  
                   $("#start").val(setqsDate);
                   $("#end").val(setjzDate);
                   var keyword = '${keyword}';
                   var key = keyword.split('|');
                   $("input[name='keyword']").each(function(i){//一个=号和if语句里判断不一样，妈的
                         $(this).val(key[i]);
                   });
	               $('#unitname').val('${unitname}');
                   $('#mgsector').val('${mgsector}');
                   $('#teamunit').val('${teamunit}');
	               $('#website').val('${website}');
	               $('#email').val('${mailbox}');
	               $('#fax').val('${fax}');
	               $('#demandname').val('${demandname}');
	               $('#unitbrief').val('${unitbrief }');
	               $('#contactperson').val('${model.contactperson}');
	               $('#legalperson').val('${model.legalperson}');
	               $('#postcode').val('${model.postcode}');
	               $('#address').val('${model.address}');
	               $('#mobile').val('${model.mobile}');
	               $('#telephone').val('${model.telephone}');
	               $('#demand').val('${model.demandbrief}');
	               $('#unitbrief').val('${model.unitbrief}');
	               $(":radio[name='sort'][value='" + '${model.studytype}' + "']").prop("checked", "checked");
	               //
		           $(":text[name='invest']").val('${model.invest}');
	               //
                    if($(":radio[name='mode'][value='" + '${model.mode}' + "']").length==0&&'${model.mode}'!=null&&'${model.mode}'!="")
                   {
                      $(":radio[name='mode'][value='其他']").prop("checked", "checked");
                      $("#hid3").css("visibility","visible");
                      $('#hid3').val('${model.mode}');
                   }
                   else
                   {
                      $(":radio[name='mode'][value='" + '${model.mode}' + "']").prop("checked", "checked");
                   }
                   //

                   if($(":radio[name='unittype'][value='" + '${model.unittype}' + "']").length==0&&'${model.unittype}'!=null&&'${model.unittype}'!="")
		           {
		              $(":radio[name='unittype'][value='其他']").prop("checked", "checked");
                  $("#hid1").css("visibility","visible");
		              $('#hid1').val('${model.unittype}');
		           }
		           else
		           {
		              $(":radio[name='unittype'][value='" + '${model.unittype}' + "']").prop("checked", "checked");
		           }
		           //
		           if('${model.studytype}'=='基础研究')
		           {
		                var subjects = '${model.subjecttype}'.split('|');
	                    var target = ["selA","selB","selC"];
	                    initS(target,subjects);//function命名一定要注意，切记！！！
		           }
		           else
		           {
		               var techfield = '${model.techfield}'.split('|');
		               var techsector = '${model.techsector}'.split('|');
                       var target = ["selA1","selB1","selC1"];
		               for(var i=0;i<techfield.length;i++)
		               {
		                   if($(":checkbox[value='"+techfield[i]+"']").length==0)
		                   {
		                      $("input:checkbox[value='其他']").attr('checked','true');
		                      $("#hid2").css("visibility","visible").val(techfield[i]);;
		                   }
		                   $("input:checkbox[value='"+techfield[i]+"']").attr('checked','true');
		               }
                       initS(target,techsector);
		               $("#studytype").hide();
		               $("#techfield").show();
		               $("#techsector").show();
		           }
		           if(${!empty adminBean})
	               {
	                   //$("*").attr("disabled","true");
	                   $("*:not(input:submit,input:hidden[name='method'],input:hidden[name='id'])").attr("disabled","disabled");
	               }
	           }
	           else
	           {
	                getV("selA","0");
	                $('#unitname').val('${sessionScope.userBean.company}');
	                $('#address').val('${sessionScope.userBean.address}');
                    var now = new Date();
                    var year = now.getFullYear();
                    var month = ("0" + (now.getMonth() + 1)).slice(-2);
                    var  day = ("0" + now.getDate()).slice(-2);
                    var value = year+"-"+month+"-"+day;
                    $("#end").attr("max",value);
                    $("#start").attr("max",value);
                    $("#start").change(function(){
                        $("#end").attr("min",this.value);
                    });
                    $("#end").change(function(){
                        $("#start").attr("max",this.value);
                    });
            	    }
            $("input,textarea").change(function(){
                  $(this).val($.trim($(this).val()))
            });
	     });
	     function enter()
	     {
	           if(event.keyCode==13&&$("#sub").is(":focus")==false)
	           {
	               return false;
	           }
	           else if(event.keyCode==13&&$("#sub").is(":focus")==true)
	           {
	               return true;
	           }
	     }
  </script>
  <script type="text/javascript">
    $(function(){
        getAddress("#city","#country",'${field}');
     });
  </script>
  <body>
     <div style="text-align:center;">
          <h2>河北省重大技术需求征集表</h2>
     </div>
     <div style="text-align:center;">
         <form action="demand-save" id="checkForm" method="post" target="mainAction" onkeydown="return enter()">
            <table align="center"  border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                 <tr>
                     <td><font size="5" color="red">*</font>机构全称</td>
                     <td><input id="unitname" name="unitname" type="text" onblur="IsValid(this);"></td>
                     <td>归口管理部门 </td>
                     <td><input id="mgsector" name="mgsector" type="text" ></td>
                 </tr>
                 <tr>
                     <td><font size="5" color="red">*</font>通讯地址</td>
                     <td><input id="address" name="address" type="text" value="" onblur="IsValid(this)"></td>
                     <td><font size="5" color="red">*</font>所在地域</td>
                     <td>
                          <select style="height:100%;width:50%; float:left;" class="form-control" name="field" id="city">
                            <option value="">请选择城市</option>
                          </select>
                          <select style="height:100%;width:50%; float:center;" class="form-control" name="field" id="country">
                          <option value="">请选择县份</option>
                          </select>
                     </td>
                 </tr>
                 <tr>
                     <td>网址</td>
                     <td>
                        <input id="website" name="website" type="url" autofocus="autofocus" onblur="checkUrl(this)">
                     </td>
                     <td><font size="5" color="red">*</font>电子信箱</td>
                     <td><input type="email" id="email" name="mailbox" onblur="checkemail(this);" required></td>
                 </tr>
                 <tr>
                     <td><font size="5" color="red">*</font>法人代表</td>
                     <td><input type="text" id="legalperson" name="legalperson" onblur="checkName(this)"></td>
                     <td>邮政编码</td>
                     <td><input type="text" id="postcode" name="postcode" onblur="checkpostcode(this.value,this.id)"></td>
                 </tr>
                 <tr>
                     <td><font size="5" color="red">*</font>联系人</td>
                     <td>
                         <input type="text" id="contactperson" name="contactperson" onblur="checkName(this)">
                     </td>
                     <td>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse;border-style: hidden;">
                            <tr>
                               <td><font style="line-height: 20px;" size="4" color="red">*</font>电话</td>
                            </tr>
                            <tr>
                               <td>传真</td>
                            </tr>
                        </table>
                     </td>
                     <td>
                         <table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse;border-width: 0px;border-style: hidden;">
                             <tr>
                                 <td>
                                      <table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse;border-width: 0px;border-style: hidden;">
                                        <tr>
                                           <td>
                                              <input id="telephone" name="telephone" onblur="checktelephone(this.value,this.id)" type="text" placeholder="固定电话(可不填)">
                                           </td>
                                           <td>
                                               <input id="mobile" name="mobile" onblur="checkPhone(this)" type="text" placeholder="移动电话(必填)" required>
                                           </td>
                                        </tr>
                                       </table>
                                 </td>
                             </tr>
                             <tr>
                                 <td><input type="text" id="fax" name="fax" onblur="checkfax(this)"></td>
                             </tr>
                         </table>
                     </td>
                 </tr>
                 <tr>
                     <td><font size="5" color="red">*</font>机构属性</td>
                     <td colspan="3" name="5">
	                      <input id="unit1" name="unittype" type="radio" value="企业" checked>
	                      <label for="unit1">企业</label>
	                      <input id="unit2" name="unittype" type="radio" value="高等院校">
	                      <label for="unit2">高等院校 </label>
	                      <input id="unit3" name="unittype" type="radio" value="研究机构">
	                      <label for="unit3">研究机构</label>
	                      <input id="unit4" name="unittype" type="radio" value="其他">
	                      <label for="unit4">其他 </label>
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input size="20" style="visibility: hidden;height: 30px" id="hid1" name="unittype" type="text">
                          <font style="display: none;" size='3' color='red'>请选择机构属性！</font>
                     </td>
                 </tr>
                 <tr>
	                 <td><font size="5" color="red">*</font>机构简介</td>
	                 <td colspan="3">
	                  <textarea style="border: none;width: 100%;height: 100%" id="unitbrief" name="unitbrief" onblur="IsValid(this);"
	                  onpropertychange="checkLength(this,500);" oninput="checkLength(this,500);" rows="6" cols="50" placeholder="(单位基本情况，研究基础等，限500字)"></textarea>
		             </td>
                 </tr>
                 <tr>
	                  <td><font size="5" color="red">*</font>技术需求名称</td>
	                  <td><input type="text" id="demandname" name="demandname" onblur="IsValid(this)"></td>
                      <td><font size="5" color="red">*</font><span id="date">需求时限</span></td>
                      <td>
	                      <input type="date" name="qsdate" id="start">&nbsp;&nbsp;&nbsp;&nbsp;
	                      年&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="jzdate" id="end">
                      </td>
                 </tr>
                 <tr>
	                 <td><font size="5" color="red">*</font>重大技术需求概述</td>
	                 <td colspan="3">
	                   <textarea style="border:none;width: 100%;height: 100%" id="demand" name="demandbrief" onblur="IsValid(this)" onpropertychange="checkLength(this,500);"
	                        oninput="checkLength(this,500);" rows="4" cols="50" placeholder="(主要内容，技术指标，预期经济和社会效益等，限500字)"></textarea>
		             </td>
	             </tr>
	              <tr>
		             <td>
		                 <font size="5" color="red">*</font>关键字（查询使用）
		             </td>
		             <td colspan="3" name="5">
		                <input style="height: 30px;" size="19" type="text" id="keyword1" name="keyword" placeholder="关键字1(至少填一个)" onblur="IsValid(this)">
		                <input style="height: 30px;" size="19" type="text" id="keyword2" name="keyword" placeholder="关键字2" onblur="IsValid(this)">
		                <input style="height: 30px;" size="18" type="text" id="keyword3" name="keyword" placeholder="关键字3" onblur="IsValid(this)">
		                <input style="height: 30px;" size="18" type="text" id="keyword4" name="keyword" placeholder="关键字4" onblur="IsValid(this)">
		                <input style="height: 30px;" size="19" type="text" id="keyword5" name="keyword" placeholder="关键字5" onblur="IsValid(this)">
		             </td>
	             </tr>
	             <tr>
	                 <td>拟投入资金总额</td>
	                 <td colspan="2"><input type="text" name="invest" id="total"></td>
	                 <td name="5">万元</td>
	             </tr>
	             <tr>
	                  <td><font size="5" color="red">*</font>技术需求解决方式</td>
	                  <td colspan="2">
	                  <input id="need1" type="radio" name="mode" value="独立开发" checked>
	                  <label for="need1">独立研发</label>
		                <input id="need2" type="radio" name="mode" value="委托研发">
		                <label for="need2">委托研发</label>
		                <input id="need3" type="radio" name="mode" value="合作研发">
		                <label for="need3">合作研发</label>
		                <input id="need4" type="radio" name="mode" value="其他">
		                <label for="need4">其他</label>
		                <input id="hid3" type="text" style="visibility: hidden;height: 30px" name="mode">
	                  </td>
	                  <td>合作意向单位（选填）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input size="19" style="height: 30px"  type="text" name="teamunit" id="teamunit">
	                  </td>
	             </tr>
	             <tr>
	                 <td><font size="5" color="red">*</font>科技活动类型</td>
	                 <td colspan="3" name="5">
	                   <input id="sort1" type="radio" name="studytype" value="基础研究" checked>
	                   <label for="sort1">基础研究</label>
	                   <input id="sort2" type="radio" name="studytype" value="应用研究">
	                   <label for="sort2">应用研究</label>
	                   <input id="sort3" type="radio" name="studytype" value="试验发展">
	                   <label for="sort3">试验发展</label>
	                   <input id="sort4" type="radio" name="studytype" value="研究发展与成果应用">
	                   <label for="sort4">研究发展与成果应用</label>
	                   <input id="sort5" type="radio" name="studytype" value="技术推广与科技服务">
	                   <label for="sort5">技术推广与科技服务</label>
	                   <input id="sort6" type="radio" name="studytype" value="生产性活动">
	                   <label for="sort6">生产性活动</label>
	                 </td>
	             </tr>
	             <tr id="studytype"> <!--  style="display: none;" -->
		               <td><font size="5" color="red">*</font>学科分类</td>
		               <td colspan="3" name="5">
		                 <select class="form-control" style="width:120px;height:100%; float:left;margin-right: 0px;" name="subjecttype" id="selA">
		                      <option value="" selected>---请选择---</option>
		                 </select>
		                 <select class="form-control" style="width:120px;display: none;height:100%; float:left;margin-right: 0px;" name="subjecttype" id="selB">
		                      <option value="" selected>---请选择---</option>
		                 </select>
		                 <select class="form-control" style="width:120px;display: none;height:100%; float:left;" name="subjecttype" id="selC">
		                      <option value="" selected>---请选择---</option>
		                 </select>
                         <font name="alt" style="display: none;" size='3' color='red'>请选择学科分类！</font>
		               </td>
	             </tr>
	             <tr style="display: none;" id="techfield">
	                <td><font size="5" color="red">*</font>需求技术所属领域 </td>
	                <td colspan="3" name="5">
	                  <input id="techfield5" name="techfield" type="checkbox" value="新能源与高效节能技术"><label for="techfield5">新能源与高效节能技术</label>
                      <input id="techfield8" name="techfield" type="checkbox" value="软件" ><label for="techfield8">软件 </label>
                      <input id="techfield2" name="techfield" type="checkbox" value="电子信息技术"><label for="techfield2">电子信息技术</label>
	                  <input id="techfield6" name="techfield" type="checkbox" value="资源与环境保护新技术"><label for="techfield6">资源与环境保护新技术</label>
                      <input id="techfield3" name="techfield" type="checkbox" value="光机电一体化"><label for="techfield3">光机电一体化</label><br>
                      <input id="techfield7" name="techfield" type="checkbox" value="现代农业技术"><label for="techfield7">现代农业技术</label>
                      <input id="techfield4" name="techfield" type="checkbox" value="新材料及应用技术" ><label for="techfield4">新材料及应用技术</label>
	                  <input id="techfield1" name="techfield" type="checkbox" value="其他" onchange="checktech(this.value);"><label for="techfield1">其他</label>
	                  <input style="visibility: hidden;height: 30px;" id="hid2" name="techfield" type="text">
                      <font style="display: none;" size='3' color='red'>请选择需求技术所属领域！</font>
	                </td>
	             </tr>
	             <tr style="display: none;" id="techsector">
	                <td><font size="5" color="red">*</font>需求技术应用行业 </td>
	                <td colspan="3" name="5">
		                 <select class="form-control" style="width:120px;height:100%;float:left;margin-right: 0px;" name="xsel" id="selA1">
		                      <option value="" selected>---请选择---</option>
		                 </select>
		                 <select class="form-control" style="width:120px;display: none;height:100%;float:left;margin-right: 0px;" name="xsel" id="selB1">
		                      <option value="" selected>---请选择---</option>
		                 </select>
		                 <select class="form-control" style="width:120px;display: none;height:100%;float:left;margin-right: 0px;" name="xsel" id="selC1">
		                      <option value="" selected>---请选择---</option>
		                 </select>
                         <font name="alt" style="display: none;" size='3' color='red'>请选择需求技术应用行业！</font>
	                </td>
	            </tr>
              <tr id="advisetr" style="display: none;">
                <td>审核意见</td>
                <td colspan="3">
                   <textarea id="advise" name="advise" style="border:none;width: 100%;height: 100%" rows="4" cols="50" disabled></textarea>
                </td>
              </tr>
            </table>
            <c:choose>
               <c:when test="${empty adminBean }">
                  <input class="btn btn-info" id="sub" type="submit" value="保存并提交">
		              <input class="btn btn-info" id="res" type="button" value="重置" onclick="Reset();">
                  <c:if test="${!empty demandBean}">
                    <input class="btn btn-info" id="back" type="button" onclick="window.history.back(-1);" value="返回">
                  </c:if>
		              <input style="display: none;" type="hidden" name="method" value="add">
               </c:when>
               <c:otherwise>
                    <input class="btn btn-info" id="yes" name="sub" type="submit" value="通过">
		            <input class="btn btn-info" id="no" name="sub" type="submit" value="不通过">
		            <input style="display: none;" type="hidden" name="method" value="review">
		            <input style="display: none;" type="hidden" name="id" value="${demandBean.id }">
               </c:otherwise>
            </c:choose>
	    </form>
      </div>
  </body>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jilian.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/address.js"></script>
</html>
