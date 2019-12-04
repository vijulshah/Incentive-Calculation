package com.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class AuthUser
 */
public class AuthUser implements Filter {

	private String user_pswd = null;
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		try 
		{
			if(request.getParameter("password")!=null)
			{
				user_pswd = request.getParameter("password");	
			}
			Boolean isError = false;
		
			if(!user_pswd.equals("password"))
			{
				isError = true;
				request.setAttribute("user_pswd_error", "please enter a valid password");
			}
			else
			{
				request.setAttribute("user_pswd_isTrue", "Correct Password");
			}
		
			RequestDispatcher rd = null;
			if(isError)
			{
				rd = request.getRequestDispatcher("ClearDB.jsp");
				rd.include(request, response);
			}
			else
			{
				chain.doFilter(request, response);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			((HttpServletResponse) response).sendRedirect("ErrorPage.jsp");
		}
	}

}
