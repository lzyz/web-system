/**
 *
 */
var unit = '(单位基本情况，研究基础等，限200字)';
var demand = '(主要内容，技术指标，预期经济和社会效益等，限500字)';
var gd = '固定电话';
var yd = '手机电话';

function checkLength(obj, maxlength) {
  if (obj.value.length > maxlength) {
    obj.value = obj.value.substring(0, maxlength);
    alert("字数超过限制")
  }
}

function foc(id) {
  var tex = document.getElementById(id);
  var reg = new RegExp(unit + "|" + demand + "|" + gd + "|" + yd);
  if (reg.test(tex.value)) {
    tex.value = "";
  }
}

function Reset() {
  $("#techfield").hide();
  $("#techsector").hide();
  $("#studytype").show();
  document.getElementById("form1").reset();
}

function checkPhone(thisj) //注意参数不能为this这样的关键字
{
  if (!(/^1[34578]\d{9}$/.test(thisj.value)) && thisj.value != "") {
    setTimeout(function() {
      $("#" + thisj.id).val("");
      $("#" + thisj.id).attr("placeholder", "手机号码有误，请重填");
      $("#" + thisj.id).attr("class", "invalid");
      $("#" + thisj.id).focus();

    }, 1);
  }
}

function checkName(thisj) {
  if (!(/^([\u4e00-\u9fa5]{1,4}|[a-zA-Z\.\s]{1,20})$/.test(thisj.value)) && thisj.value != "") {
    //alert("请输入真实姓名");
    $("#" + thisj.id).val("");
    $("#" + thisj.id).attr("placeholder", "请输入真实姓名");
    $("#" + thisj.id).attr("class", "invalid");
    $("#" + thisj.id).focus();
  }
}

function checkemail(thisj) {
  var emailReg = /.*@.*\.?.*?\.(com|cn)$/;
  if (!(emailReg.test(thisj.value)) && thisj.value != "") {
    //alert("邮箱填写错误");
    $("#" + thisj.id).val("");
    $("#" + thisj.id).attr("placeholder", "邮箱填写错误");
    $("#" + thisj.id).attr("class", "invalid");
    $("#" + thisj.id).focus();
  }
}
/*function checktelephone(value,id)
	   {
	      var regexp = /^((0\d{2,3}-\d{7,8}))$/;
	      if(!(regexp.test(value))&&value!="")
	      {
	          alert("固定电话输入错误")
	          setTimeout(function () {
		        	   document.getElementById(id).value="";
	                   document.getElementById(id).focus();
	            }, 1);
	      }
	   }*/
/*function stripscript(s){
            var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]")
            var rs = "";
            for (var i = 0; i < s.length; i++) {
                rs = rs+s.substr(i, 1).replace(pattern, '');
            }
            return rs;
       }*/
function checkNumber(sId) {
  if (sId != "") {
    var iSum = 0;
    var info = "";
    if (!/^\d{17}(\d|x)$/i.test(sId)) {
      alert("你输入的身份证长度或格式错误");
    }
    sId = sId.replace(/x$/i, "a");
    if (aCity[parseInt(sId.substr(0, 2))] == null) {
      alert("你的身份证地区非法");
    }
    sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-" + Number(sId.substr(12, 2));
    var d = new Date(sBirthday.replace(/-/g, "/"));
    if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) {
      alert("身份证上的出生日期非法");
    }
    for (var i = 17; i >= 0; i--) {
      iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11);
    }
    if (iSum % 11 != 1) {
      alert("你输入的身份证号非法");
    }
  }
  //aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女");//此次还可以判断出输入的身份证号的人性别
}
/*function checkspecial(thisj)
	   {
		     var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&mdash;—|{}【】‘；：”“'。，、？]");
			 var re =/[`~!@#$%^&*_+<>{}\/'[\]]/im;
			 if (re.test(thisj.value))
			 {
			    alert('不能存在特殊字符');
			    $("#"+thisj.id).val("");
			 }
	   }*/
function checkpostcode(thisj) {
  var tel = /^[0-9]{6}$/;
  if (!tel.test(thisj.value) && thisj.value != "") {
    //alert("邮政编码输入错误!")
    $("#" + thisj.id).val("");
    $("#" + thisj.id).attr("placeholder", "邮政编码填写错误");
    $("#" + thisj.id).attr("class", "invalid");
    $("#" + thisj.id).focus();
  }
}
/*function checkURL(value,id)
	   {
		   var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
		   + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
		    + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
		    + "|" // 允许IP和DOMAIN（域名）
		    + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
		    + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
		    + "[a-z]{2,6})" // first level domain- .com or .museum
		    + "(:[0-9]{1,4})?" // 端口- :80
		    + "((/?)|" // a slash isn't required if there is no file name
		    + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
		    var re = new RegExp(strRegex);
		    if (!re.test(value)&&value!=""){
		         alert("网址输入错误！");
		         document.getElementById(id).value="";
		         document.getElementById(id).focus();
		    }
	   }*/
