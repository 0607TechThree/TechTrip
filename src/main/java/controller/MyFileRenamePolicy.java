package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

import DAO.TroomDAO;
import VO.TroomVO;

public class MyFileRenamePolicy implements FileRenamePolicy  {

	@Override
	public File rename(File originalFile) {
		TroomVO tvo = new TroomVO();
		TroomDAO tdao = new TroomDAO();
		int nextpk = tdao.maxtrpk(tvo); // 다음 pk값
		
		int dot = originalFile.getName().lastIndexOf(".");
		// 원본 파일명에서 제일 마지막 . 위치
		
		String ext = ""; // 확장자를 저장할 변수
		
		// 파일명에 .이 있으면 찾고, 없으면 찾지 않는다. (없으면 -1반환)
		if(dot != -1) {
			ext = originalFile.getName().substring(dot);
			// hello.jsp --> dot == 5
			// originalFile name에서 5번 인덱스 이전까지 잘라내라.(hello)
			// ext == .jsp
		}
		
		String fileName = nextpk + ext;
		// nextpk(다음 추가될 roompk의 값) + ext(사용자가 업로드한 확장자 명)
		
		return new File(originalFile.getParent(), fileName);
	}
}