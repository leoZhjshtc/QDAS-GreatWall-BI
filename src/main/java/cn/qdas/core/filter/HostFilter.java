/**
 * 
 */
package cn.qdas.core.filter;

import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author leo.Zhou 周钧
 * 2019年10月12日
 */
public class HostFilter implements Filter{
	private static StringBuffer whiteStr = new StringBuffer();
	static {
		try {
			String path=HostFilter.class.getResource("/").getPath();
			File serverWhiteListFile = new File(path+"whiteHostList.txt");
			if(serverWhiteListFile.exists()) {
				InputStreamReader inStream = new InputStreamReader(HostFilter.class.getResourceAsStream("/whiteHostList.txt"));
				int c=0;
				while((c=inStream.read())!=-1){
					whiteStr.append((char)c);
				}
				inStream.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest Hrequest = (HttpServletRequest)request;
	    HttpServletResponse Hresponse = (HttpServletResponse) response;
	    String requestHost=Hrequest.getHeader("Host");
	    if(requestHost !=null && !whiteStr.toString().contains(requestHost)){
	    	Hresponse.setStatus(403);
	    	Hresponse.sendError(403,"访问地址不在白名单中，无法访问！");
	    	return;
	    }
	    chain.doFilter(Hrequest, Hresponse);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