function checkUrl(thisj) {
  if (value != "") {
    var reg = /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
    if (!reg.test(value)) {
      //alert("网址输入错误");
      $("#" + thisj.id).val("");
      $("#" + thisj.id).attr("placeholder", "网址输入错误");
      $("#" + thisj.id).attr("class", "invalid");
      $("#" + thisj.id).focus();
    }
  }
}

function checkfax(thisj) {
  var t = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
  if (!t.test(thisj.value) && thisj.value != "") {
    //alert("传真输入错误");
    $("#" + thisj.id).val("");
    $("#" + thisj.id).attr("placeholder", "传真输入错误");
    $("#" + thisj.id).attr("class", "invalid");
    $("#" + thisj.id).focus();
  }
}
/*function checkKeyForFloat(value, e) {
    	   var isOK = false;
    	   var key = window.event ? e.keyCode : e.which;
    	   if ((key > 95 && key < 106) || //小键盘上的0到9
    	   (key > 47 && key < 60) || //大键盘上的0到9
    	   (key == 110 && value.indexOf(".") < 0) || //小键盘上的.而且以前没有输入.
    	   (key == 190 && value.indexOf(".") < 0) || //大键盘上的.而且以前没有输入.
    	   key == 8 || key == 9 || key == 46 || key == 37 || key == 39 //不影响正常编辑键的使用(8:BackSpace;9:Tab;46:Delete;37:Left;39:Right)
    	  ) {
    	    isOK = true;
    	   } else {
    	    if (window.event) //IE
    	    {
    	     e.returnValue = false; //event.returnValue=false 效果相同.
    	    }
    	    else //Firefox
    	    {
    	     e.preventDefault();
    	    }
    	   }
    	   return isOK;
    	  }
        function onlyNumber(obj){

    	      //得到第一个字符是否为负号
    	      var t = obj.value.charAt(0);
    	      //先把非数字的都替换掉，除了数字和.
    	      obj.value = obj.value.replace(/[^\d\.]/g,'');
    	       //必须保证第一个为数字而不是.
    	       obj.value = obj.value.replace(/^\./g,'');
    	       //保证只有出现一个.而没有多个.
    	       obj.value = obj.value.replace(/\.{2,}/g,'.');
    	       //保证.只出现一次，而不能出现两次以上
    	       obj.value = obj.value.replace('.','$#$').replace(/\./g,'').replace('$#$','.');
    	       //如果第一位是负号，则允许添加
    	       if(t == '-'){
    	         obj.value = '-'+obj.value;
    	       }

    	}
       function clearNoNum(obj)
       {
           //修复第一个字符是小数点 的情况.
           if(obj.value !=''&& obj.value.substr(0,1) == '.'){
               obj.value="";
           }
           obj.value = obj.value.replace(/^0*(0\.|[1-9])/, '$1');//解决 粘贴不生效
           obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
           obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
           obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
           obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数
           if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
               if(obj.value.substr(0,1) == '0' && obj.value.length == 2){
                   obj.value= obj.value.substr(1,obj.value.length);
               }
           }
       }*/
