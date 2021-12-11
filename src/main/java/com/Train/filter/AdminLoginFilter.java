package com.Train.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Train.model.User;


@WebFilter({ "/AdminLoginFilter", "/adminHomepage.jsp","/admindeleteCommunity.jsp","/adminalterCommunity.jsp","/admincheckAllCommunity.jsp","/adminalterExam.jsp","/admindeleteFile.jsp","/adminalterFile.jsp","/admincheckAllUser.jsp"})
public class AdminLoginFilter implements Filter {

    public AdminLoginFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse httpResponse=(HttpServletResponse) response;
		httpResponse.setContentType("text/html;charset=utf-8");
		User user = (User) req.getSession().getAttribute("user");
		String itemName=request.getServletContext().getContextPath();
		if(user==null||user.getGrade()!=2) {
			response.getWriter().print("您不是管理员，不能查看此页面");
			String path=itemName+"/homepage.jsp";
			httpResponse.setHeader("Refresh", "0.5;URL="+path);
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
