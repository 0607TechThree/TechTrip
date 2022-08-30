package controller.Tbook;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TbookDAO;
import VO.TbookVO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TbookSelectAllAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TbookDAO tbdao=new TbookDAO();
		TbookVO tbvo=new TbookVO();
		
		ArrayList<TroomVO> datas = tbdao.selectAll(tbvo);
		
		request.setAttribute("datas", datas);

		forward=new TActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
