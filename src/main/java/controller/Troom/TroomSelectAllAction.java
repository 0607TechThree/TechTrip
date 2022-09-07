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


		ArrayList<TroomVO> datas;
		if(paramTrregion != null) {
			trvo.setTrregion(paramTrregion); // 지역 카테고리
			datas = trdao.selectAll(trvo);
			request.setAttribute("searchresultr", datas.get(0).getTrregion());
			// 지역 검색시 어떤지역인지를 담아줌
		}else if(paramTrname != null){			
			trvo.setTrname(paramTrname); // 이름으로 검색
			datas = trdao.selectAll(trvo);
			request.setAttribute("searchresultn", paramTrname);
			// 검색으로 조회시 어떤 값을 검색했는지를 담아줌
		}else { // 전체조회
			datas = trdao.selectAll(trvo);
		}
		//// 없으면 전체 보기
		
		
		request.setAttribute("datas", datas);
		System.out.println(datas);
		forward=new TActionForward();
		forward.setPath("/category.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
