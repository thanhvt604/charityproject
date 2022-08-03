package com.myproject.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.myproject.entity.Account;
/**
 * Servlet Filter implementation class Filter
 */
@WebFilter(urlPatterns = { "/management_donate","/manage","/management_campaign","/addcampaign","/updatecampaign","/adduser","/updateuser","/donatemanage"})
public class Filter extends HttpFilter implements javax.servlet.Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public Filter() {
        super();
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
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF8");
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		HttpSession session=req.getSession();
		if(session==null||session.getAttribute("sessionUser")==null)
		{
			res.sendRedirect("login");
		}
		else
		{
			if(((Account) session.getAttribute("sessionUser")).getRole().equals("User"))
			{
				res.sendRedirect("login");
			}
		}
		chain.doFilter(request,response);
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
