package controller.Troom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TroomDAO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TroomSelectOneAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		
		String paramTupk=request.getParameter("tupk");
		trvo.setTupk(Integer.parseInt(paramTupk));
		
		TroomVO data=trdao.selectOne(trvo);

		request.setAttribute("data", data);
		
		return forward;
	}

}
