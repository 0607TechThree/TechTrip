package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TuserDAO;
import VO.TuserVO;

/**
 * Servlet implementation class Check
 */
@WebServlet("/checkId.do")
public class CheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdAction() {
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
		System.out.println("로그1 ["+request.getParameter("userid")+"]");
		
		TuserDAO dao = new TuserDAO();
		TuserVO vo = new TuserVO();
		vo.setTuid(request.getParameter("userid"));
		int result = dao.checkId(vo);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(result+"");
	}

}
