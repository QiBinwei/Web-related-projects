import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SignOutServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;	
	
	public void init() throws ServletException{
      	
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			HttpSession session = request.getSession(false);
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
