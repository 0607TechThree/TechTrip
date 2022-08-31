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

		String paramTrregion=request.getParameter("trregion");
		String paramTrname=request.getParameter("trname");

		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();

		trvo.setTrregion(paramTrregion); // 지역 카테고리
		trvo.setTrname(paramTrname); // 이름으로 검색

		//// 없으면 전체 보기
		
		ArrayList<TroomVO> datas = trdao.selectAll(trvo);

		request.setAttribute("datas", datas);

		forward=new TActionForward();
		forward.setPath("/category.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
