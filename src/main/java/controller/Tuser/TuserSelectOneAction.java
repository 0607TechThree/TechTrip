package controller.Tuser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TuserDAO;
import VO.TroomVO;
import VO.TuserVO;
import controller.TActionForward;
import controller.TInterface;

public class TuserSelectOneAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TuserDAO tudao=new TuserDAO();
		TuserVO tuvo=new TuserVO();
				
		String paramTuid=request.getParameter("tuid");
		String paramTupw=request.getParameter("tupw");
		
		tuvo.setTuid(paramTuid);
		tuvo.setTupw(paramTupw);
		
		TuserVO data=tudao.selectOne(tuvo);

		request.setAttribute("data", data);
		
		return forward;
	}

}
