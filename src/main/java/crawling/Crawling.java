package crawling;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

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

		Document doc=null; 
		Document doc2=null; 

		ArrayList<String> urls = new ArrayList<String>();
		urls.add(url+2012); //서울
		urls.add(url+2041); // 부산
		urls.add(url+2051); // 제주
		urls.add(url+2065); // 경기
		urls.add(url+2071); // 인천
		urls.add(url+2114); // 호남
		urls.add(url+2082); // 강원

		for(int j=0;j<7;j++) {
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

				String str1 = itr1.next().attr("data-original");
				String str2=str1.substring(0, 21);
				String str3=str1.substring(39);
				String str4 = url2+str2+str3; // 이미지 주소
				String str5 = itr2.next().text(); // 이름
				String str6 = itr3.next().text(); // 가격
				String str7 = itr4.next().attr("href"); // 상세주소
				if(str6.length() == 7) {
					str6=str6.substring(0, 6);				
				}else {
					str6=str6.substring(0, 7);	
				}
				//System.out.println(str4);
				System.out.println(str5);
				//vo.setTrname(str5);
				System.out.println(str6);
				//vo.setTrprice(Integer.parseInt(str6));
				System.out.println(str7);

				try {
					doc2=Jsoup.connect(str7).get();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				//System.out.println(doc2);
				try {
					Elements e5=doc2.select(".comment > div");
					Iterator<Element> itr5 = e5.iterator();
					String str8 = itr5.next().text();

					System.out.println(str8); // 사장님 한마디
					//vo.setTrinfo(str8);
				} catch (Exception e) {
					e.printStackTrace();
				}

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
					ImageIO.write(bufferedImage, "jpg", new File("D:\\0607KIM\\workspace\\TechTrip\\src\\main\\webapp\\images\\crawling\\" + fileNm));
				} catch(Exception e) {
					e.printStackTrace();
				}		
			}	
		}
	}
}
