package com.Train.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
/**
 * 用户或管理员退出之后点返回对防止缓存的页面进行过滤
 * @author as PiscesTong
 *
 */
@WebFilter({ "/NoCacheFilter", "/*" })
public class NoCacheFilter implements Filter {

    public NoCacheFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse hsr = (HttpServletResponse) response;  
        hsr.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  
        hsr.setHeader("Pragma", "no-cache");  
        hsr.setDateHeader("Expires", 0); 
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
