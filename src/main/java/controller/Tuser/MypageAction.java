package controller.Tuser;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TbookDAO;
import DAO.TreviewDAO;
import DAO.TroomDAO;
import DAO.TwishDAO;
import VO.TbookVO;
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
		
		TbookDAO tbdao=new TbookDAO();
		TbookVO tbvo=new TbookVO();
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		TreviewVO trvvo=new TreviewVO();
		TreviewDAO trvdao=new TreviewDAO();
		TwishVO twvo=new TwishVO();
		TwishDAO twdao=new TwishDAO();
		//String paramTrpk=request.getParameter("trpk");
		TuserVO logindata = null;
		
		// 로그인을 한 상태라면 로그인 정보를 담아줌 (예외가 없다면 로그인 되어있을 것임)
		if(session.getAttribute("logininfo") != null) {
			logindata = (TuserVO)session.getAttribute("logininfo");
		}
		
		// 예약목록
		tbvo.setTupk(logindata.getTupk());
		System.out.println(tbvo);
		ArrayList<TroomVO> booklist = tbdao.selectAll(tbvo);
		System.out.println(booklist);
		//찜목록
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
		
		// 내가 작성한 리뷰
		
		// 내가 등록한 숙소
		
		request.setAttribute("wishroom", wishroom); // 찜 목록
		request.setAttribute("booklist", booklist); // 예약 목록		
		forward=new TActionForward();
		forward.setPath("/mypage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
