package controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.board.face.PostService;
import service.board.impl.PostServiceImpl;

/**
 * Servlet implementation class PostDeleteController
 */
@WebServlet("/board/delete")
public class PostDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImpl();
    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		postService.DeletePost(request);
		
		
		response.sendRedirect("/board/3");
	}

}
