/**
 * 
 */    
    	var currentInfo = "";
        var counter = 1;
        var isReading = true;
        var userid = "";       
       //读取用户输入信息
        function readInfo(id)
        {       	
        	userid = id;
            var info = $("#info").val();
            if(currentInfo==info&&info!="")
            {           
               counter++;
            }else
            {
               currentInfo = info;
               counter = 1;
               $("#suggest").hide();
            }
            if(counter==3)
            {
               getSuggest(info);
               isReading = false;
            }else
            {
               setTimeout("readInfo()",200);
            }
         }
         //向服务器获取提示信息
         function getSuggest(info)
         {              
               var url = "/Demand/subjectServlet?method=fuzzyQuery";
               var args = {"info":info,"userid":userid,"time":new Date()};               
               $("#suggest").html('');
               $.post(url,args,function(data)
               {                      
                      if(data!="")
                      {                                     	  
                          var suggests = data.split("|");
	                      for(var i=0;i<suggests.length;i++)
	                      {
	                           $("#suggest").append("<div class='out' onmouseover=\"this.className='over'\""+
	                            "onmouseout=\"this.className='out'\">"+
	                             suggests[i]+"</div>").click(function()
	                             {
	                                  $("#info").val($(this).text());
	                                  $("#suggest").hide();
	                             });
	                      }
	                      $("#suggest").show();
                      }
                      else
                      {                    	 
                          $("#suggest").hide();
                      }
               });         
         }               
         //当用户再次输入信息时，调用此函数重新打开监视状态
          $("#info").keyup(function()
           {		         		        	     
		          if(!isReading)
		          {		                 
		             isReading = true;
		             readInfo(userid);
		          }   
	       }); 