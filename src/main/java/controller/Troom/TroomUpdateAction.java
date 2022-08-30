package controller.Troom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TroomDAO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TroomUpdateAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		
		String paramTraddress=request.getParameter("traddress");
		String paramTrregion=request.getParameter("trregion");
		String paramTrname=request.getParameter("trname");
		String paramTrprice=request.getParameter("trpice");
		String paramTrinfo=request.getParameter("trinfo");
		String paramTrpk=request.getParameter("trpk");
		
		trvo.setTraddress(paramTraddress);
		trvo.setTrregion(paramTrregion);
		trvo.setTrname(paramTrname);
		trvo.setTrprice(Integer.parseInt(paramTrprice));
		trvo.setTrinfo(paramTrinfo);
		trvo.setTrpk(Integer.parseInt(paramTrpk));

		if(trdao.update(trvo)) {
			forward=new TActionForward();
			forward.setPath("category.jsp");
			forward.setRedirect(false);
		}else {
			request.setAttribute("errormsg", "숙소 정보 수정 실패");
			System.out.println("log: TroomUpdateAction");
		}
		return forward;
	}

}
