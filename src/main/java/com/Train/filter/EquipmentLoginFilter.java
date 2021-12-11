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

@WebFilter({ "/EquipmentLoginFilter", "/resetPassword.jsp","/forgetPassword.jsp"  })
public class EquipmentLoginFilter implements Filter {

    public EquipmentLoginFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse httpResponse=(HttpServletResponse) response;
		httpResponse.setContentType("text/html;charset=utf-8");
		User user = (User) req.getSession().getAttribute("user");
		String itemName=request.getServletContext().getContextPath();
		
		if(user!=null){
			response.getWriter().print("只有未登录人员才能借此修改密码");
			String path=itemName+"/homepage.jsp";
			httpResponse.setHeader("Refresh", "0.5;URL="+path);
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
