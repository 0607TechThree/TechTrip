package controller.Treview;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreviewDAO;
import VO.TreviewSet;
import VO.TreviewVO;
import controller.TActionForward;
import controller.TInterface;

public class TreviewSelectAllAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreviewDAO trdao=new TreviewDAO();
		TreviewVO trvo=new TreviewVO();
		
		ArrayList<TreviewSet> datas = trdao.selectAll(trvo);
		
		request.setAttribute("datas", datas);

		forward=new TActionForward();
		forward.setPath("/troomdetail.jsp"); //어디로 보낼지?
		forward.setRedirect(false);
		return forward;
	}

}
