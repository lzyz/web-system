<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<!DOCTYPE html >
<html>
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
<title>需求清单</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.twbsPagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js" ></script>
<link   rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/demo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/fonts/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/menu_sideslide.css" /> --%>
<link href="jquery.treemenu.css" rel="stylesheet" type="text/css">
<style type="text/css">
/*#suggest{
   padding:0;
   width:100px;
   margin:0;
   border: 1px solid black;
   font-size:14px;
}*/
/*提示信息鼠标覆盖是信息*/
div.over{
   padding:0;
   margin:0;
   border: 1px solid #999;
   background: #FFFFCC;
   cursor: hand;
}
/*提示信息鼠标移出时信息*/
div.out{
   padding:0;
   margin:0;
   border: 1px solid #FFFFFF;
   background: #FFFFFF;
}
div{margin:0px;border:0px;padding:0px;}
.tree {  color:#46CFB0;width:800px; auto;}
.tree li,
.tree li > a,
.tree li > span {
    padding: 5pt;
    border-radius: 4px;

}
.tree li > span:hover {
    background-color: #34BC9D;
    color: #fff;
    cursor: pointer;
}
.tree li a {
    color:#46CFB0;
    text-decoration: none;
    /*line-height: 20pt;*/
    border-radius: 4px;
}
.tree li a:hover {
    background-color: #34BC9D;
    color: #fff;
}
</style>
</head>
<script type="text/javascript">
         $(function(){
                readInfo();
                $("#sta").val('${param.status}');
                $("#info").val('${param.info}');
                var now = new Date();
			          var year = now.getFullYear();
        				var month = ("0" + (now.getMonth() + 1)).slice(-2);
        				var day = ("0" + now.getDate()).slice(-2);
        				var value = year+"-"+month+"-"+day;
        				$("#start").val('${param.start}');
        				$("#end").val('${param.end}'==''?value:'${param.end}');
        				$("#end").attr("max",value);
        				$("#start").attr("max",value);
                $("#start").change(function(){
                    $("#end").attr("min",this.value);
                });
                $("#end").change(function(){
                    $("#start").attr("max",this.value);
                });
				function checkpage()
				{
					var num = document.getElementById("page").value;
				}
		   });
</script>
<script type="text/javascript">
            var first = new Array();
            var second = new Array();
            var third = new Array();
            var fourth = new Array();
            var fifth = new Array();
            var temp = new Array();
            var tfirst = new Array();
            var tsecond = new Array();
            var tdate = new Array();
            var status;
            var nextPage;//下一页
            var pageSize;//每页显示几条数据
            var totalX;//总页数
            var curPage = 1;//当前页
            var totalRows;//记录总条数
            var num = 0;//name
            var idnum = 0;//id
            var did = 0;//模态框的id
            $(function()
            {
                totalX = '${totalPages}';
                initFenye();
                $("#pageid").click(function(){
                    nextPage = $("#page").val();
                    if(nextPage<1||nextPage==curPage)
                    {
                        return false;
                    }
                    else if(nextPage>totalX)
                    {
                        nextPage = totalX;
                        getData(nextPage);
                    }
                    else
                    {
                        curPage = nextPage;
                        getData(nextPage,0);
                    }
                });
                $("#pageSizeid").click(function(){
                    pageSize = $("#pageSize").val();
                    if(pageSize>totalRows)
                    {
                        pageSize = totalRows;
                    }
                    curPage = 1;
                    getData("",0);
                });
                $("#add1").click(function(event)
                {
                   //单独条件就是把它之前的所有条件加一个大括号
                   if($("#control > div").length==14)
                   {
                       return false;
                   }
                   else
                   {
                      $("<div>"
                      +"<select name='cff'>"
                      +"<option value='prev'>接上一条件</option>"
                      +"<option value='whole'>单独条件</option></select><span>:&nbsp;</span>"
	                  +"<select name='cf'>"
	                  +"<option value='and'>并且</option>"
	                  +"<option value='not'>不含</option>"
	                  +"<option value='or'>或者</option></select>->&nbsp;"
	                  +"<select name='cs' onchange='cs(this)'>"
	                  +"<option value='unitname'>机构全称</option>"
	                  +"<option value='mgsector'>归口管理单位</option>"
	                  +"<option value='field'>所在地域</option>"
	                  +"<option value='legalperson'>法人代表</option>"
	                  +"<option value='contactperson'>联系人</option>"
	                  +"<option value='unittype'>机构属性</option>"
	                  +"<option value='demandname'>技术需求名称</option>"
	                  +"<option value='keyword'>关键字</option>"
	                  +"<option value='invest'>拟投入资金总额</option>"
	                  +"<option value='mode'>技术需求解决方式</option>"
	                  +"<option value='studytype'>科技活动类型</option>"
	                  +"<option value='subjecttype'>学科分类</option>"
	                  +"<option value='techfield'>需求技术所属领域</option>"
	                  +"<option value='techsector'>需求技术应用行业</option></select>:&nbsp;"
	                  +"<select name='ct' onchange='ct(this)'>"
	                  +"<option value='exact'>精确查询</option>"
	                  +"<option value='fuzzy'>模糊查询</option></select>"
                      +"<span>:&nbsp;</span><input id='cv' name='cv' type='text'>"
	                  +"<button id='moveout' type='button' onclick='$(this).parent().remove();' class='btn btn-link'>移除</button></div>"
	                  ).insertBefore('#add1');
	                  if($("#control > div").length==1)
	                  {
	                      $("#control > div > select:first").css("visibility", "hidden");
	                      $("#control > div > span:first").css("visibility", "hidden");
	                  }
                      /*$("#control > div:last").find("button").click(function(){

                      });*/
                   }
                });
                $("#add2").click(function(event)
                {
                    if($("#time > div").length==2)
                    {
                         return false;
                    }
                    else
                    {
                       $("<div>"
                       +"<select name='tf'>"
                       +"<option value='and'>并含</option>"
                       +"<option value='not'>不含</option>"
                       +"<option value='or'>或含</option></select>->&nbsp;"
                       +"<select name='ts'>"
                       +"<option value='submit'>填报日期</option>"
                       +"<option value='validarea'>需求时限</option></select>:&nbsp;"
                       +"从<input type='date' name='start' id='start'>"
                       +"到<input type='date' name='end' id='end'>"
                       +"<button id='moveout' type='button' onclick='$(this).parent().remove();' class='btn btn-link'>移除</button></div>"
                       ).insertBefore('#add2');
                    }
                });
                $("#query").click(function()
                {
                    first = new Array();
                    second = new Array();
                    third = new Array();
                    fourth = new Array();
                    fifth = new Array();
                    temp = new Array();
                    tfirst = new Array();
                    tsecond = new Array();
                    tdate = new Array();
                    $("select[name='tf']").each(function(i){
                        tfirst[i] = this.value;
                    });
                    $("select[name='ts']").each(function(i){
                        tsecond[i] = this.value;
                         $(this).nextAll("input").each(function(j){//为什么选择器中加上:date就无效呢
                            temp[j] = this.value;
                        });
                        tdate[i] = temp.join('|');
                        temp = new Array();
                    });
                    $("select[name='cf']").each(function(i){
                        //alert(i+" "+this.value);
                        //first[i] = this.value;
                        //alert(first.length);length后不加括号！！
                        first.push(this.value);
                    });
                    $("select[name='cs']").each(function(i){
                        second[i] = this.value;
                    });
                    $("select[name='ct']").each(function(i){
                        third[i] = this.value;

                        if($(this).nextAll("input:checkbox").length>0)
                        {
                            var tflag = 1;
                            $(this).nextAll("input:checked").each(function(j){
                                if(this.value=="其他")
                                {
                                  if($(this).nextAll("input:text").val()=="")
                                  {
                                    alert("请填写完整查询条件或删除多余条件");
                                    tflag = 2;
                                    return false;
                                  }
                                  else
                                  {
                                    temp[j] = $(this).nextAll("input:text").val();//为什么一定要用nextAll
                                  }
                                }
                                else if(this.value!="")
                                {
                                  alert("不为空")
                                    temp[j] = this.value;
                                }
                                else
                                {
                                  alert("为空")
                                   alert("请填写完整查询条件或删除多余条件");
                                   tflag = 2;
                                   return false;
                                }
                            });
                            if(tflag==2)
                            {
                              return false;
                            }
                            else
                            {
                              fourth[i] = temp.join('|');
                            }
                        }
                        else if($(this).nextAll("input:radio").length>0)
                        {
                          var tflag = 1;
                          fourth[i] = $(this).nextAll("input:radio:checked").val();
                          if(fourth[i]=="其他")
                          {
                            if($(this).nextAll("input:text").val()=="")
                            {
                              alert("请填写完整查询条件或删除多余条件");
                              tflag = 2;
                              return false;
                            }
                            else
                            {
                              fourth[i] = $(this).nextAll("input:text").val();//为什么一定要用nextAll
                            }
                          }
                          if(tflag==2)
                          {
                            alert("ll")
                            return false;
                          }
                        }
                        else if($(this).nextAll("select").length>0)
                        {
                          var tflag = 1;
                          $(this).nextAll("select").each(function(j){
                            if(this.value=="")
                            {
                              alert("请填写完整查询条件或删除多余条件");
                              tflag = 2;
                              return false;
                            }
                            else
                            {
                              temp[j] = this.value;
                            }
                          });
                          if(tflag==2)
                          {
                            return false;
                          }
                          else
                          {
                            fourth[i] = temp.join('|');
                            temp = new Array();//尚待研究
                          }
                        }
                        else
                        {
                          if($(this).nextAll("input:text").val()=="")
                          {
                            alert("请填写完整查询条件或删除多余条件");
                            return false;
                          }
                          else
                          {
                            fourth[i] = $(this).nextAll("input:text").val();//为什么一定要用nextAll
                          }
                        }
                    });
                    $("select[name='cff']").each(function(i){
                        fifth[i] = (this.value);
                    });
                    getData("",0);
                });
            });

            function ct(t)
            {
                if(t.value=="fuzzy")
                {
                   $(t).next().nextUntil('button').remove();
                   $(t).next().after("<input id='cv' name='cv' type='text'>");
                }
                else
                {
                    showv($(t).prev()[0]);
                }
            }
            function showv(t)
            {
                if(t.value=="unittype")
                {
                    $(t).next().next('span').nextUntil('button').remove();
                    $(t).next().next('span').after(
                           "<input id='unit"+(idnum)+"' name='unit"+(num)+"' type='radio' value='企业' checked>"
                          +"<label for='unit"+(idnum++)+"'>企业</label>"
                          +"<input id='unit"+(idnum)+"' name='unit"+(num)+"' type='radio' value='高等院校''>"
                          +"<label for='unit"+(idnum++)+"'>高等院校 </label>"
                          +"<input id='unit"+(idnum)+"' name='unit"+(num)+"' type='radio' value='研究机构'>"
                          +"<label for='unit"+(idnum++)+"'>研究机构</label>"
                          +"<input id='unit"+(idnum)+"' name='unit"+(num)+"' type='radio' value='其他'>"
                          +"<label for='unit"+(idnum++)+"'>其他</label>"
                          +"<input size='20' style='display: none;height: 100%' id='hid1' name='unit"+(num++)+"' type='text'>");
                    hid(t);
                }
                else if(t.value=="mode")
                {
                    $(t).next().next('span').nextUntil('button').remove();
                    $(t).next().next('span').after("<input id='need1' type='radio' name='need' value='独立开发' checked>"
                        +"<label for='need1'>独立研发</label>"
                        +"<input id='need2' type='radio' name='need' value='委托研发'>"
                        +"<label for='need2'>委托研发</label>"
                        +"<input id='need3' type='radio' name='need' value='合作研发'>"
                        +"<label for='need3'>合作研发</label>"
                        +"<input id='need4' type='radio' name='need' value='其他'>"
                        +"<label for='need4'>其他</label>"
                        +"<input id='hid3' type='text' name='need' style='display: none;height: 100%'>");
                    // $(":radio[name='cv']").each(function(){也可以
                    hid(t);
                }
                else if(t.value=="studytype")
                {
                    $(t).next().next('span').nextUntil('button').remove();
                    $(t).next().next('span').after("<br><input id='sort1' type='radio' name='sort' value='基础研究' checked>"
                        +"<label for='sort1'>基础研究</label>"
                        +"<input id='sort2' type='radio' name='sort' value='应用研究'>"
                        +"<label for='sort2'>应用研究</label>"
                        +"<input id='sort3' type='radio' name='sort' value='试验发展'>"
                        +"<label for='sort3'>试验发展</label>"
                        +"<input id='sort4' type='radio' name='sort' value='研究发展与成果应用'>"
                        +"<label for='sort4'>研究发展与成果应用</label>"
                        +"<input id='sort5' type='radio' name='sort' value='技术推广与科技服务'>"
                        +"<label for='sort5'>技术推广与科技服务</label>"
                        +"<input id='sort6' type='radio' name='sort' value='生产性活动'>"
                        +"<label for='sort6'>生产性活动</label>");
                }
                else if(t.value=="subjecttype")
                {
                    $(t).nextAll('span').nextUntil('button').remove();
                    $(t).nextAll('span').after(
                         "<select name='sel"+num+"' id='selA"+num+"' onchange='alert('2')'><option value=''>请选择</option></select>"
                        +"<select name='sel"+num+"' id='selB"+num+"'><option value=''>请选择</option></select>"
                        +"<select name='sel"+num+"' id='selC"+num+"'><option value=''>请选择</option></select>");
                    getV("selA"+num,"0");
                    $("#selA"+num).change(function()
                    {
                        getV($(this).next().attr("id"),$(this).val());
                    });
                    $("#selB"+num).change(function()
                    {
                        getV($(this).next().attr("id"),$(this).val());
                    });
                    num++;
                }
                else if(t.value=="techfield")
                {
                    $(t).next().next('span').nextUntil('button').remove();
                    $(t).next().next('span').after(
                      "<br><input id='techfield2' name='techfield' type='checkbox' value='电子信息技术'>"
                     +"<label for='techfield2'>电子信息技术</label>"
                     +"<input id='techfield3' name='techfield' type='checkbox' value='光机电一体化'>"
                     +"<label for='techfield3'>光机电一体化</label>"
                     +"<input id='techfield4' name='techfield' type='checkbox' value='新材料及应用技术' >"
                     +"<label for='techfield4'>新材料及应用技术</label>"
                     +"<input id='techfield5' name='techfield' type='checkbox' value='新能源与高效节能技术'>"
                     +"<label for='techfield5'>新能源与高效节能技术</label>"
                     +"<input id='techfield6' name='techfield' type='checkbox' value='资源与环境保护新技术'>"
                     +"<label for='techfield6'>资源与环境保护新技术</label><br>"
                     +"<input id='techfield7' name='techfield' type='checkbox' value='现代农业技术'>"
                     +"<label for='techfield7'>现代农业技术</label>"
                     +"<input id='techfield8' name='techfield' type='checkbox' value='软件' >"
                     +"<label for='techfield8'>软件 </label>"
                     +"<input id='techfield1' name='techfield' type='checkbox' value='其他' onchange='checktech(this);'>"
                     +"<label for='techfield1'>其他</label>"
                     +"<input style='display: none;' id='hid2' name='techfield' type='text'>");
                }
                else if(t.value=="techsector")
                {
                    $(t).nextAll('span').nextUntil('button').remove();
                    $(t).nextAll('span').after(
                        "<select name='sel' id='selA"+num+"'><option value=''>请选择</option></select>"
                       +"<select name='sel' id='selB"+num+"'><option value=''>请选择</option></select>"
                       +"<select name='sel' id='selC"+num+"'><option value=''>请选择</option></select>");
                    getV("selA"+num,"0");
                    $("#selA"+num).change(function()
                    {
                        getV($(this).next().attr("id"),$(this).val());
                    });
                    $("#selB"+num).change(function()
                    {
                        getV($(this).next().attr("id"),$(this).val());
                    });
                    num++;
                }
                else if(t.value=="field")
                {
                  $(t).nextAll('span').nextUntil('button').remove();
                  $(t).nextAll('span').after(
                      "<select name='city"+num+"' id='city"+num+"'><option value=''>请选择</option></select>"
                      +"<select name='city"+num+"' id='country"+num+"'><option value=''>请选择</option></select>");
                  getAddress("#city"+num,"#country"+num,"");
                  num++;
                }
                else
                {
                    $(t).nextAll('span').nextUntil('button').remove();
                    $(t).nextAll('span').after("<input id='cv' name='cv' type='text'>");
                }
            }
            function cs(t)//写外面
            {
                if($(t).next().val()=="exact")
                {
                   showv(t);
                }
                else
                {
                   $(t).next().next('span').nextUntil('button').remove();
                   $(t).next().next('span').after("<input id='cv' name='cv' type='text'>");
                }
            }
            function checktech(t)
            {
                 $(t).nextAll('input:last').toggle();
            }
            function hid(t)
            {
                $(t).nextAll(":radio").each(function() {
                   $(this).change(function(){
                       if(this.value=="其他")
                        {
                           $(this).nextAll('input:last').show();//nextAll可以而next()不可以
                        }
                       else
                        {
                           $(this).nextAll('input:last').hide();
                        }
                   });
               });
            }
</script>
<script>
/* $(function(){
        //$("#root").getTree("0");
        getvalue("root","0");
});
function getvalue(nextid,thisvalue)
{
       var url = "/Demand/subjectServlet?method=listSubjects1";
       var args = {"name":thisvalue,"time":new Date()};
       $.getJSON(url,args,function(data)
       {
               if(data.length==0)
               {
               }
               else
               {
                   if($("#"+nextid).find("ul").length==0)
			       {
			          $("#"+nextid).append("<ul class='treemenu'></ul>");
			          if(nextid=="root")
			          {
			               $("#"+nextid).find("ul").addClass('tree');
			          }
			       }
                   for(var i=0;i<data.length;i++)
                   {
                      var id = data[i].id;
                      var name = data[i].name;
                      $("#"+nextid).find("ul").append("<li class='tree-closed' id='"+id+"'><span class='toggler'>"+name+"</span></li>");
                      if(thisvalue.indexOf('B')>=0)
                      {
                          $("#"+nextid).find("ul > li > span").removeClass("toggler");
                          //$("#"+nextid).find("ul > li > span").remove();
                          //$("#"+nextid).find("ul > li").last().append("<a href=''>"+name+"</a>");
                      }
                   }
                   if(thisvalue!="0")
                   {
                      $("#"+nextid).find("ul").slideDown("slow");//不能用toggle
                   }
                   $("#"+nextid).find("ul > li").each(function(){
                            e = $(this);
				            var button = e.find('span').eq(0);
				            e.find(button).click(function() {
				            	var li = $(this).parent('li');
				            	if($(this).nextAll().length==0)
				                {
				                   getvalue(li.attr("id"),li.attr("id"));
				                   li.toggleClass('tree-closed');
				                   li.toggleClass('tree-opened');
				                }
				                else
				                {
				                   li.find('> ul').slideToggle(300);
				                   li.toggleClass('tree-closed');
				                   li.toggleClass('tree-opened');
				                }
				            });
                   });
               }
        });
} */
</script>
<body>
  <!-- <div class="container" style="float: left;margin-right: 0px;width: 10%">
		<div class="menu-wrap">
			<nav class="menu">
				<div class="icon-list">
					<div id="root">
                    </div>
				</div>
			</nav>
			<button class="close-button" id="close-button">Close Menu</button>
		</div>
  </div> -->
  <!-- <div id="chars">
     <div id="main">

     </div>
     <div>
       <button id="chart" type="button" class="btn btn-info"></button>
     </div>
  </div> -->
  <div>
		<!-- <div style="overflow-y: auto;height: 110px;width: 100%"> 设置滚动-->
        <div class="panel-group" id="accordion">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapse">
                        点击选择查询条件
                    </a>
                </h4>
            </div>
            <div id="collapse" class="panel-collapse collapse">
                <div class="panel-body">
				    <table border="1" class="table table-striped">
				       <tr>
				          <td colspan="2">控制条件</td>
				          <td id="control">
					           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核状态：
				              <select name="sta" id="sta">
						              <option value="" checked>全部</option>
						              <option value="未审核">未审核</option>
						              <option value="通过">通过</option>
						              <option value="不通过">不通过</option>
						       </select><br>
		                       <button id="add1" type="button" class="btn btn-link">+添加（最多14项）</button>
						   </td>
				       </tr>
				       <tr>
				           <td colspan="2">时间条件</td>
				           <td id="time">
							    <button id="add2" type="button" class="btn btn-link">+添加（最多2项）</button>
				           </td>
				       </tr>
        			    <div id="suggest" style="display:none"></div>
				    </table>
                </div>
            </div>
			  <!-- </div> -->
    		<div>
    		    <button id="query" type="button" class="btn btn-info">查询</button>
    		    <button id="chart" type="button" class="btn btn-info">查看图表</button>
    		    <button id="open-button" type="button" class="btn btn-info">分类检索</button>
    		</div>
  </div>
		<div class="row-fluid">
			<div class="col-md-20 "><!-- 可以控制列表宽度 -->
				<table id="info" class="table table-striped">
					<tr>
					  <td>编号</td>
						<td>技术需求名称</td>
						<td>填报日期</td>
						<td>审核状态</td>
						<td colspan="1">操作</td>
					</tr>
					<!-- forEach遍历出adminBeans -->
					<s:if test="demandInfos.isEmpty()">
					          目前没有填报的需求信息
					</s:if>
					<s:else>
					    <s:iterator value="demandInfos">
								<tr>
									<td>${id }</td>
									<s:if test="#session.userBean">
									   
									   <td><a href="demand-getById?id=${id }">${demandname }</a></td>
									</s:if>
									<s:else>
									   <td><button id='moveout' type='button' class='btn btn-link' data-toggle='modal' data-target='#myModal' onclick='getDemand(${id })'>${demandname }</button></td>
									</s:else>									
									<td>
										<s:date name="date" format="yyyy-MM-dd"/>
									</td>
									<td>${status }</td>
									<td>
										<a href="emp-delete?id=${id }" class="delete">Delete</a>
									</td>
								</tr>
							</s:iterator>
					</s:else>
				</table>
				<c:if test="${param.status.equals('2')}">
					<div class="alert alert-success" role="alert">修改成功</div>
				</c:if>
				<c:if test="${param.status.equals('3')}">
					<div class="alert alert-success" role="alert">删除成功</div>
				</c:if>
			</div>
		</div>
		<table align="center">
		     <tr>
		        <td><ul id="pagination-demo" class="pagination-sm"></ul></td>
            <form class="form-horizontal" role="form">
		         <td width="30%">
                    <div class="form-group">
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="pageSize" name="pageSize">
                        </div>
                         <label class="col-sm-3 control-label">条/页</label>
                        <div class="col-sm-1">
                            <button id="pageSizeid" class="btn btn-info" type="button">设置</button>
                        </div>
                    </div>
              </td>
              <td>
                    <label class="col-sm-3 control-label">转到第</label>
                    <div class="form-group">
                        <div class="col-sm-3">
                            <input id="page" class="form-control" type="text" name="page">
                        </div>
                        <label class="col-sm-1 control-label">页</label>
                        <div class="col-sm-1">
                            <button id="pageid" class="btn btn-info" type="button">
                            <span class="glyphicon glyphicon-share-alt"></span>GO
                            </button>
                        </div>
                    </div>
              </td>
		     </tr>
            </form>
		</table>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
          刚打开的需求
        </button>
        <!-- 模态框 -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h2 style="text-align:center;" class="modal-title">河北省重大技术需求征集表</h2>
                      <div class="container">
                        <table id="review" class="table table-bordered" style="width:92%;">
                        <!-- //模态框中表格的宽度要在style中设置 -->
                            <tr>
                              <td style="width:150px;"><label class="control-label">机构全称</label></td>
                              <td id="tdunitname">Doe</td>
                              <td style="width:150px;"><label class="control-label">归口管理部门</label></td>
                              <td id="tdmgsector">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">通讯地址</label></td>
                              <td id="tdaddress">Moe</td>
                              <td style="width:150px;"><label class="control-label">所在地域</label></td>
                              <td id="tdfield">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">网址</label></td>
                              <td id="tdwebsite">Dooley</td>
                              <td style="width:150px;"><label class="control-label">电子信箱</label></td>
                              <td id="tdemail">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">法人代表</label></td>
                              <td id="tdlegalperson">Dooley</td>
                              <td style="width:150px;"><label class="control-label">邮政编码</label></td>
                              <td id="tdpostcode">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">联系人</label></td>
                              <td id="tdcontactperson">Dooley</td>
                              <td style="width:150px;"><label class="control-label">电话</label></td>
                              <td id="tdphone">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">机构属性</label></td>
                              <td id="tdunittype">Dooley</td>
                              <td style="width:150px;"><label class="control-label">传真</label></td>
                              <td id="tdfax">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">机构简介</label></td>
                              <td colspan="3" id="tdunitbrief"></td>
                            </tr>
                              <td style="width:150px;"><label class="control-label">技术需求名称</label></td>
                              <td id="tddemandname">Dooley</td>
                              <td style="width:150px;"><label class="control-label">需求时限</label></td>
                              <td id="tddemandtime">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">重大技术需求概述</label></td>
                              <td colspan="3" id="tddemandbrief"></td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">关键字</label></td>
                              <td colspan="3" id="tdkeys">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">拟投入资金总额</label></td>
                              <td id="tdtotal">Dooley</td>
                              <td style="width:150px;"><label class="control-label">合作意向单位</label></td>
                              <td id="tdteamunit">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">技术需求解决方式</label></td>
                              <td id="tdmode">Dooley</td>
                              <td style="width:150px;"><label class="control-label">科技活动类型</label></td>
                              <td id="tdstudytype">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">学科分类</label></td>
                              <td colspan="3" id="tdsubjecttype">Dooley</td>
                            </tr>
                            <tr style="display: none;">
                              <td style="width:150px;"><label class="control-label">需求技术所属领域</label></td>
                              <td colspan="3" id="tdtechfield">Dooley</td>
                            </tr>
                            <tr style="display: none;">
                              <td style="width:150px;"><label class="control-label">需求技术应用行业</label></td>
                              <td colspan="3" id="tdsector">Dooley</td>
                            </tr>
                            <tr>
                              <td style="width:150px;"><label class="control-label">审核意见</label></td>
                              <td colspan="3" id="tdunitbrief"><textarea style="width:100%;height:100px" id="advise"></textarea></td>
                            </tr>
                        </table>
                        <div style="display: none;width: 92%;" id="ysuccess" class='alert alert-success'><strong>该需求已通过</strong></div>
                        <div style="display: none;width: 92%;" id="nsuccess" class='alert alert-success'><strong>该需求已退回</strong></div>
                        <div style="display: none;width: 92%;" id="fail" class='alert alert-danger'><strong>审核失败</strong></div>
                        <button id="close" style="float:right;margin-left: 20px;margin-right: 200px;" type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <label style="float:right;margin-left: 20px;" for="auto">自动进入下一条</label>
                        <input style="float:right;margin-left: 20px;" id="auto" name="techfield" type="checkbox" value="auto" checked>
                        <button  id="nextdemand"  style="float:right;margin-left: 50px;" type="button" class="btn btn-primary">下一条</button>
                        <button value="不通过" id="no"  style="float:right;margin-left: 50px;" type="button" class="btn btn-primary">不通过</button>
                        <button value="通过" id="yes"  style="float:right;margin-left: 200px;" type="button" class="btn btn-primary">通过</button>
                      </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/static/js/tishi.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jilian.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/address.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/classie.js"></script>
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>
<script>
    function initFenye()
    {
        var $pagination = $('#pagination-demo');
        $pagination.twbsPagination('destroy');
        $('#pagination-demo').twbsPagination({
        totalPages: totalX,
        visiblePages: 5,
        startPage: curPage,
        initiateStartPageClick: false,
        first: '首页',
        last: '尾页',
        prev: '上一页',
        next: '下一页',
        onPageClick: function (event, page) {
                getData(page);
            }
        });
    }
    function getData(nextP,flag)
    {
        curPage = nextP == ""?1:nextP;
        status = $("#sta").val();
        var url = "demand-list";       
        var args = {"page":nextP,"pageSize":pageSize
        ,"sta":status,"first":first.join(","),"second":second.join(",")
        ,"third":third.join(","),"fourth":fourth.join(","),"fifth":fifth.join(",")
        ,"tfirst":tfirst.join(","),"tsecond":tsecond.join(","),"tdate":tdate.join(","),"time":new Date()};
        $.getJSON(url,args,function(data){
            if(data.lenth==0)
            {
                //$("#info table > tr:not(:first)").remove();
                alert("没有符合条件的信息！");
            }
            else
            {
               $("#info tr:first-child").nextAll().remove();
                var info = data.demandInfos;
                for(var i=0;i<info.length;i++)
                {                  
                    var date = new Date(info[i].date);
                    var setDate=date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);                    
                    var content = "<tr><td>"+info[i].id+"</td>";
                    $("#info").append();
                    if(${empty sessionScope.userBean})
                    {
                       content += "<td><button id='moveout' type='button' class='btn btn-link' data-toggle='modal' data-target='#myModal' onclick='getDemand("+info[i].id+")'>"+info[i].demandname+"</button></td>";
                    }
                    else
                    {
                       content +="<td><a href=demand-getById?id="+info[i].id+">"+info[i].demandname+"</a></td>";
                    }
                    content += "<td>"+setDate+"</td><td>"+info[i].status+"</td></tr>";
                    $("#info").append(content);                                                                                              
                }
                totalX = data.totalPages;
                totalRows = data.totalRows;
                initFenye();
                did = $("#info tr:not(:first)").first().find("td:first").html();
                if(flag==1)
                {
                  //$.ajaxSettings.async = true;
                  setTimeout("opennext("+did+")",1000);
                }
            }
        });
    }
    function getDemand(id)
    {
      did = id;
      //$("#nextdemand").unbind('click');
      $("#no,#yes").unbind('click');//这句很重要不然每点击一次，下次就多执行一次click中的代码
      var url = "demand-getByIdAjax";
      var args = {"id":id,"time":new Date()};
      $.getJSON(url,args,function(data){
          if(data.lenth==0)
          {
              //$("#info table > tr:not(:first)").remove();
              alert("出现未知错误！");
          }
          else
          {
              $("#no,#yes").click(function(){
                var url1 = "demand-review";
                var args1 = {"id":id,"advise":$("#advise").val(),"status":$(this).val(),"time":new Date()};
                $.getJSON(url1,args1,function(data1){
                    if(data1.lenth==0)
                    {
                        //$("#info table > tr:not(:first)").remove();
                        alert("出现未知错误！");
                    }
                    else
                    {
                      //alert(data1)
                      if(data1==1)
                      {
                        $("#nsuccess").hide();
                        $("#fail").hide();
                        $("#ysuccess").show();
                        if($("#auto:checked").length>0)
                        {
                          if($("td:contains("+id+")").parent().nextAll("tr").length>0)
                          {
                            setTimeout("close()",500);
                            setTimeout("open("+id+")",1000);
                            getData(curPage,0);
                          }
                          else
                          {
                             setTimeout("close()",500);
                             getData(curPage+1,1);
                          }
                        }
                        else
                        {
                          getData(curPage,0);
                        }
                        //$("td:contains("+id+")").nextAll("td").eq(2).html("通过");
                      }
                      else if(data1==2)
                      {
                        $("#fail").hide();
                        $("#ysuccess").hide();
                        $("#nsuccess").show();

                        if($("#auto:checked").length>0)
                        {
                          if($("td:contains("+id+")").parent().nextAll("tr").length>0)
                          {
                            setTimeout("close()",500);
                            setTimeout("open("+id+")",1000);
                            getData(curPage,0);
                          }
                          else
                          {
                            setTimeout("close()",500);
                            getData(curPage+1,1);
                          }
                        }
                        else
                        {
                          getData(curPage,0);
                        }
                        //$("td:contains("+id+")").nextAll("td").eq(2).html("不通过");
                      }
                      else
                      {
                        $("#ysuccess").hide();
                        $("#nsuccess").hide();
                        $("#fail").show();
                      }
                    }
                });
              });
              var qsdate =  new Date(data.qsdate);
              var jzdate = new Date(data.jzdate);
              var setqsDate = qsdate.getFullYear()+"-"+("0"+(qsdate.getMonth()+1)).slice(-2)+"-"+("0"+qsdate.getDate()).slice(-2);
              var setjzDate = jzdate.getFullYear()+"-"+("0"+(jzdate.getMonth()+1)).slice(-2)+"-"+("0"+jzdate.getDate()).slice(-2);                            
              $("#ysuccess,#nsuccess,#fail").hide();
              $("#tdunitname").html(data.unitname);
              $("#tdmgsector").html((data.mgsector==""?"空":data.mgsector));
              $("#tdaddress").html(data.address);
              $("#tdwebsite").html(data.website==""?"空":data.website);
              $("#tdfield").html(data.field.split('|'));
              $("#tdemail").html(data.mailbox);
              $("#tdlegalperson").html(data.legalperson);
              $("#tdcontactperson").html(data.contactperson);
              $("#tdpostcode").html(data.postcode==""?"空":data.postcode);
              $("#tdphone").html("移动电话:"+data.mobile
                +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;固定电话:"+(data.telephone==""?"空":data.telephone));
              $("#tdunittype").html(data.unittype);
              $("#tdfax").html(data.fax==""?"空":data.fax);
              $("#tdunitbrief").html(data.unitbrief);
              $("#tddemandname").html(data.demandname);
              $("#tddemandtime").html(setqsDate+"&nbsp;至&nbsp;"+setjzDate);
              $("#tddemandbrief").html(data.demandbrief);
              $("#tdkeys").html(data.keyword.split('|').join('、'));
              $("#tdtotal").html(data.invest);
              $("#tdteamunit").html(data.teamunit==""?"空":data.teamunit);
              $("#tdmode").html(data.mode);
              $("#tdstudytype").html(data.studytype);
              $("#advise").html(data.advise);
              if(data.studytype=="基础研究")
              {
                $("#tdsubjecttype").html(data.subjecttype.split('|').join('-'));
              }
              else
              {
                $("#tdtechfield").html(data.techfield.split('|').join('、')).parent().show();
                $("#tdsector").html(data.techsector.split('|').join('-')).parent().show();
                $("#tdsubjecttype").parent().hide();
              }
              if(data.status=="通过")
              {
                $("#ysuccess").show();
              }
              if(data.status=="不通过")
              {
                $("#nsuccess").show();
              }
          }
      });
    }

    $("#nextdemand").click(function(){
      if($("td:contains("+did+")").parent().nextAll("tr").length>0)
      {
        setTimeout("close()",500);
        setTimeout("open("+did+")",1000);
      }
      else
      {
        setTimeout("close()",500);
        //$.ajaxSettings.async = false;
        getData(curPage+1,1);
      }
    });
    function close()
    {
      $("#close").trigger('click');
    }
    function open(sid)
    {
      $("td:contains("+sid+")").parent().nextAll("tr").first().find("button").trigger('click');
    }
    function opennext(sid)
    {
      $("td:contains("+sid+")").nextAll("td").find("button").trigger('click');
    }
</script>
</html>