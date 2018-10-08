/**
 *
 */
                     var targetval;
                     var selectval;
                     var index = 0;
                	 function getV(nextid,thisvalue)
                	 {
                		 $("#"+nextid+" option:not(:first)").remove();
                		 if(thisvalue!="")
                		 {
                			 var url = "menu-listOptions";
        	        		 var args = {"name":thisvalue,"time":new Date()};
        	        		 $.getJSON(url,args,function(data)
        	   	        		  {
        	   	        			   if(data.length==0)
        	   	        			   {
        	   	        				   alert(thisvalue+"没有分类")
        	   	        			   }
        	   	        			   else
        	   	        			   {
                                           var isselected = "";
        	   	        				   for(var i=0;i<data.length;i++)
        	   	        				   {
        	   	        					   var selBid = data[i].id;
        	   	        					   var selBname = data[i].name;
        	   	        					   //alert(selectval[index])
                                               if(selectval!=null&&selectval[index]==selBname)
                                               {
                                            	   // alert("sdf");
                                                    isselected = "selected";
                                                    index++;
                                               }
        	   	        				       $("#"+nextid).append("<option value='"+selBname+"'"+isselected+">"+selBname+"</option>");
                                               isselected = "";
        	   	        				   }
        	   	        			   }
                                       if(index==1||index==2)
                                       {
                                          getV(targetval[index],selectval[index-1]);
                                          $("#"+targetval[index]).show();
                                       }
        	   	        		  });
                		 }
                         else
                         {
                            alert("未知错误");
                         }
                	 }
                     function initS(tval,sval)
                     {
                        targetval = tval;
                        selectval = sval;
                        getV(targetval[index],"0")
                     }
                	 $("#selA").change(function()
        	         {
                		  getV("selB",$(this).val());
                		  $("#selB").show();
        	         });
                	 $("#selB").change(function(){
                		  getV("selC",$(this).val());
                		  $("#selC").show();
                	 });
                	 $("#selA1").change(function()
        	         {
                		  getV("selB1",$(this).val());
                		  $("#selB1").show();
        	         });
                	 $("#selB1").change(function(){
               		      getV("selC1",$(this).val());
               		      $("#selC1").show();
               	     });