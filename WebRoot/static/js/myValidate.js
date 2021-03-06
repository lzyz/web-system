$().ready(function() {

// 自定义验证规则
$.validator.addMethod("email", function(value, element) {
			var emailReg = /.*@.*\.?.*?\.(com|cn)$/;
			return this.optional(element) || (emailReg.test(value));
		}, "请正确填写您的邮箱");
$.validator.addMethod("number", function(value, element) {
	var numberReg = /^[1][3458][0-9]{9}$/;
	return this.optional(element) || (numberReg.test(value));
}, "请正确填写您的手机号码");
$.validator.addMethod("usernp", function(value, element) {
	var usernameReg = /^[a-zA-Z0-9_][a-zA-Z0-9_]{3,9}$/;
	return this.optional(element) || (usernameReg.test(value));
}, "请正确填写您的用户名/密码");
$.validator.addMethod("truename", function(value, element) {
	var tname = /^([\u4e00-\u9fa5]{1,4}|[a-zA-Z\.\s]{1,20})$/;
	return this.optional(element) || (tname.test(value));
}, "请填写您的真实姓名");
$.validator.addMethod("post", function(value, element) {
	var tel = /^[0-9]{6}$/;
	return this.optional(element) || (tel.test(value));
}, "请正确填写您邮政编码");
$.validator.addMethod("card", function(value, element) {
	var length = /^\d{17}(\d|x)$/i;
	if(length.test(value))
    {
		 value=value.replace(/x$/i,"a");
		 var sBirthday=value.substr(6,4)+"-"+Number(value.substr(10,2))+"-"+Number(value.substr(12,2));
		 var d = new Date(sBirthday.replace(/-/g,"/")) ;
		 if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))
		 {
		     return false;
		 }
		 else
	     {
			 return true;
		 }
    }
	else
	{
		return false;
	}
	return this.optional(element);
}, "请正确填写您的身份证号");
//规则（把XXX改为相应的表单id）
  $("#checkForm").validate({
	  errorElement : 'span',
      errorClass : 'help-block',
      focusInvalid : false,
	  rules: {
		    oldpassword:{
		    	required : true,
		    	usernp : true
		    },
	    	codeCheck:{
				required : true,
				equalTo : "#checkCode"
			},
			password2:{
				required : true,
				equalTo:"#inputPassword"
			},
			username:{
				required : true,
				usernp:true
			},
			inputPassword:{
				required : true,
				usernp:true
			},
			name: {
				required: true,
				truename : true
			},
			/*phone: {
				required: true,
				number: true
			},*/
			sector: {
				required: true,
			},
			postcode: {
				post: true
			},
			number: {
				required: true,
				card: true
			},
			company: {
				required: true
			}
	    },
	    messages: {
	    	oldpassword:{
	    		required : "密码不能为空",
	    		usernp: "密码格式不正确，4-10位数字/字母/下划线"
	    	},
	    	codeCheck:{
				required : "验证码为空",
				equalTo :"验证码输入错误"
			},
			username:{
				required : "用户名为空",
				usernp:"用户名格式不正确，4-10位数字/字母/下划线"
			},
			inputPassword:{
				required : "密码为空",
				usernp:"密码格式不正确，4-10位数字/字母/下划线"
			},
			password2:{
				required : "确认密码为空",
				equalTo:"两次输入不一致"
			},
			name:{
				required: "请输入真实姓名",
				rangelength: "姓名名必须为1~4个汉字或1~15个字母"
			},
			/*phone: {
				required: "电话不能为空",
				number: "电话格式错误"
			},*/
			sector: {
				required: "单位不能为空"
			},
			postcode: {
				post: "请正确填写邮政编码"
			},
			number:{
				required: "身份证号不能为空",
				card: "身份证信息有误"
			},
			company: {
				required: "机构全称不能为空",//这个逗号要注意
			}
	    },
        highlight : function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        success : function(label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },
        errorPlacement : function(error, element) {
            element.parent('div').append(error);
        }
	});
});