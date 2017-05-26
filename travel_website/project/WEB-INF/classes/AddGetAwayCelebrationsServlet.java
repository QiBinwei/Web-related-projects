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


public class AddGetAwayCelebrationsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form			
			String hotelId = request.getParameter("hotelId");
			String hotelName = request.getParameter("hotelName");
			String hallType=request.getParameter("hall");
			String price=request.getParameter("price");
			String capacity=request.getParameter("capacity");
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String imageurl = request.getParameter("imageurl");
			String description = request.getParameter("description");
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection getAwayCeleb = db.getCollection("GetAwayCelebrations");			
			
				BasicDBObject doc = new BasicDBObject("hotelId", hotelId).				
				append("hotelName", hotelName).
				append("hallType",hallType).
				append("price",price).
				append("capacity",capacity).
				append("street", street).
				append("city", city).
				append("state", state).
				append("zip", zip).
				append("phone", phone).
				append("email", email).
				append("imageurl", imageurl).
				append("description", description);				
					
					if(request.getParameter("req")!=null){
						BasicDBObject searchQuery = new BasicDBObject();					
					searchQuery.put("hotelId",hotelId);
					
					BasicDBObject updateData = new BasicDBObject("$set",doc);					
					
					getAwayCeleb.update(searchQuery,updateData);
					}
					else{
					getAwayCeleb.insert(doc);			
					}
			
				response.sendRedirect(request.getContextPath()+"/managegetawaycelebrations.jsp");				
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
