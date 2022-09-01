package controller.Troom;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreviewDAO;
import DAO.TroomDAO;
import VO.TreviewSet;
import VO.TreviewVO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TroomSelectOneAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		TreviewVO trvVO=new TreviewVO();
		TreviewDAO trvDAO=new TreviewDAO();
		
		String paramTrpk=request.getParameter("trpk");
		trvo.setTrpk(Integer.parseInt(paramTrpk));
		trvVO.setTrpk(Integer.parseInt(paramTrpk));
		
		TroomVO data=trdao.selectOne(trvo);
		ArrayList<TreviewSet> trdatas = trvDAO.selectAll(trvVO);
		
		System.out.println(data);
		System.out.println(trdatas);
		
		request.setAttribute("data", data); // 상품상세
		request.setAttribute("trdatas", trdatas); // 리뷰 + 댓글
		forward=new TActionForward();
		forward.setPath("/roomdetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
