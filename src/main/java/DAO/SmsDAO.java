package DAO;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import VO.SmsVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsDAO {
	public int sms(SmsVO vo) {
		System.out.println("메서드 들어옴");
		String api_key = "NCSEBHRT5EUVSZMC"; // 회원가입 시 발급받은 api키
		String api_secret = "PIDTGL55DBZ92M8ZCSRD4LOTUHVVOOHJ"; // 회원가입 시 발급받은 secret api키
		Message coolsms = new Message(api_key, api_secret);

		Random rd = new Random();
		int randNum = rd.nextInt(899999)+100000; // 임의로 만든 랜덤 인증번호 

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", vo.getPhone()); //받는 사람 번호
		params.put("from", "01033964894"); //보내는 사람 번호
		params.put("type", "SMS");
		params.put("text", "TechTrip 회원가입 인증번호 ["+randNum+"]");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println("확인");
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return randNum; // 인증번호를 리턴
	}
	
	public int smsCheck(SmsVO vo) {
		
		if(vo.getChecknum().equals(vo.getUsernum())) {
			return 1;
		}else {
			return 0;
		}
	}
}
