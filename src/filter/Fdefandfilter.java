package filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class defandfilter
 */
//@WebFilter(urlPatterns={"/*"},servletNames={"/*"})
public class Fdefandfilter implements Filter {

    /**
     * Default constructor. 
     */
    public Fdefandfilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain		
		HttpServletRequest req=(HttpServletRequest)request;    
        HttpServletResponse res=(HttpServletResponse)response;    
         //获得所有请求参数名    
        Enumeration params = req.getParameterNames();    
        String sql = "";    
        while (params.hasMoreElements()) {    
            //得到参数名    
            String name = params.nextElement().toString();    
            //System.out.println("name===========================" + name + "--");    
            //得到参数对应值    
            String[] value = req.getParameterValues(name);    
            for (int i = 0; i < value.length; i++) {  
            	//System.out.println(value[i]);
                sql = sql + value[i];    
            }    
        }    
        //System.out.println("============================SQL"+sql);    
        //有sql关键字，跳转到error.html    
        if (sqlValidate(sql)) {  
            throw new IOException("您发送请求中的参数中含有非法字符："+sql);    
            //String ip = req.getRemoteAddr();    
        } else {    
            chain.doFilter(request,response);    
        }    
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	//效验    
    protected static boolean sqlValidate(String str) {    
        String str1 = str.toLowerCase();//统一转为小写    
        String badStr = "'|select|update|and|or|delete|insert|truncate|char|into"  
                + "|substr|declare|exec|master|drop|execute|"  
                + "union|;|--|+|like|%|#|*|$|\"|cr|lf|<|>|(|)";//过滤掉的sql关键字，可以手动添加    
        /*String badStr = "'|select|update|and|or|delete|insert|truncate|char|into"  
                + "|substr|declare|exec|master|drop|execute|"  
                + "union|;|--|+|like|//|/|%|#|*|$|@|\"|http|cr|lf|<|>|(|)";//过滤掉的sql关键字，可以手动添加    */
        String[] badStrs = badStr.split("\\|");    
        for (int i = 0; i < badStrs.length; i++) {    
            if (str1.indexOf(badStrs[i]) >= 0) {    
                return true;    
            }    
        }    
        return false;    
    }    
}
