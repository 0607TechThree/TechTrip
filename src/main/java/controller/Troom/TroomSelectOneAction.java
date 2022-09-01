package controller.Troom;

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
import VO.TwishVO;
import controller.TActionForward;
import controller.TInterface;

public class TroomSelectOneAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		TActionForward forward=null;
		boolean flag=true;

		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		TreviewVO trvVO=new TreviewVO();
		TreviewDAO trvDAO=new TreviewDAO();
		TwishVO twVO=new TwishVO();
		TwishDAO twDAO=new TwishDAO();

		String paramTrpk=request.getParameter("trpk");

		ArrayList<Integer> cart = (ArrayList<Integer>)session.getAttribute("cart");
		if(cart.size() != 0) {
			for(int i=0;i<cart.size();i++) {
				if(cart.get(i) == Integer.parseInt(paramTrpk)) {
					flag=false;
				}
			}
		}

		trvo.setTrpk(Integer.parseInt(paramTrpk));
		trvVO.setTrpk(Integer.parseInt(paramTrpk));
		twVO.setTrpk(Integer.parseInt(paramTrpk));

		TroomVO data=trdao.selectOne(trvo);
		ArrayList<TwishVO> wishList= twDAO.selectAll(twVO);
		ArrayList<TreviewSet> trdatas = trvDAO.selectAll(trvVO);

		System.out.println(data);
		System.out.println(trdatas);
		System.out.println(wishList);

		request.setAttribute("flag", flag); // 상품상세
		request.setAttribute("data", data); // 상품상세
		request.setAttribute("trdatas", trdatas); // 리뷰 + 댓글
		request.setAttribute("wishlist", wishList); // 찜 목록
		forward=new TActionForward();
		forward.setPath("/roomdetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
