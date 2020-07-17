package com.simple.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.service.TodoService;
import com.simple.service.UserService;
import com.simple.util.NumberUtil;
import com.simple.util.StringUtil;
import com.simple.vo.Todo;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class TodoController {

	private TodoService todoService = new TodoService();
	private UserService userService = new UserService();
	private JSONView jsonView = new JSONView();
	
	/*
	 * 신규회원 가입
	 * 요청방식 : POST
	 * 요청파라미터 : id, name, pwd, email
	 * 응답 : 
	 * 		{status:"success", username:"홍길동"}
	 * 		{status:"fail", message:"동일한 아이디가 이미 사용중입니다."}
	 */
	@RequestMapping("/register.hta")
	public ModelAndView registerUser(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String password = req.getParameter("pwd");
			String email = req.getParameter("email");
			
			User user = new User();
			
			user.setId(id);
			user.setName(name);
			user.setPassword(password);
			user.setEmail(email);
			
			userService.addNewUser(user);
			
			dataMap.put("status", "success");
			dataMap.put("username", name);
		} catch (Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", "동일한 아이디가 이미 사용중입니다.");
		}
		
		return mav;
	}
	
	/*
	 * 요청방식 : POST
	 * 요청파라미터 : userid, userpwd
	 * 응답
	 * 		{status:"success", username:"홍길동"}
	 * 		{status:"fail", message:"아이디 혹은 비밀번호가 올바르지 않습니다."}
	 */
	@RequestMapping("/login.hta")
	public ModelAndView loginUser(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			String userId = StringUtil.nullToBlank(req.getParameter("userid"));
			String password = StringUtil.nullToBlank(req.getParameter("userpwd"));
			
			User user = userService.getLoginUser(userId, password);
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", user);
			
			dataMap.put("status", "success");
			dataMap.put("username", user.getName());
		} catch (Exception e) {
			dataMap.put("status", "fail");
			dataMap.put("message", "아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		
		return mav;
	}
	
	/*
	 * 요청방식 : GET
	 * 요청파라미터 : 없음
	 * 응답
	 * 		{status:"success"}
	 */
	@RequestMapping("/logout.hta")
	public ModelAndView logoutUser(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		System.out.println("logout.hta 실행됨");
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		dataMap.put("status", "success");
		
		return mav;
	}
	
	/*
	 * 요청방식 : GET
	 * 요청파라미터 : 없음
	 * 응답
	 * 		{status:"success", todos:[{no:1,title:"장보기"....},{},{}]}
	 */
	@RequestMapping("/mytodos.hta")
	public ModelAndView myTodos(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("loginUser");
			
			if (user == null) {
				dataMap.put("status", "fail");
				dataMap.put("message", "no user");
			} else {
				dataMap.put("status", "success");
				dataMap.put("todos", todoService.getMyTodoList(user.getId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("status", "fail");
			dataMap.put("message", "service Error");
		}
		
		
		return mav;
	}
	
	/*
	 * 요청방식 : GET
	 * 요청파라미터 : todono
	 * 응답
	 * 		{status:"success", todo:{no:1, title:"장보기", ...}}
	 */
	@RequestMapping("/todo.hta")
	public ModelAndView todoDetail(HttpServletRequest req, HttpServletResponse  resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		int todoNo = NumberUtil.stringToInt(req.getParameter("todono"));
		
		dataMap.put("status", "success");
		dataMap.put("todo", todoService.getTodoDetail(todoNo));
		
		return mav;
	}
	
	/*
	 * 요청방식 : POST
	 * 요청파라미터 : name, content, day
	 * 응답
	 * 		{status:"success", todo:{no:1, title:"장보기", ...}}
	 */
	@RequestMapping("/addtodo.hta")
	public ModelAndView addTodo(HttpServletRequest req, HttpServletResponse  resp) 
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		String title = StringUtil.nullToBlank(req.getParameter("title"));
		String content = StringUtil.nullToBlank(req.getParameter("content"));
		Date day = new SimpleDateFormat().parse(req.getParameter("day"));
		
		Todo todo = new Todo();
		todo.setTitle(title);
		todo.setContent(content);
		todo.setDay(day);
		
		dataMap.put("status", "success");
		dataMap.put("todo", todoService.addNewTodo(todo));
		
		
		return mav;
	}
	
	/*
	 * 요청방식 : POST
	 * 요청파라미터 : no, title, content, day, status
	 * 응답
	 * 		{status:"success", todo:{no:1, title:"장보기", ...}}
	 */
	@RequestMapping("/modifytodo.hta")
	public ModelAndView modifyTodo(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap); 
		
		int todoNo = NumberUtil.stringToInt(req.getParameter("todono"));
		String title = StringUtil.nullToBlank(req.getParameter("title"));
		String content = StringUtil.nullToBlank(req.getParameter("content"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date day = sdf.parse(req.getParameter("day"));
		String status = StringUtil.nullToBlank(req.getParameter("status"));
		
		Todo todo = todoService.getTodoDetail(todoNo);
		todo.setTitle(title);
		todo.setContent(content);
		todo.setDay(day);
		todo.setStatus(status);
		if ("처리완료".equals(status)) {
			todo.setCompletedDay(new Date());
		}
		
		dataMap.put("status", "success");
		dataMap.put("todo", todoService.updateTodo(todo));
		
		return mav;
	}
}










