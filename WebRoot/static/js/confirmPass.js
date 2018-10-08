/**
 * 
 */      
       var xmlHttp; //用于保存XMLHttpRequest对象的全局变量
       var optionsInfo;
       //用于创建XMLHttpRequest对象
       function creatXmlHttp()
       {
	        if(window.XMLHttpRequest){
	             xmlHttp = new XMLHttpRequest();
	        }else{
	             xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	        }
       }      
       //获取列表选项的调用函数
       function judge(newp,oldp,salt)
       {   	  
          if(newp=="")//为空表示选中的是默认项
          {
             return;
          }
          creatXmlHttp();
          xmlHttp.onreadystatechange = buildSelectCallBack;
          xmlHttp.open("POST","/Demand/user/function/ajax/confirm.jsp?oldp="+oldp+"&newp="+newp+"&salt="+salt,true);
          xmlHttp.send(null);         
          return optionsInfo;
       }
       //获取列表选项的回调函数
       function buildSelectCallBack()
       {                 
          if(xmlHttp.readyState==4&&xmlHttp.status==200)
          {
             //将从服务器获得的文本转为对象直接量       	 
             optionsInfo = xmlHttp.responseText;            
             if(optionsInfo.trim()=="2"&&$("#alt").length==0)
             {           	
            	 $("<div id='alt' class='alert alert-danger' role='alert'>与原密码不一致</div>").insertAfter($("#old"));
             }
             else if(optionsInfo.trim()=="1")
             {
            	 $("#alt").remove();
             }
          } 
       }       