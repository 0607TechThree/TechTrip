package controller;

public class TActionForward {
	private String path; //어디로 갈지
	private boolean redirect; //어떻게 갈지
	
	public TActionForward() {
		
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
}
