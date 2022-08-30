package controller.Troom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TroomDAO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TroomInsertAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
				
		String paramTrcategory=request.getParameter("trcategory");
		String paramTraddress=request.getParameter("traddress");
		String paramTrregion=request.getParameter("trregion");
		String paramTrname=request.getParameter("trname");
		String paramTrprice=request.getParameter("trpice");
		String paramTrinfo=request.getParameter("trinfo");
		String paramTupk=request.getParameter("tupk");
		String paramCheckin=request.getParameter("checkin");
		String paramCheckout=request.getParameter("checkout");
		
		trvo.setTrcategory(paramTrcategory);
		trvo.setTraddress(paramTraddress);
		trvo.setTrregion(paramTrregion);
		trvo.setTrname(paramTrname);
		trvo.setTrprice(Integer.parseInt(paramTrprice));
		trvo.setTrinfo(paramTrinfo);
		trvo.setTupk(Integer.parseInt(paramTupk));
		trvo.setTrname(paramCheckin);
		trvo.setTrname(paramCheckout);
		
		if(trdao.insert(trvo)) {
			forward=new TActionForward();
			forward.setPath("###.jsp"); //어디로 보낼지?
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "숙박시설 추가 실패");
			System.out.println("log: TroomInsertAction");
		}
		return forward;
	}

}
