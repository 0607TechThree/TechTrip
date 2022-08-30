package controller.Tuser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TuserDAO;
import VO.TuserVO;
import controller.TActionForward;
import controller.TInterface;

public class TuserInsertAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TuserDAO trdao=new TuserDAO();
		TuserVO tuvo=new TuserVO();
		
		String paramTuid=request.getParameter("tuid");
		String paramTupw=request.getParameter("tupw");
		String paramTurole=request.getParameter("turole");
		String paramTunickname=request.getParameter("tunickname");
		String paramTugender=request.getParameter("tugender");
		String paramTubirth=request.getParameter("tubirth");
		String paramTuph=request.getParameter("tuph");
		String paramTuaddresszipcode=request.getParameter("tuaddresszipcode");
		String paramTuaddress=request.getParameter("tuaddress");
		String paramTuaddressdetail=request.getParameter("tuaddressdetail");
		String paramTunation=request.getParameter("tunation");
		
		tuvo.setTuid(paramTuid);
		tuvo.setTupw(paramTupw);
		tuvo.setTurole(paramTurole);
		tuvo.setTunickname(paramTunickname);
		tuvo.setTugender(paramTugender);
		tuvo.setTubirth(paramTubirth);
		tuvo.setTuph(paramTuph);
		tuvo.setTuaddresszipcode(Integer.parseInt(paramTuaddresszipcode));
		tuvo.setTuaddress(paramTuaddress);
		tuvo.setTuaddressdetail(paramTuaddressdetail);
		tuvo.setTunation(paramTunation);

		if(trdao.insert(tuvo)) {
			forward=new TActionForward();
			forward.setPath("index.jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "숙박시설 추가 실패");
			System.out.println("log: TroomInsertAction");
		}
		return forward;
		
	}

}
