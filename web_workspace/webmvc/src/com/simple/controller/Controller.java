package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	String process(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}
