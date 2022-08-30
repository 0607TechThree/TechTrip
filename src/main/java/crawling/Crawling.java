package crawling;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import DAO.TroomDAO;
import VO.TroomVO;

//서울 2012
//부산 2041
//제주 2051
//경기 2065
//인천 2071
//호남 2114
//강원 2082
public class Crawling {
	public static void main(String[] args) {
		final String url="https://www.goodchoice.kr/product/search/2/";
		final String url2="https:"; // 이미지 주소를 위한 주소
		final String path = "D:\\0607KIM\\workspace\\TechTrip\\src\\main\\webapp\\images\\crawling\\";
		// 크롤링 이미지 저장 될 주소

		Document doc=null; 
		Document doc2=null; 

		ArrayList<String> urls = new ArrayList<String>();
		urls.add(url+2012); // 서울
		urls.add(url+2041); // 부산
		urls.add(url+2051); // 제주
		urls.add(url+2065); // 경기
		urls.add(url+2071); // 인천
		urls.add(url+2114); // 호남
		urls.add(url+2082); // 강원
		
		ArrayList<String> region = new ArrayList<String>();
		region.add("서울"); // 서울
		region.add("부산"); // 부산
		region.add("제주"); // 제주
		region.add("경기"); // 경기
		region.add("인천"); // 인천
		region.add("호남"); // 호남
		region.add("강원"); // 강원
		
		TroomDAO dao = new TroomDAO();
		
		for(int j=0;j<urls.size();j++) {
			try {
				doc=Jsoup.connect(urls.get(j)).get(); 
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//System.out.println(doc);
			Elements e1=doc.select(".pic > img");
			Elements e2=doc.select(".name > strong");
			Elements e3=doc.select(".map_html > p > b");
			Elements e4=doc.select(".list_2.adcno2 > a");
			
			Iterator<Element> itr1 = e1.iterator();
			Iterator<Element> itr2 = e2.iterator();
			Iterator<Element> itr3 = e3.iterator();
			Iterator<Element> itr4 = e4.iterator();

			for(int i=0;i<10;i++) {
				TroomVO vo = new TroomVO();
				
				vo.setTrcategory("hotel"); // 카테고리
				vo.setTrregion(region.get(j)); // 지역
				
				String str1 = itr1.next().attr("data-original");
				String str2=str1.substring(0, 21);
				String str3=str1.substring(39);
				String str4 = url2+str2+str3; // 이미지 주소
				String str5 = itr2.next().text(); // 이름
				String str6 = itr3.next().text(); // 가격
				String str7 = itr4.next().attr("href"); // 상세주소
				
				if(str6.length() == 7) { // 가격		
					String str61=str6.substring(0, 2);				
					String str62=str6.substring(3, 6);				
					//System.out.println(Integer.parseInt(str61+str62));
					vo.setTrprice(Integer.parseInt(str61+str62));
				}else {
					String str61=str6.substring(0, 3);	
					String str62=str6.substring(4, 7);	
					//System.out.println(Integer.parseInt(str61+str62));
					vo.setTrprice(Integer.parseInt(str61+str62));
				}
				
				//System.out.println(str4); // 이미지 주소
				//System.out.println(str5); // 이름
				vo.setTrname(str5);
				//System.out.println(str7); // 상세주소

				try {
					doc2=Jsoup.connect(str7).get();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				//System.out.println(doc2);
				Elements e6=doc2.select(".address");
				Iterator<Element> itr6 = e6.iterator();
				String str9 = itr6.next().text(); // 주소
				//System.out.println(str9); // 주소
				vo.setTraddress(str9);
				try {
					Elements e5=doc2.select(".comment > div");
					Iterator<Element> itr5 = e5.iterator();
					String str8 = itr5.next().text();

					//System.out.println(str8); // 사장님 한마디
					vo.setTrinfo(str8);
				} catch (Exception e) { // 값이 없다면
					//System.out.println("-"); // 사장님 한마디
					vo.setTrinfo("-");
					//e.printStackTrace();
				}
				//// 체크인 체크아웃 
				Random rand = new Random();
				Calendar checkIn = Calendar.getInstance();
				Calendar checkOut = Calendar.getInstance();
				checkIn.setTime(new Date());
				checkOut.setTime(new Date());
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				//System.out.println("current : " + df.format(checkIn.getTime()));
				//System.out.println("current : " + df.format(checkOut.getTime()));

				int checkInR = rand.nextInt(4); // 0~3
				int checkOutR = rand.nextInt(4)+4; // 4~7

				checkIn.add(Calendar.DATE, +checkInR);
				checkOut.add(Calendar.DATE, +checkOutR);
				//System.out.println("after checkIn : " + df.format(checkIn.getTime()));
				vo.setCheckin(df.format(checkIn.getTime())); // 체크인
				//System.out.println("after checkOut : " + df.format(checkOut.getTime()));
				vo.setCheckout(df.format(checkOut.getTime())); // 체크아웃
				
				String imagePath = str4;
				BufferedImage image = null;

				//이미지를 읽어와서 BufferedImage에 넣는다.
				try {
					image = ImageIO.read(new URL(imagePath));
				} catch (MalformedURLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int width = image.getWidth();
				int height = image.getHeight();

				//파일명 자르기
				String fileNm = str5+".jpg";
				try {
					// 저장할 이미지의 크기와 타입을 잡아줌.
					BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
					bufferedImage.createGraphics().drawImage(image, 0, 0, null);

					// 해당경로에 이미지를 저장함.
					ImageIO.write(bufferedImage, "jpg", new File(path + fileNm));
				} catch(Exception e) {
					e.printStackTrace();
				}

				dao.insert(vo);
			}	
		}
		System.out.println("로그 : 샘플 데이터 저장 완료");
	}
}
