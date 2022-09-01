package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SmsDAO;
import VO.SmsVO;

/**
 * Servlet implementation class CheckSmsAction
 */
@WebServlet("/checkSms.do")
public class CheckSmsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckSmsAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SmsVO vo = new SmsVO();
		SmsDAO dao = new SmsDAO();
		
		vo.setChecknum(request.getParameter("randNum"));
		vo.setUsernum(request.getParameter("checkNum"));
		
		int result = dao.smsCheck(vo);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(result+"");
		
	}

}
