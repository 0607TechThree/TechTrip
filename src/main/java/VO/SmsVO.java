package VO;

public class SmsVO {
	private String phone; // 인증번호를 제공받는 핸드폰번호
	private String checknum; // 인증번호
	private String usernum; // 유저가 입력한 인증번호라고 우기는 번호
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getChecknum() {
		return checknum;
	}
	public void setChecknum(String checknum) {
		this.checknum = checknum;
	}
	public String getUsernum() {
		return usernum;
	}
	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}
	
	@Override
	public String toString() {
		return "SmsVO [phone=" + phone + ", checknum=" + checknum + ", usernum=" + usernum + "]";
	}
	
}