function IsValid(oField) {
  var re = /insert|select|update|delete|exec|count|'|"|=|;|>|<|%/i;
  var re1 = /[`~!@#$%^&*_+<>{}\/'[\]]/im;
  $sMsg = "请您不要在参数中输入特殊字符和SQL关键字！";
  if (re.test(oField.value) || re1.test(oField.value)) {
    alert($sMsg);
    oField.value = '';
    oField.focus();
    return false;
  }
}
$(function() {
  $(":radio[name=unittype]").each(function() {
    $(this).change(function() {
    
      if (this.value == "其他") {
    	  //alert(this.value)
        $("#hid1").css("visibility", "visible");
      } else {
        $("#hid1").css("visibility", "hidden");
      }
    });
  });
  $(":radio[name=mode]").each(function() {
    $(this).change(function() {
    	
      if (this.value == "其他") {
    	  //alert(this.value)
        $("#hid3").css("visibility", "visible");
      } else {
        $("#hid3").css("visibility", "hidden");
      }
    });
  });
  $(":radio[name=studytype]").each(function() {
    $(this).change(function() {
    	
      if (this.value.trim()=="基础研究") {
    	  //alert(this.value);       
        $("#studytype").show();
        $("#techfield").hide();
        $("#techsector").hide();
      } else {
    	 // alert("2")
        getV("selA1", "0");
        $("#studytype").hide();
        $("#techfield").show();
        $("#techsector").show();
      }
    });
  });
  $("#techfield1").change(function() {
      if($("#hid2").css("visibility")=="visible")
      {
          $("#hid2").css("visibility", "hidden");
      }
      else
      {
          $("#hid2").css("visibility", "visible");
      }
  });
  $("#total").keydown(function(e) {
    let keyCode = e.keyCode;
    //if((keyCode >= 48 && keyCode <= 57 || keyCode === 190 || keyCode === 8) && !(!$("#total").val() && e.keyCode === 48))
    if ((keyCode >= 96 && keyCode <= 105 || keyCode === 190 || keyCode === 8) && !(!$("#total").val() && e.keyCode === 96)) {
      let num = ($("#total").val() + "" + e.key);
      if (/^[0-9]+(.[0-9]{0,2})?$/.test(num)) {
        //alert(keyCode);
      } else {
        if (e.keyCode === 8) {
          return;
        }
        e.preventDefault();
      }
    } else {
      e.preventDefault();
    }
  });
  $("#selC1,#selC").each(function() {
    $(this).change(function() {
      if ($(this).val() != "") {
        $("font[name='alt']").hide();
      }
    });
  });
  $("#city").change(function(){
       if($(this).val()!="")
       {
           $(this).css("color","");
       }
  })
  $("#country").change(function(){
       if($(this).val()!="")
       {
           $(this).css("color","");
       }
  })
  $("#sub").click(function() {
    if ($("#unitname").val() == "") {
      //alert("机构全称不能为空！");
      $("#unitname").attr("placeholder", "机构全称不能为空！");
      $("#unitname").attr("class", "invalid");
      $("#unitname").focus();
      return false;
    }
    if ($("#address").val() == "") {
      $("#address").attr("placeholder", "通讯地址不能为空！");
      $("#address").attr("class", "invalid");
      $("#address").focus();
      return false;
    }
    if($("#city").val()=="")
    {
      $("#city").focus();
      $("#city").css("color","red");
      return false;
    }
    if($("#country").val()=="")
    {
      $("#country").focus();
      $("#country").css("color","red");
      return false;
    }
    if ($("#email").val() == "") {
      //alert("电子信箱不能为空！");
      $("#email").attr("placeholder", "电子信箱不能为空！");
      $("#email").attr("class", "invalid");
      $("#email").focus();
      return false;
    }
    if ($("#legalperson").val() == "") {
      //alert("法人代表不能为空！");
      $("#legalperson").attr("class", "invalid");
      $("#legalperson").attr("placeholder", "法人代表不能为空！");
      $("#legalperson").focus();
      return false;
    }
    if ($("#contactperson").val() == "") {
      //alert("联系人不能为空！");
      $("#contactperson").attr("class", "invalid");
      $("#contactperson").attr("placeholder", "联系人不能为空！");
      $("#contactperson").focus();
      return false;
    }
    if ($("#mobile").val() == "") {
      $("#mobile").attr("class", "invalid");
      $("#mobile").attr("placeholder", "请填写移动电话！"); //
      $("#mobile").focus();
      return false;
    }
    //!$(':radio[name=unit]:checked').length
    if ($(':radio[name=unittype]:checked').val() == "其他" && $("#hid1").val() == "") {
      $("#hid1").focus();
      $("#hid1").next().show();
      return false;
    } else {
      $("#hid1").next().hide();
    }
    if ($(':radio[name=mode]:checked').val() == "其他" && $("#hid3").val() == "") {
      //alert('请选择机构属性');
      $("#hid3").focus();
      $("#hid3").attr("class", "invalid");
      $("#hid3").attr("placeholder", "请填写内容！");
      return false;
    }
    if ($("#start").val() == "") {
      $("#start").focus();
      $("#date").css("color","red");
      $("#date").html($("#date").html()+"！！！");
      return false;
    }
    if ($("#end").val() == "") {
      $("#end").focus();
      $("#date").css("color","red");
      $("#date").html($("#date").html()+"！！！");
      return false;
    }
    else
    {
       $("#date").css("color","");
      $("#date").html("需求时限");
    }
    if ($("#unitbrief").val() == "") {
      //alert("请填写机构简介！");
      $("#unitbrief").attr("class", "tvalid");
      $("#unitbrief").attr("placeholder", "请填写机构简介！");
      $("#unitbrief").focus();
      return false;
    }
    if ($("#demandname").val() == "") {
      //alert("技术需求名称不能为空！");
      $("#demandname").attr("class", "invalid");
      $("#demandname").attr("placeholder", "技术需求名称不能为空！");
      $("#demandname").focus();
      return false;
    }
    if ($("#demand").val() == "") {
      $("#demand").attr("class", "tvalid");
      $("#demand").attr("placeholder", "请填写需求概述！");
      $("#demand").focus();
      return false;
    }
    if ($("#keyword1").val() == "" & $("#keyword2").val() == "" & $("#keyword3").val() == "" & $("#keyword4").val() == "" & $("#keyword5").val() == "") {
      $("#keyword1").focus();
      $("#keyword1").attr("class", "invalid");
      $("#keyword1").attr("placeholder", "请填写关键字！");
    }
    //$("#telephone").val().trim()==gd
    if ($('input[name="studytype"]:checked').val() != "基础研究" && $(":checkbox:checked").length == 0 ) {
      $("#hid2").next().show();
      return false;
    } else {
      $("#hid2").next().hide();
    }
    if ($('input[name="studytype"]:checked').val() == "基础研究" && ($('#selA').val() == "" || $('#selB').val() == "" || $('#selC').val() == "")) {
      $("font[name=alt]").show();
      return false;
    }
    if ($('input[name="studytype"]:checked').val() != "基础研究" && ($('#selA1').val() == "" || $('#selB1').val() == "" || $('#selC1').val() == "")) {
      $("font[name=alt]").show();
      return false;
    }
  });
});