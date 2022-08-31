package controller.Tuser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TuserDAO;
import VO.TuserVO;
import controller.TActionForward;
import controller.TInterface;

public class TuserUpdateAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TuserDAO trdao=new TuserDAO();
		TuserVO tuvo=new TuserVO();
				
		String paramTupw=request.getParameter("tupw");
		String paramTurole=request.getParameter("turole");
		String paramTunickname=request.getParameter("tunickname");
		String paramTuph=request.getParameter("tuph");
		String paramTuaddresszipcode=request.getParameter("tuaddresszipcode");
		String paramTuaddress=request.getParameter("tuaddress");
		String paramTuaddressdetail=request.getParameter("tuaddressdetail");
		
		tuvo.setTupw(paramTupw);
		tuvo.setTurole(paramTurole);
		tuvo.setTunickname(paramTunickname);
		tuvo.setTuph(paramTuph);
		tuvo.setTuaddresszipcode(Integer.parseInt(paramTuaddresszipcode));
		tuvo.setTuaddress(paramTuaddress);
		tuvo.setTuaddressdetail(paramTuaddressdetail);
		
		if(trdao.update(tuvo)) {
			forward=new TActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "회원 정보 수정 실패");
			System.out.println("log: TuserUpdateAction");
		}
		return forward;
	}

}
