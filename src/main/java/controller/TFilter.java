package controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class EncFilter
 */
@WebFilter({"*.do" , "*.jsp"})
public class TFilter extends HttpFilter implements Filter {
       
	private String encoding;
	
    /**
     * @see HttpFilter#HttpFilter()
     */
    public TFilter() {
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
		// *.do 요청시 실행
		request.setCharacterEncoding(this.encoding);
		response.setCharacterEncoding(this.encoding);

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException { // 필터 실행시 최초 1회 실행
		this.encoding=fConfig.getServletContext().getInitParameter("encoding");
	}

}