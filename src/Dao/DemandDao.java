package Dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.CriteriaQuery;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Junction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.engine.spi.TypedValue;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import bean.DemandInfo;

public class DemandDao extends BaseDao {
    
	public int save(DemandInfo demandInfo)
    {
    	try {
			getSession().saveOrUpdate(demandInfo);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
    }
	
	@SuppressWarnings("unchecked")
	public ArrayList<DemandInfo> listAll(Map<String,String[]> params) throws JsonProcessingException, ParseException
	{					
	    ArrayList<Criterion> o = new ArrayList<Criterion>();
	    ArrayList<Criterion> r = new ArrayList<Criterion>();//别忘了保存！！！！！！
	    Conjunction conjunction = Restrictions.conjunction();
		Conjunction tempconjunction = Restrictions.conjunction();
	    Disjunction disjunction = Restrictions.disjunction();
		
		//写userBean好使，写this.userBean不好使，但下面怎么好使。。。
		Criteria criteria = getSession().createCriteria(DemandInfo.class)
				                        .setFetchMode("userBean",FetchMode.EAGER);
		
		if(params.get("userid")[0]!=null)
		{			
			criteria.add(Restrictions.eq("this.userBean.id",Integer.parseInt(params.get("userid")[0])));
		}	
		
		if(params.get("status")[0]!=null&&!params.get("status")[0].equals(""))
		{
			criteria.add(Restrictions.eq("status",params.get("status")[0]));
		}
				
		if(params.get("first")!=null&&params.get("first").length>0)
        {										    			
			Criterion curCriterion = null;			
											
            for(int i=0;i<params.get("first").length;i++)
            {        	
				if(((i+1)<params.get("first").length)&&params.get("fifth")[i+1].equals("prev"))//接上一个条件
				{
					if(params.get("first")[i].equals("not"))
					{       						
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.ne(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.sqlRestriction(params.get("second")[i]+" not like '%"+params.get("fourth")[i]+"%'");						    
						}				
					}
					else
					{
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.eq(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.like(params.get("second")[i],params.get("fourth")[i],MatchMode.ANYWHERE);						    
						}		
					}
					if(params.get("first")[i+1].equals("or"))
					{       
						o.add(disjunction);									
					}					
					else
					{
						o.add(conjunction);						
					}					
                    r.add(curCriterion);					
				}
				else if(((i+1)<params.get("first").length))//独立条件
				{
					//执行函数
					getQuery(o, r);
					
					if(params.get("first")[i].equals("not"))
					{       						
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.ne(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.sqlRestriction(params.get("second")[i]+" not like '%"+params.get("fourth")[i]+"%'");						    
						}				
					}
					else
					{
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.eq(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.like(params.get("second")[i],params.get("fourth")[i],MatchMode.ANYWHERE);						    
						}		
					}
					if(params.get("first")[i+1].equals("or"))
					{       
						o.add(disjunction);									
					}					
					else
					{
						o.add(conjunction);						
					}					
                    r.add(curCriterion);					
				}
                else
				{
                	if(params.get("first")[i].equals("not"))
					{       						
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.ne(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.sqlRestriction(params.get("second")[i]+" not like '%"+params.get("fourth")[i]+"%'");						    
						}				
					}
					else
					{
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.eq(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.like(params.get("second")[i],params.get("fourth")[i],MatchMode.ANYWHERE);						    
						}		
					}
                    r.add(curCriterion);		
					//执行函数
                	getQuery(o, r);
				}					
            }            	    	  	
        }		     			
		
		if(params.get("tfirst")!=null&&params.get("tfirst").length>0)
        {			
			if(r.size()>0)
        	{
        		o.add(conjunction);
        	}		
			Criterion curCriterion = null;
            Criterion curCriterion1 = null; 			
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM dd");
            for(int i=0;i<params.get("tfirst").length;i++)
            {             
                String[] dates = params.get("tdate")[i].split("\\|");//转义	
				if(params.get("tfirst")[i].equals("not"))
				{
					if(params.get("tsecond")[i].equals("submit"))
					{
						curCriterion = Restrictions.ge("date",sdf.parse(String.join(" ",dates[1].split("-"))));	
						curCriterion1 = Restrictions.le("date",sdf.parse(String.join(" ",dates[0].split("-"))));
						tempconjunction.add(curCriterion);
						tempconjunction.add(curCriterion1);	
					}
					else
					{
						curCriterion = Restrictions.ge("qsdate",sdf.parse(String.join(" ",dates[1].split("-"))));	
						curCriterion1 = Restrictions.le("jzdate",sdf.parse(String.join(" ",dates[0].split("-"))));
						tempconjunction.add(curCriterion);
						tempconjunction.add(curCriterion1);		
					}
					r.add(tempconjunction);	 	
				}
				else
				{
					if(params.get("tsecond")[i].equals("submit"))
					{
						curCriterion = Restrictions.between("date",sdf.parse(String.join(" ",dates[0].split("-"))),sdf.parse(String.join(" ",dates[1].split("-"))));					
						r.add(curCriterion);
					}
					else
					{
						curCriterion = Restrictions.ge("qsdate",sdf.parse(String.join(" ",dates[0].split("-"))));	
						curCriterion1 = Restrictions.le("jzdate",sdf.parse(String.join(" ",dates[1].split("-"))));
						tempconjunction.add(curCriterion);
						tempconjunction.add(curCriterion1);
						r.add(tempconjunction);							
					}
				}					
                if((i+1)<params.get("tfirst").length)//接不
                {				                 
					if(params.get("tfirst")[i+1].equals("or"))
					{
						o.add(disjunction);
					}
                    else
					{
						o.add(conjunction);
					}                  	
                }
                else
				{
					getQuery(o, r);
				}					
            }           
        }		
		if(r.size()>=1)
	    {
	    	criteria.add(r.get(0));  	
	    }	
		
		ArrayList<DemandInfo> demandInfos = (ArrayList<DemandInfo>) criteria.setFirstResult((Integer.parseInt(params.get("page")[0]) - 1) * Integer.parseInt(params.get("pageSize")[0]))
                .setMaxResults(Integer.parseInt(params.get("pageSize")[0]))                                            
                .list();			
		return demandInfos;
		/*String hql = "FROM DemandInfo e LEFT OUTER JOIN FETCH e.userBean ";		
		if(params.get("userid")[0]!=null)
		{
			System.out.println("userid不为空:"+params.get("userid")[0]);
			hql += "WHERE e.userBean.id = ?";
		}		 
		Query query = getSession().createQuery(hql);     
		if(params.get("userid")[0]!=null)
		{
			query.setInteger(0,Integer.parseInt(params.get("userid")[0]));
		}		
		ArrayList<DemandInfo> demandInfos =  (ArrayList<DemandInfo>) query.setFirstResult((Integer.parseInt(params.get("page")[0]) - 1) * Integer.parseInt(params.get("pageSize")[0]))
								        .setMaxResults(Integer.parseInt(params.get("pageSize")[0]))
								        .list();
		System.out.println("demandInfos.size:"+demandInfos.size());	*/	
	}
	
	public void getQuery(ArrayList<Criterion> o,ArrayList<Criterion> r)
	{		
		while(o.size()>0&&r.size()>=2)
		{
			System.out.println("o.size:"+o.size());
			System.out.println("r.size:"+r.size());
			if(o.get(o.size()-1) instanceof Conjunction)
			{
				System.out.println(r.get(r.size()-1)+" conjunction "+r.get(r.size()-2));
				Conjunction conjunction = Restrictions.conjunction();
				conjunction.add(r.get(r.size()-1));
				conjunction.add(r.get(r.size()-2));
				r.remove(r.get(r.size()-1));
				r.remove(r.get(r.size()-1));
				r.add(conjunction);
				o.remove(o.get(o.size()-1));
				System.out.println("aftero.size:"+o.size());
				System.out.println("afterr.size:"+r.size());
			}
			else if(o.get(o.size()-1) instanceof Disjunction)
			{
				System.out.println(r.get(r.size()-1)+" disjunction "+r.get(r.size()-2));
				Disjunction disjunction = Restrictions.disjunction();
				disjunction.add(r.get(r.size()-1));
				disjunction.add(r.get(r.size()-2));
				r.remove(r.get(r.size()-1));
				r.remove(r.get(r.size()-1));
				r.add(disjunction);
				o.remove(o.get(o.size()-1));
			}		
		}
		/*if(o.size()>0&&r.size()>=2)
		{
			for(int i=r.size()-1;i>0;i--)
			{
				if(o.get(o.size()-1) instanceof Conjunction)
				{
					Conjunction conjunction = Restrictions.conjunction();
					conjunction.add(r.get(i));
					conjunction.add(r.get(i-1));
					r.remove(i);
					r.remove(i-1);
					r.add(conjunction);
					o.remove(o.size()-1);
				}
				else if(o.get(o.size()-1) instanceof Disjunction)
				{
					Disjunction disjunction = Restrictions.disjunction();
					disjunction.add(r.get(i));
					disjunction.add(r.get(i-1));
					r.remove(i);
					r.remove(i-1);
					r.add(disjunction);
					o.remove(o.size()-1);
				}		
			}		
		}*/
	}
	
	public int getTotalRows(Map<String,String[]> params) throws ParseException
	{
		
		ArrayList<Criterion> o = new ArrayList<Criterion>();
	    ArrayList<Criterion> r = new ArrayList<Criterion>();//别忘了保存！！！！！！
	    Conjunction conjunction = Restrictions.conjunction();
		Conjunction tempconjunction = Restrictions.conjunction();
	    Disjunction disjunction = Restrictions.disjunction();
		
		
		Criteria criteria = getSession().createCriteria(DemandInfo.class)
				                        .setFetchMode("userBean",FetchMode.EAGER);
		
		if(params.get("userid")[0]!=null)
		{			
			criteria.add(Restrictions.eq("this.userBean.id",Integer.parseInt(params.get("userid")[0])));
		}	
			
		if(params.get("status")[0]!=null&&!params.get("status")[0].equals(""))
		{
			criteria.add(Restrictions.eq("status",params.get("status")[0]));
		}
		
		if(params.get("first")!=null&&params.get("first").length>0)
        {							   
			Criterion curCriterion = null;			
											
            for(int i=0;i<params.get("first").length;i++)
            {        	
				if(((i+1)<params.get("first").length)&&params.get("fifth")[i+1].equals("prev"))//接上一个条件
				{
					if(params.get("first")[i].equals("not"))
					{       						
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.ne(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.sqlRestriction(params.get("second")[i]+" not like '%"+params.get("fourth")[i]+"%'");						    
						}				
					}
					else
					{
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.eq(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.like(params.get("second")[i],params.get("fourth")[i],MatchMode.ANYWHERE);						    
						}		
					}
					if(params.get("first")[i+1].equals("or"))
					{       
						o.add(disjunction);									
					}					
					else
					{
						o.add(conjunction);						
					}					
                    r.add(curCriterion);					
				}
				else if(((i+1)<params.get("first").length))//独立条件
				{
					//执行函数
					getQuery(o, r);
					
					if(params.get("first")[i].equals("not"))
					{       						
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.ne(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.sqlRestriction(params.get("second")[i]+" not like '%"+params.get("fourth")[i]+"%'");						    
						}				
					}
					else
					{
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.eq(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.like(params.get("second")[i],params.get("fourth")[i],MatchMode.ANYWHERE);						    
						}		
					}
					if(params.get("first")[i+1].equals("or"))
					{       
						o.add(disjunction);									
					}					
					else
					{
						o.add(conjunction);						
					}					
                    r.add(curCriterion);					
				}
                else
				{
                	if(params.get("first")[i].equals("not"))
					{       						
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.ne(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.sqlRestriction(params.get("second")[i]+" not like '%"+params.get("fourth")[i]+"%'");						    
						}				
					}
					else
					{
						if(params.get("third")[i].equals("exact"))
						{
							curCriterion = Restrictions.eq(params.get("second")[i],params.get("fourth")[i]);							    
						}
						else
						{
							curCriterion = Restrictions.like(params.get("second")[i],params.get("fourth")[i],MatchMode.ANYWHERE);						    
						}		
					}
                    r.add(curCriterion);		
					//执行函数
                	getQuery(o, r);
                	//System.out.println("最后:"+r.get(0));
				}					
            }               	
        }	
		
	    if(params.get("tfirst")!=null&&params.get("tfirst").length>0)
        {			
	    	if(r.size()>0)
        	{
        		o.add(conjunction);
        	}
			Criterion curCriterion = null;
            Criterion curCriterion1 = null; 			
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM dd");
            for(int i=0;i<params.get("tfirst").length;i++)
            {             
                String[] dates = params.get("tdate")[i].split("\\|");//转义	
				if(params.get("tfirst")[i].equals("not"))
				{
					if(params.get("tsecond")[i].equals("submit"))
					{
						curCriterion = Restrictions.ge("date",sdf.parse(String.join(" ",dates[1].split("-"))));	
						curCriterion1 = Restrictions.le("date",sdf.parse(String.join(" ",dates[0].split("-"))));
						tempconjunction.add(curCriterion);
						tempconjunction.add(curCriterion1);	
					}
					else
					{
						curCriterion = Restrictions.ge("qsdate",sdf.parse(String.join(" ",dates[1].split("-"))));	
						curCriterion1 = Restrictions.le("jzdate",sdf.parse(String.join(" ",dates[0].split("-"))));
						tempconjunction.add(curCriterion);
						tempconjunction.add(curCriterion1);		
					}
					r.add(tempconjunction);	 	
				}
				else
				{
					if(params.get("tsecond")[i].equals("submit"))
					{
						curCriterion = Restrictions.between("date",sdf.parse(String.join(" ",dates[0].split("-"))),sdf.parse(String.join(" ",dates[1].split("-"))));
						System.out.println(sdf.parse(String.join(" ",dates[0].split("-"))));
						System.out.println(sdf.parse(String.join(" ",dates[1].split("-"))));
						r.add(curCriterion);
					}
					else
					{
						curCriterion = Restrictions.ge("qsdate",sdf.parse(String.join(" ",dates[0].split("-"))));	
						curCriterion1 = Restrictions.le("jzdate",sdf.parse(String.join(" ",dates[1].split("-"))));
						tempconjunction.add(curCriterion);
						tempconjunction.add(curCriterion1);
						r.add(tempconjunction);							
					}
				}					
                if((i+1)<params.get("tfirst").length)//接不
                {				                 
					if(params.get("tfirst")[i+1].equals("or"))
					{
						o.add(disjunction);
					}
                    else
					{
						o.add(conjunction);
					}                  	
                }
                else
				{                	
					getQuery(o, r);
				}					
            }          
        }
	    
	    if(r.size()>=1)
	    {
	    	criteria.add(r.get(0));	 
	    	System.out.println(r.get(0));
	    }	        				
		
		Long num = (Long) criteria.setProjection(Projections.rowCount())
                                  .uniqueResult();			
		System.out.println("totalrows:"+num);
		return num==null?0:num.intValue();
	}

    public DemandInfo getById(String id)
    {
    	String hql = "FROM DemandInfo e LEFT OUTER JOIN FETCH e.userBean WHERE e.id = ?";
    	Query query = getSession().createQuery(hql).setString(0,id);
		DemandInfo demandInfo = (DemandInfo) query.uniqueResult();
	    if(demandInfo!=null)
	    {
	    	System.out.println(demandInfo.getDemandname());
	    }
	    else
	    {
	    	System.out.println("空");
	    }
		return demandInfo;
    }
}
