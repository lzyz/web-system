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
         //����������������    
        Enumeration params = req.getParameterNames();    
        String sql = "";    
        while (params.hasMoreElements()) {    
            //�õ�������    
            String name = params.nextElement().toString();    
            //System.out.println("name===========================" + name + "--");    
            //�õ�������Ӧֵ    
            String[] value = req.getParameterValues(name);    
            for (int i = 0; i < value.length; i++) {  
            	//System.out.println(value[i]);
                sql = sql + value[i];    
            }    
        }    
        //System.out.println("============================SQL"+sql);    
        //��sql�ؼ��֣���ת��error.html    
        if (sqlValidate(sql)) {  
            throw new IOException("�����������еĲ����к��зǷ��ַ���"+sql);    
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
	//Ч��    
    protected static boolean sqlValidate(String str) {    
        String str1 = str.toLowerCase();//ͳһתΪСд    
        String badStr = "'|select|update|and|or|delete|insert|truncate|char|into"  
                + "|substr|declare|exec|master|drop|execute|"  
                + "union|;|--|+|like|%|#|*|$|\"|cr|lf|<|>|(|)";//���˵���sql�ؼ��֣������ֶ����    
        /*String badStr = "'|select|update|and|or|delete|insert|truncate|char|into"  
                + "|substr|declare|exec|master|drop|execute|"  
                + "union|;|--|+|like|//|/|%|#|*|$|@|\"|http|cr|lf|<|>|(|)";//���˵���sql�ؼ��֣������ֶ����    */
        String[] badStrs = badStr.split("\\|");    
        for (int i = 0; i < badStrs.length; i++) {    
            if (str1.indexOf(badStrs[i]) >= 0) {    
                return true;    
            }    
        }    
        return false;    
    }    
}
