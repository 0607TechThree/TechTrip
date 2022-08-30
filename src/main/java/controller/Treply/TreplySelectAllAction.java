package controller.Treply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreplyDAO;
import VO.TreplyVO;
import controller.TActionForward;
import controller.TInterface;

public class TreplySelectAllAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreplyDAO trdao=new TreplyDAO();
		TreplyVO trvo=new TreplyVO();
		
		ArrayList<TreplyVO> datas = trdao.selectAll(trvo);
		request.setAttribute("datas", datas);

		forward=new TActionForward();
		forward.setPath("troomdetail"+"trpk"+".jsp");
		forward.setRedirect(false);
		return forward;
	}

}
