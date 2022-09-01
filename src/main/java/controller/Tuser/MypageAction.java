package controller.Tuser;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TreviewDAO;
import DAO.TroomDAO;
import DAO.TwishDAO;
import VO.TreviewSet;
import VO.TreviewVO;
import VO.TroomVO;
import VO.TuserVO;
import VO.TwishVO;
import controller.TActionForward;
import controller.TInterface;

public class MypageAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		HttpSession session = request.getSession();
		//boolean flag=true;
		//boolean wflag=true;

		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		TreviewVO trvvo=new TreviewVO();
		TreviewDAO trvdao=new TreviewDAO();
		TwishVO twvo=new TwishVO();
		TwishDAO twdao=new TwishDAO();
		//String paramTrpk=request.getParameter("trpk");
		TuserVO logindata = null;
		
		if(session.getAttribute("logininfo") != null) {
			logindata = (TuserVO)session.getAttribute("logininfo");
		}
		/*
		ArrayList<Integer> cart = (ArrayList<Integer>)session.getAttribute("cart");
		if(cart != null) {
			for(int i=0;i<cart.size();i++) {
				if(cart.get(i) == Integer.parseInt(paramTrpk)) {
					flag=false;
				}
			}
		}
		*/
		twvo.setTupk(logindata.getTupk());
		ArrayList<TwishVO> wishList= twdao.selectAll(twvo);
		ArrayList<TroomVO> wishroom = new ArrayList<TroomVO>();
		if(logindata!=null) {
			if(wishList.size() != 0) {
				for(int i=0;i<wishList.size();i++) {
					trvo.setTrpk(wishList.get(i).getTrpk());
					wishroom.add(trdao.selectOne(trvo));
				}
			}
		}
		//trvvo.setTrpk(Integer.parseInt(paramTrpk));
		//ArrayList<TreviewSet> trdatas = trvdao.selectAll(trvvo);

		//request.setAttribute("flag", flag); // 현재 페이지 상품이 장바구니에 있다면 false
		//request.setAttribute("wflag", wflag); // 현재 페이지 상품이 찜목록에 있다면 false
		//request.setAttribute("trdatas", trdatas); // 리뷰 + 댓글
		request.setAttribute("wishroom", wishroom); // 찜 목록
		forward=new TActionForward();
		forward.setPath("/mypage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
