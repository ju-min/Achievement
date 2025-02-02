package controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;
import dto.Mypage;
import service.member.face.MypageService;
import service.member.impl.MypageServiceImpl;


@WebServlet("/mypage/overlap/email")
public class MypageEmailOverlapController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// memberService 공용 객체
	private MypageService mypageService = new MypageServiceImpl();
	Member member= null;
	Mypage mypage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("------ [MypageEmailOverlapController] Do Get ------");
		HttpSession session = req.getSession(); // 세션 객체 생성
		
		// 세션에서 유저정보를 가져온다
		Member member = (Member)session.getAttribute("memberInfo");
		
		System.out.println(req.getParameter("email"));
		
		int check = 0;	
		//이메일 중복값 체크하는 메소드 
		// 2면 기존 이메일과 동일 1 이면 존재 0이면 없음
		check = mypageService.checkOverlapEmail(req, member);
	
//		req.setAttribute("data", check); // 확인된 값 파라미터로 다시 전달
		req.setAttribute("check", check); // 확인된 값 파라미터로 다시 전달
		req.getRequestDispatcher("/WEB-INF/views/mypage/overlap/overlapEmail.jsp")
		   .forward(req, resp);
	}
	
}
