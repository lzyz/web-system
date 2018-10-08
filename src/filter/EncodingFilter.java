package filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
@WebFilter(
		urlPatterns={"/*"},servletNames={"/*"},
		initParams={
				@WebInitParam(name="encode",value="UTF-8")
				})
public class EncodingFilter implements Filter {
	private FilterConfig config = null;
	private String encode = null;
	public void destroy() {		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//response.setContentType("text/html;charset="+encode); //--�����Ӧ����
		//response.setCharacterEncoding(encode);
		//chain.doFilter(new MyHttpServletRequest((HttpServletRequest)request),response);//--��װ����request�кͻ�ȡ���������صķ�����������������
		request.setCharacterEncoding(encode);
		response.setCharacterEncoding(encode);
		chain.doFilter(request, response);
	}
	
	/*public void init(FilterConfig filterConfig) throws ServletException {		
		this.config = filterConfig;
		encode = config.getInitParameter("encode") == null?"utf-8":config.getInitParameter("encode");
		System.out.println("encode"+config.getInitParameter("encode"));
	}*/
	public void init(FilterConfig fConfig) throws ServletException {
		String encode = fConfig.getServletContext().getInitParameter("encode");
		if(encode!=null&&!"".equals(encode)){
			this.encode = encode;
		}else{
			this.encode = "UTF-8";
		}
	}
	
	public static String getEncoding(String str) {  
        String encode[] = new String[]{  
                "UTF-8",  
                "ISO-8859-1",  
                "GB2312",  
                "GBK",  
                "GB18030",  
                "Big5",  
                "Unicode",  
                "ASCII"  
        };  
        for (int i = 0; i < encode.length; i++){  
            try {  
                if (str.equals(new String(str.getBytes(encode[i]), encode[i]))) {  
                    return encode[i];  
                }  
            } catch (Exception ex) {  
            }  
        }  
          
        return "";  
    }  
	class MyHttpServletRequest extends HttpServletRequestWrapper{
		private HttpServletRequest request = null;
		private boolean isNotEncode = true;
		public MyHttpServletRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}
		
		@Override
		public Map getParameterMap() {
			try{
				if(request.getMethod().equalsIgnoreCase("POST")){//--�����post�ύ,һ�д�����post�ύ�����������
					request.setCharacterEncoding(encode);					
					return request.getParameterMap();
				}else if(request.getMethod().equalsIgnoreCase("GET")){//--�����get�ύ,��Ӧ���ֶ������������
					Map<String,String[]> map = request.getParameterMap();//��ȡ�������map
					if(isNotEncode){//ֻ���ڵ�һ�ν������
						for(Map.Entry<String, String[]> entry : map.entrySet()){//����map,�������ֵ������
							String [] vs = entry.getValue();
							for(int i=0;i<vs.length;i++){																						
								vs[i] = new String(vs[i].getBytes("iso8859-1"),encode);																								
							}
						}
						isNotEncode = false;//����Ϊfalse,�ڶ��ξͲ����ٽ�����������
					}
					return map;
				}else{
					return request.getParameterMap();
				}
			}catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		
		@Override
		public String[] getParameterValues(String name) {			
			return (String[]) getParameterMap().get(name);
		}
		
		@Override
		public String getParameter(String name) {			
			return getParameterValues(name) == null ? null : getParameterValues(name)[0];
		}
		
		
	}
}

