package controller.user.challengeList;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.commons.io.IOUtils;

import dto.Challenge;
import dto.ChallengeCategory;
import service.user.challenge.face.ChallengeService;
import service.user.challenge.impl.ChallengeServiceImpl;

@WebServlet("/user/challenge/new")
public class newChallengeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ChallengeService challengeService = new ChallengeServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    	System.out.println("chllenge/new - [GET]");
    	//카테고리 번호 요청받아 저장하기
    	ChallengeCategory number = challengeService.getCategory(req);
    	//파라미터로 카테고리 정보 불러오기
    	ChallengeCategory info = challengeService.getCategoryInfo(number);
    	// view에 카테고리 정보 전송하기
    	req.setAttribute("ca_title", info);
    	
    	//현재 페이지 정보 가져오기(페이징)
    	String param = req.getParameter("curPage");
    	int curPage = 0;
    	if(param!=null && !param.equals("")) {
    		curPage = Integer.parseInt(param);
    	}
    	
    	//신규챌린지 카테고리별 리스트 가져오기
    	List<Challenge> list = challengeService.getNewChallenges(number, curPage);
    	//리스트 속성 전달
    	req.setAttribute("newChallenges", list);
    	
    	
    	req.getRequestDispatcher("/WEB-INF/views/ChallengeList/newChallenge.jsp").forward(req, resp);
    	
    }
}
