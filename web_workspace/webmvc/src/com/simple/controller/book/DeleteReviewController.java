package com.simple.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.controller.Controller;
import com.simple.dao.ReviewDao;
import com.simple.util.NumberUtil;
import com.simple.vo.Review;
import com.simple.vo.User;

public class DeleteReviewController implements Controller {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		// 로그인되지 않은 사용자는 로그인 폼으로 리다이렉션시킨다.
		if (user == null) {
			return "redirect:../login/form.hta?error=deny";
		}

		// 요청파라미터 값을 조회
		int reviewNo = NumberUtil.stringToInt(req.getParameter("reviewno"));
		
		ReviewDao reviewDao = new ReviewDao();
		Review review = reviewDao.getReviewByNo(reviewNo);
		// 리뷰가 존재하지 않는 경우 책 목록 페이지로 리다이렉션시킨다.
		if (review == null) {
			return "redirect:list.hta";
		}
		// 로그인된 사용자가 작성한 리뷰가 아닌 경우 에러메시지와 함께 책 상세페이지로 리다이렉션시킨다.
		if (!user.getId().equals(review.getUserId())) {
			return "redirect:detail.hta?bookno=" + review.getBookNo() + "&error=deny";
		}
		
		reviewDao.deleteReview(reviewNo);;
		
		return "redirect:detail.hta?bookno=" + review.getBookNo();
	}
}
