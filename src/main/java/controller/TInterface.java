package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface TInterface {
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}
