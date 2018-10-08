package actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import bean.DemandInfo;
import bean.PageBean;
import bean.UserBean;
import services.DemandService;

public class DemandAction extends ActionSupport implements SessionAware,RequestAware,
ModelDriven<DemandInfo>, Preparable{
					
	private DemandInfo model = null;		
	
	private String page = "1";
	
	private String pageSize = "3";
	
	private PageBean pageBean = new PageBean();
	
	private int totalPages;
	
	private List<DemandInfo> demandInfos;	
	
	private String sta;
					
	private String first;
	
	private String second;
	
	private String third;
	
	private String fourth;
	
	private String fifth;
	
	private String tfirst;
	
	private String tsecond;
	
	private String tdate;
	
	private String id;
		
	private InputStream inputStream;
	
	private Map<String, Object> sessionMap;
	
	public int flag;	

		
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public InputStream getInputStream() {
		return inputStream;
	}	

	public void setSta(String status) {
		this.sta = status;
	}			

	public void setFirst(String first) {
		this.first = first;
	}

	public void setSecond(String second) {
		this.second = second;
	}

	public void setThird(String third) {
		this.third = third;
	}

	public void setFourth(String fourth) {
		this.fourth = fourth;
	}

	public void setFifth(String fifth) {
		this.fifth = fifth;
	}

	public void setTfirst(String tfirst) {
		this.tfirst = tfirst;
	}

	public void setTsecond(String tsecond) {
		this.tsecond = tsecond;
	}
	
	public int getTotalPages() {		
		return totalPages;
	}

	public String getById()
	{		
		return "getOne";
	}
	
	public String review() throws UnsupportedEncodingException
	{
		int t = 0;
		flag = demandService.save(model);
		if(flag==1)
		{
			System.out.println(model.getStatus());
			t = model.getStatus().equals("通过")?1:2;
		}		
		inputStream = new ByteArrayInputStream(String.valueOf(t).getBytes("UTF-8"));
		return "ajax";
	}
	
	public String getByIdAjax() throws JsonProcessingException, UnsupportedEncodingException
	{		
		model = demandService.getById(id);
		ObjectMapper mapper = new ObjectMapper();
		String demand = mapper.writeValueAsString(model);
		inputStream = new ByteArrayInputStream(demand.getBytes("UTF-8"));
		return "ajax";
	}
	
	public void setTotalPages(Map<String,String[]> params) throws ParseException {
		int totalRows = getTotalRows(params);		
		this.totalPages = 0;	
		pageBean.setTotalRows(totalRows);
		if(totalRows%Integer.parseInt(pageSize)==0)
		{
			//System.out.println("=0");
			this.totalPages = totalRows/Integer.parseInt(pageSize);
		}
		else
		{
			//System.out.println("!=0");
			this.totalPages = totalRows/Integer.parseInt(pageSize)+1;
		}			
	}
	
	public int getTotalRows(Map<String,String[]> params) throws ParseException
	{
		return demandService.getTotalRows(params);
	}

	public List<DemandInfo> getDemandInfos() {
		return demandInfos;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		if(page.equals("")||page==null)
		{
			this.page = "1";
		}
		else
		{
			this.page = page;
		}		
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		if(pageSize.equals("")||pageSize==null)
		{
			this.pageSize = "3";
		}
		else
		{
			this.pageSize = pageSize;
		}			
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
		
	private DemandService demandService;
	
	public DemandService getDemandService() {
		return demandService;
	}

	public void setDemandService(DemandService demandService) {
		this.demandService = demandService;
	}

	public Map<String,String[]> getParams()
	{	    
	    Map<String,String[]> map = new HashMap<String,String[]>();
	    map.put("first",getParam(first));
	    map.put("second",getParam(second));
	    map.put("third",getParam(third));
	    map.put("fourth",getParam(fourth));
	    map.put("fifth",getParam(fifth));
	    map.put("tfirst",getParam(tfirst));
	    map.put("tsecond",getParam(tsecond));
	    map.put("tdate",getParam(tdate));	    
	    map.put("status",new String[]{sta==null?null:sta.trim()});
	    map.put("page",new String[]{page});
	    map.put("pageSize",new String[]{pageSize});
	    UserBean userBean = null;
		if(sessionMap.get("userBean")!=null)
		{
			userBean = (UserBean)sessionMap.get("userBean");
		}		
		map.put("userid",new String[]{userBean==null?null:String.valueOf(userBean.getId())});
	    return map;
	}
	
	public String[] getParam(String param)
	{
		String[] dparam = null;
		if(param!=null&&!param.equals(""))
		{
			dparam = param.split(",");			
		}
		return dparam;
	}
	
	
	public String listAll() throws JsonProcessingException, ParseException
	{		
		setTotalPages(getParams());
		demandInfos = demandService.getAll(getParams());
		//sessionMap.put("demandInfos",demandInfos);	
		return "listAll";
	}
	
	public String list() throws UnsupportedEncodingException, JsonProcessingException, ParseException
	{					
		setTotalPages(getParams());		
		demandInfos = demandService.getAll(getParams());		
		pageBean.setDemandInfos(demandInfos);
		pageBean.setTotalPages(totalPages);			
		
		ObjectMapper mapper = new ObjectMapper();
		String demand = mapper.writeValueAsString(pageBean);
		
		System.out.println("demand:"+demand);
		//System.out.println("first:"+Arrays.toString(getParam(first)));//可以用来把string[],转换为string,只不过需要再去掉首尾[]				
		inputStream = new ByteArrayInputStream(demand.getBytes("UTF-8"));
		return "ajax";
	}
	
	public String save() throws ParseException
	{				
		System.out.println("填报");
		UserBean userBean = (UserBean)sessionMap.get("userBean");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy MM dd");
		Date date = new Date();
		model.setUserBean(userBean);
	 	model.setDate(sdf1.parse(sdf1.format(date)));
	 	model.setId(sdf.format(date)+userBean.getId());
	 	model.setStatus("未审核");
	 	System.out.println(model.toString());
		flag = demandService.save(model);
		return "save";
	}
	
	
	public void prepareSave()
	{
		model = new DemandInfo();
	}
	
	public void prepareReview()
	{
		model = demandService.getById(id);
	}
	
	public void prepareGetById()
	{
		model = demandService.getById(id);
	}
	
	@Override
	public void prepare() throws Exception {}

	@Override
	public DemandInfo getModel() {	
		
		return model;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		sessionMap = arg0;
	}

}
