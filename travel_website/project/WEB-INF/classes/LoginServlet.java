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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form			
			String userId = request.getParameter("userID");
			String password = request.getParameter("password");										
			if(!userId.equals("admin"))	{						
				// If database doesn't exists, MongoDB will create it for you
				DB db = mongo.getDB("CSP595HotelReservationTeam19");
			
				// If the collection does not exists, MongoDB will create it for you
				DBCollection userAccount = db.getCollection("CustomerAccount");
			
				BasicDBObject searchQuery = new BasicDBObject();
				List<BasicDBObject> param = new ArrayList<BasicDBObject>();
				param.add(new BasicDBObject("userId", userId));
				param.add(new BasicDBObject("password",password ));
				searchQuery.put("$and",param );			
			
				DBCursor cursor = userAccount.find(searchQuery);
			
				if(cursor.hasNext()) {
					BasicDBObject obj = (BasicDBObject) cursor.next();	
					HttpSession session=request.getSession();  
					session.setAttribute("userId",userId);
		            session.setAttribute("userType", obj.getString("userType"));
					response.sendRedirect(request.getContextPath()+"/index.jsp");					
				}
				else {				
					response.sendRedirect(request.getContextPath()+"/login.jsp?error=true");	
				}
			}
			else{
				if(password.equals("admin")){
					HttpSession session=request.getSession();  
					session.setAttribute("userId",userId);
					session.setAttribute("userType", "admin");
					response.sendRedirect(request.getContextPath()+"/adminhome.jsp");
				}
				else{
					response.sendRedirect(request.getContextPath()+"/login.jsp?error=true");
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
