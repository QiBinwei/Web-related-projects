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


public class AddHotelAmenitiesServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form			
			String hotel = request.getParameter("hotel");
			String[] hotelamenitiesArr = request.getParameterValues("hotelamenities");
			String[] roomamenitiesArr = request.getParameterValues("roomamenities");
			String hotelamenities = "";
			String roomamenities = "";
			
			for(int i = 0; i < hotelamenitiesArr.length; i++){
				if(hotelamenities.equals("")){
					hotelamenities = hotelamenitiesArr[i];
				}
				else{
					hotelamenities = hotelamenities+","+hotelamenitiesArr[i];
				}				
			}
			
			for(int i = 0; i < roomamenitiesArr.length; i++){
				if(roomamenities.equals("")){
					roomamenities = roomamenitiesArr[i];
				}
				else{
					roomamenities = roomamenities+","+roomamenitiesArr[i];
				}				
			}
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection hotelAmenities = db.getCollection("HotelAmenities");			
			
				BasicDBObject doc = new BasicDBObject("hotel", hotel).				
				append("hotelamenities", hotelamenities).				
				append("roomamenities", roomamenities);				
					
				hotelAmenities.insert(doc);			
			
				response.sendRedirect(request.getContextPath()+"/viewhotelamenities.jsp");				
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
