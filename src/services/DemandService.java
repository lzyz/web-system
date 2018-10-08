package services;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Dao.DemandDao;
import bean.DemandInfo;
import bean.MenuInfo;

public class DemandService {
      
	private DemandDao demandDao;

	public DemandDao getDemandDao() {
		return demandDao;
	}

	public void setDemandDao(DemandDao demandDao) {
		this.demandDao = demandDao;
	}
      
	public int save(DemandInfo demandInfo)
	{
		return demandDao.save(demandInfo);
	}
	
	public ArrayList<DemandInfo> getAll(Map<String,String[]> params) throws JsonProcessingException, ParseException
	{	    			
		return demandDao.listAll(params);
	}
	
	public int getTotalRows(Map<String,String[]> params) throws ParseException
	{
		return demandDao.getTotalRows(params);
	}
	
	public DemandInfo getById(String id)
	{
		return demandDao.getById(id);
	}
}
