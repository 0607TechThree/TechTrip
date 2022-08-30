package controller.Troom;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TroomDAO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TroomSelectAllAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		
		ArrayList<TroomVO> datas = trdao.selectAll(trvo);
		
		request.setAttribute("datas", datas);

		forward=new TActionForward();
		forward.setPath("###.jsp"); //어디로 보낼지?
		forward.setRedirect(false);
		return forward;
	}

}
