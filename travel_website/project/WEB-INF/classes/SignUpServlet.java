import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;


public class SignUpServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String userId = request.getParameter("userID");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmpassword");
			String phone = request.getParameter("phone");
			String email = request.getParameter("emailId");
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection customerAccount = db.getCollection("CustomerAccount");
			
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("userId", userId);

			DBCursor cursor = customerAccount.find(searchQuery);
			
			if(cursor.hasNext()) {
				response.sendRedirect(request.getContextPath()+"/signup.jsp?error=true");
			}
			else {	
				BasicDBObject doc = new BasicDBObject("firstName", firstName).				
				append("lastName", lastName).
				append("userId", userId).
				append("password", password).
				append("confirmPassword", confirmPassword).
				append("phone", phone).
				append("email", email).
				append("userType", "Customer");
					
				customerAccount.insert(doc);			
			
				request.setAttribute("userId",userId);
				request.getRequestDispatcher("customeraddressandcreditcard.jsp").forward(request,response);				
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
