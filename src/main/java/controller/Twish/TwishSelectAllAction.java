package controller.Twish;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TwishDAO;
import VO.TwishVO;
import controller.TActionForward;
import controller.TInterface;

public class TwishSelectAllAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TwishDAO twdao=new TwishDAO();
		TwishVO twvo=new TwishVO();
		
		ArrayList<TwishVO> datas = twdao.selectAll(twvo);
		
		request.setAttribute("datas", datas);

		forward=new TActionForward();
		forward.setPath("/mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
