/**
 *
 */
    var address;
    function init(id1,id2,initvalue) {
        var field = initvalue.split('|');
        var isselect = "";      
        $(address).find("city").each(function(n){       	 
            if(field[0]==$(this).attr("name"))
            {
                 isselect = "selected";
            }
            $(id1).append("<option value='"+$(this).attr("name")+"'"+isselect+">"+$(this).attr("name")+"</option>")
            if(isselect=="selected")
            {
                $(id2+" option:not(:first)").remove();
                $(address).find("city[name='"+field[0]+"'] country").each(function(n){
                    if(field[1]==$(this).attr("name"))
                    {
                         isselect = "selected";
                    }
                    $(id2).append("<option value='"+$(this).attr("name")+"'"+isselect+">"+$(this).attr("name")+"</option>")
                    isselect = "";
                });
            }
            isselect = "";
        });
        $(id1).change(function(event){
            $(id2+" option:not(:first)").remove();
            $(address).find("city[name='"+$(this).val()+"'] country").each(function(n){
                $(id2).append("<option value='"+$(this).attr("name")+"'>"+$(this).attr("name")+"</option>")
            });
        });
    }
    function getAddress(id1,id2,initvalue)
    {
        $.get("/Demand/static/xml/address.xml",function(data){
            address = data;
            init(id1,id2,initvalue);
        });
    }