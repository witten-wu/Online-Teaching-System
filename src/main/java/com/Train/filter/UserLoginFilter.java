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


@WebFilter({ "/UserLoginFilter","/chooseCourse.jsp","/chooseCourse2.jsp","/checkUserInfo.jsp","/alterUserInfo.jsp","/myApplication.jsp","/MyQuestion.jsp","/newApplication.jsp","/myCommunity.jsp","/myCourses.jsp","/myCourses2.jsp","/myCourses3.jsp","/alterPassword.jsp","/takeExam.jsp","/checkGrade.jsp","/TeacherHomepage.jsp","/addCommunity.jsp","/deleteCommunity.jsp","/alterCommunity.jsp","/checkAllCommunity.jsp","/addExam.jsp","/alterExam.jsp","/checkAllUser.jsp","/addFile.jsp","/deleteFile.jsp","/alterFile.jsp","/addUser.jsp"})
public class UserLoginFilter implements Filter {
	
    public UserLoginFilter() {
    }
    
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse httpResponse=(HttpServletResponse) response;
		httpResponse.setContentType("text/html;charset=utf-8");
		String itemName=request.getServletContext().getContextPath();
		User user = (User) req.getSession().getAttribute("user");
		if(user==null){
			response.getWriter().print("您还没有登录!");
			String path=itemName+"/homepage.jsp";
			httpResponse.setHeader("Refresh", "0.5;URL="+path);
			return;
		}
		if(user.getGrade()==2){
			response.getWriter().print("您是管理员，没有此类信息");
			String path=itemName+"/homepage.jsp";
			httpResponse.setHeader("Refresh", "0.5;URL="+path);
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
