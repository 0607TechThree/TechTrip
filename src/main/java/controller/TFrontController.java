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
import controller.Tcart.TcartlistAction;
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
import controller.Tuser.LoginAction;
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
		
		if(command.equals("/main.do")) {// ???????????? ??????
			try {
				forward = new MainAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//tbook
		else if(command.equals("/tbookdelete.do")) {// ????????????????????? ????????? ?????? ??????
			try {
				forward = new TbookDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tbookinsert.do")) {// ?????? detail?????? ????????????
			try {
				forward = new TbookInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tbookselectall.do")) {// ????????????????????? ????????? ?????? ?????? ?????? ??????
			try {
				forward = new TbookSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tbookupdate.do")) {// ??????X
			try {
				forward = new TbookUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Treply
		else if(command.equals("/treplydelete.do")) {// ?????? detail?????? ????????? ?????? ??????
			try {
				forward = new TreplyDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treplyinsert.do")) {// ?????? detail?????? ????????? ?????? ??????
			try {
				forward = new TreplyInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treplyselectall.do")) {// ?????? detail?????? ?????? ?????? ??????
			try {
				forward = new TreplySelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treplyupdate.do")) {// ?????? detail?????? ?????? ??????
			try {
				forward = new TreplyUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Treview
		else if(command.equals("/treviewdelete.do")) {// ?????? detail?????? ?????? ??????
			try {
				forward = new TreviewDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewinsert.do")) {// ?????? detail?????? ?????? ??????
			try {
				forward = new TreviewInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewselectall.do")) {// ?????? detail?????? ?????? ?????? ??????
			try {
				forward = new TreviewSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewselectone.do")) {// ?????? detail?????? ?????? 1??? ??????
			try {
				forward = new TreviewSelectOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewupdatem.do")) {// ?????? detail?????? ?????? ?????? ??????
			try {
				forward = new TreviewUpdateMAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/treviewupdates.do")) {// ?????? detail?????? ?????? ?????? ??????
			try {
				forward = new TreviewUpdateSAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Troom
		else if(command.equals("/troominsert.do")) {// hostregister.jsp?????? ?????? ??????
			try {
				forward = new TroomInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/troomselectall.do")) {// host??? mypage.jsp?????? ????????? ???????????? ?????? ?????? ??????
			try {
				forward = new TroomSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/troomselectone.do")) {// host??? mypage.jsp?????? ????????? ???????????? ?????? ??? ?????? ??????
			try {
				forward = new TroomSelectOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/troomupdate.do")) {// ??? host??? mypage.jsp?????? ????????? ???????????? ?????? ??????(0??? ??????)
			try {
				forward = new TroomUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Tuser
		else if(command.equals("/tuserinsert.do")) {// join.jsp?????? ????????????
			try {
				forward = new TuserInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/snslogin.do")) {// ????????????????????? ???????????? ?????? ???????????? ????????? ???????????? ?????? ??????
			try {
				forward = new SNSLoginAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/login.do")) {// ????????????????????? ???????????? ?????? ???????????? ????????? ???????????? ?????? ??????
			try {
				forward = new LoginAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/tuserselectone.do")) {// ????????????
			try {
				forward = new TuserSelectOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tuserlogout.do")) {// ????????????
			try {
				forward = new TuserLogoutAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/tuserupdate.do")) {// mypage.jsp?????? ?????? ?????? ??????
			try {
				forward = new TuserUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/mypage.do")) {// mypage.jsp?????? ?????? ?????? ??????
			try {
				forward = new MypageAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//Twish
		else if(command.equals("/twishdelete.do")) {// mypage.jsp?????? ?????? ?????? ??????
			try {
				forward = new TwishDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/twishinsert.do")) {// ?????? detail?????? ??? ??????
			try {
				forward = new TwishInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/twishselectall.do")) {// mypage.jsp?????? ?????? ?????? ?????? ?????? ??????
			try {
				forward = new TwishSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//cart
		else if(command.equals("/cart.do")) { // ???????????? ????????? ??????
			try {
				forward = new TcartlistAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/tcartinsert.do")) { // ???????????? ??????
			try {
				forward = new TcartInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/tcartdelete.do")) { // ???????????? ??????
			try {
				forward = new TcartDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/tcartinsert.do")) { // ???????????? ??????
			try {
				forward = new TcartInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//pay
		else if(command.equals("/tpay.do")) { // pay.jsp??? ??????
			try {
				forward = new TPayAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward==null) { // forward == null ?????? ????????????
			forward=new TActionForward();
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
			RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());	
			dispatcher.forward(request, response);
		}else{ // ?????? ????????? ?????? ???
			if(forward.isRedirect()) { // ????????? ????????? ??????.	
				response.sendRedirect(forward.getPath());
			}
			else { // ?????? ?????? ????????? ??????
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());	
				dispatcher.forward(request, response);
			}
		}

	}
}