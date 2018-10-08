package bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class PageBean {
     
	public int totalPages;
	
	public int totalRows;
      
	public List<DemandInfo> demandInfos;

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List<DemandInfo> getDemandInfos(){
		
		return demandInfos;
	}

	public void setDemandInfos(List<DemandInfo> demandInfos) throws ParseException {
		for(int i=0;i<demandInfos.size();i++)
    	{   		
    		demandInfos.get(i).setDate(new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(demandInfos.get(i).getDate()))); 
    	    //System.out.println(demandInfos.get(i).getDate());		    
    	}
		this.demandInfos = demandInfos;
	}
      
     
}
