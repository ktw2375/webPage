package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserFindServlet")
public class UserFIndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");
		String userID = request.getParameter("userID");
		
		
		if(userID == null || userID.equals("")) {
			response.getWriter().write("-1");
		}else if(new UserDAO2().registerCheck(userID) == 0) {
			try {
				response.getWriter().write(find(userID));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().write("-1");
			}
		}else {
			response.getWriter().write("-1");
		}
		
		
		
	}
	
	public String find(String userID) throws Exception{
		StringBuffer result = new StringBuffer("");
		result.append("{\"userProfile\":\"" + new UserDAO2().getProfile(userID) + "\"}");
		return result.toString();
	}

}
