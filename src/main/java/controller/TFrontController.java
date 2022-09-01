package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Tbook.TbookDeleteAction;
import controller.Tbook.TbookInsertAction;
import controller.Tbook.TbookSelectAllAction;
import controller.Tbook.TbookUpdateAction;
import controller.Tcart.TcartDeleteAction;
import controller.Tcart.TcartInsertAction;
import controller.Tpay.TPayAction;
import controller.Treply.TreplyDeleteAction;
import controller.Treply.TreplyInsertAction;
import controller.Treply.TreplySelectAllAction;
import controller.Treply.TreplyUpdateAction;
import controller.Treview.TreviewDeleteAction;
import controller.Treview.TreviewInsertAction;
import controller.Treview.TreviewSelectAllAction;
import controller.Treview.TreviewSelectOneAction;
import controller.Treview.TreviewUpdateMAction;
import controller.Treview.TreviewUpdateSAction;
import controller.Troom.TroomInsertAction;
import controller.Troom.TroomSelectAllAction;
import controller.Troom.TroomSelectOneAction;
import controller.Troom.TroomUpdateAction;
import controller.Tuser.MypageAction;
import controller.Tuser.TuserInsertAction;
import controller.Tuser.TuserLogoutAction;
import controller.Tuser.TuserSelectOneAction;
import controller.Tuser.TuserUpdateAction;
import controller.Twish.TwishDeleteAction;
import controller.Twish.TwishInsertAction;
import controller.Twish.TwishSelectAllAction;

/**
 * Servlet implementation class TFrontController
 */
@WebServlet("*.do")
public class TFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDO(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDO(request, response);
	}
	
	private void actionDO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String command = uri.substring(cp.length());
		System.out.println(command);

		TActionForward forward =null;
		
		if(command.equals("/main.do")) {// 메인으로 이동
			try {
				forward = new MainAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//tbook
		else if(command.equals("/tbookdelete.do")) {// 예약페이지에서 예약된 숙소 삭제
			try {
				forward = new TbookDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tbookinsert.do")) {// 숙소 detail에서 예약추가
			try {
				forward = new TbookInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tbookselectall.do")) {// 마이페이지에서 예약한 숙소 정보 모두 출력
			try {
				forward = new TbookSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tbookupdate.do")) {// 사용X
			try {
				forward = new TbookUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Treply
		else if(command.equals("/treplydelete.do")) {// 숙소 detail에서 리뷰의 댓글 삭제
			try {
				forward = new TreplyDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treplyinsert.do")) {// 숙소 detail에서 리뷰에 댓글 추가
			try {
				forward = new TreplyInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treplyselectall.do")) {// 숙소 detail에서 모든 리뷰 표시
			try {
				forward = new TreplySelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treplyupdate.do")) {// 숙소 detail에서 리뷰 수정
			try {
				forward = new TreplyUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Treview
		else if(command.equals("/treviewdelete.do")) {// 숙소 detail에서 리뷰 삭제
			try {
				forward = new TreviewDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewinsert.do")) {// 숙소 detail에서 리뷰 추가
			try {
				forward = new TreviewInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewselectall.do")) {// 숙소 detail에서 리뷰 모두 출력
			try {
				forward = new TreviewSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewselectone.do")) {// 숙소 detail에서 리뷰 1개 출력
			try {
				forward = new TreviewSelectOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewupdatem.do")) {// 숙소 detail에서 리뷰 내용 수정
			try {
				forward = new TreviewUpdateMAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewupdates.do")) {// 숙소 detail에서 리뷰 별점 수정
			try {
				forward = new TreviewUpdateSAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Troom
		else if(command.equals("/troominsert.do")) {// hostregister.jsp에서 숙소 추가
			try {
				forward = new TroomInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/troomselectall.do")) {// host가 mypage.jsp에서 자신이 관리하는 숙소 모두 출력
			try {
				forward = new TroomSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/troomselectone.do")) {// host가 mypage.jsp에서 자신이 관리하는 숙소 중 하나 선택
			try {
				forward = new TroomSelectOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/troomupdate.do")) {// ★ host가 mypage.jsp에서 자신이 관리하는 숙소 삭제(0이 삭제)
			try {
				forward = new TroomUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Tuser
		else if(command.equals("/tuserinsert.do")) {// join.jsp에서 회원가입
			try {
				forward = new TuserInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tuserselectone.do")) {// 로그인용
			try {
				forward = new TuserSelectOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tuserlogout.do")) {// 로그아웃
			try {
				forward = new TuserLogoutAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tuserupdate.do")) {// mypage.jsp에서 유저 정보 수정
			try {
				forward = new TuserUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/mypage.do")) {// mypage.jsp에서 유저 정보 수정
			try {
				forward = new MypageAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Twish
		else if(command.equals("/twishdelete.do")) {// mypage.jsp에서 찜한 숙소 삭제
			try {
				forward = new TwishDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/twishinsert.do")) {// 숙소 detail에서 찜 추가
			try {
				forward = new TwishInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/twishselectall.do")) {// mypage.jsp에서 찜한 숙소 정보 모두 출력
			try {
				forward = new TwishSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//cart
		else if(command.equals("/tcartinsert.do")) { // 장바구니 추가
			try {
				forward = new TcartInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/tcartdelete.do")) { // 장바구니 삭제
			try {
				forward = new TcartDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/tcartinsert.do")) { // 장바구니 추가
			try {
				forward = new TcartInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//pay
		else if(command.equals("/tpay.do")) { // pay.jsp로 이동
			try {
				forward = new TPayAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward==null) { // forward == null 이면 에러발생
			forward=new TActionForward();
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
			RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());	
			dispatcher.forward(request, response);
		}else{ // 에러 발생이 아닐 시
			if(forward.isRedirect()) { // 새로운 요청을 한다.	
				response.sendRedirect(forward.getPath());
			}
			else { // 기존 요청 정보를 유지
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());	
				dispatcher.forward(request, response);
			}
		}

	}
}