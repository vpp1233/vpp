package com.vanphongpham.controller.Authorization;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.service.AuthorizationService;
import com.vanphongpham.util.RoleConstants;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {
	private AuthorizationService authorizationService = new AuthorizationService();

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);
		String userRole = RoleConstants.GUEST;
		if(session != null && session.getAttribute("role") != null)
			userRole = String.valueOf(session.getAttribute("role"));
		
		String loginURI = httpRequest.getContextPath() + "/login";
		String registerURI = httpRequest.getContextPath() + "/register";
		String logoutURI = httpRequest.getContextPath() + "/logout";
		String requestURI = httpRequest.getRequestURI();
		String contextPath = httpRequest.getContextPath();

		boolean loggedIn = session != null && session.getAttribute("userId") != null;
		
		// Cho phép truy cập đến /login & /register mà không cần đăng nhập
		boolean loginRequest = ((requestURI.equals(loginURI)) || (requestURI.equals(registerURI)));

		// Cho phép truy cập đến / mà không cần đăng nhập
		boolean webRequest = requestURI.endsWith("/vanphongpham/");
		
		boolean resourceRequest = requestURI.endsWith(".css") || requestURI.endsWith(".jsp");
		
		if(!webRequest && !loginRequest && !resourceRequest)	{	
			String path = requestURI.substring(httpRequest.getContextPath().length());
			if (authorizationService.author(userRole, path)) {
				chain.doFilter(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/views/authorization/access-denied.jsp");
				rd.forward(request, response);
			}
		}else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}
}
