package controller.Tpay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TroomDAO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TPayAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward = null;
		
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		
		TroomVO data=trdao.selectOne(trvo);
		
		forward=new TActionForward();
		forward.setPath("/pay.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
