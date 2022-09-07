package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class imgupload
 */
@WebServlet("/imgresult")
public class ImgUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 요청정보, 패스정보, 최대사이즈(바이트 단위)
		String path="C:\\0607KEY\\workspace\\TechTrip\\src\\main\\webapp\\images\\crawling\\";
		// 저장될 주소
		
		int maxSize=10 * 1024 * 1024; // 10MB
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,"UTF-8",new MyFileRenamePolicy());

		Enumeration<?> file=mr.getFileNames();
		if(file.hasMoreElements()) {
			String paramName = (String)file.nextElement();
			System.out.println("파라미터명 ["+paramName+"]");
			
			String serverFileName = mr.getFilesystemName(paramName);
			System.out.println("서버에 업로드된 파일명 ["+serverFileName+"]");
			request.getSession().setAttribute("file", serverFileName);
			
			String clientFileName = mr.getOriginalFileName(paramName);
			System.out.println("사용자가 업로드된 파일명 ["+clientFileName+"]");
			
			String fileType=mr.getContentType(paramName);
			System.out.println("파일의 타입 ["+fileType+"]");
			
			long length=mr.getFile(paramName).length();
			System.out.println("파일의 크기 ["+length+"]"); // 바이트단위
			
		}
		response.sendRedirect("hostregister.jsp");
	}

	}

