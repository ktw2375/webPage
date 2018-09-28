package board;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/BoardReplyServlet")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 *1024;
		
		String savePath = request.getRealPath("/images").replaceAll("\\\\", "/");
		//String savePath = "D:/project/UserChat/WebContent/upload";
		System.out.println(savePath);
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy()); //각종오류를 처리해줌
		}catch (Exception e) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "파일크기는 10MB를 넘을 수 없습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		String userID = multi.getParameter("userID");
		userID = URLDecoder.decode(userID, "UTF-8");
		HttpSession session = request.getSession();  //세션검증
		if(!userID.equals((String) session.getAttribute("userID"))) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "접근할 수 없습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		String boardID = multi.getParameter("boardID");
		if(boardID == null || boardID.equals("")) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "접근할 수 없습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		String boardTitle = multi.getParameter("boardTitle");
		String boardContent = multi.getParameter("boardContent");
		if(boardTitle == null || boardTitle.equals("") || boardContent == null || boardContent.equals("")) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "내용을 모두 체워주세요.");
			response.sendRedirect("index.jsp");
			return;
		}
		
		String boardFile = "";
		String boardRealFile = "";
		String fileName ="";
		File file = multi.getFile("boardFile");
		if(file != null) {
			boardFile = multi.getOriginalFileName("boardFile");
			boardRealFile = file.getName();
		}
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO parent = boardDAO.getBoard(boardID);
		boardDAO.replyUpdate(parent);
		if(boardDAO.reply(userID, boardTitle, boardContent, boardFile, boardRealFile, parent) == -1) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "디비오류입니다.");
			response.sendRedirect("boardView.jsp");
			return;
			
		}
		session.setAttribute("messageType", "성공 메시지");
		session.setAttribute("messageContent", "성공적으로 답변이 작성되었습니다.");
		response.sendRedirect("boardView.jsp");
		return;
		
	}

}
