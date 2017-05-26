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

import java.util.List;
import java.util.ArrayList;


public class BookHotelServlet extends HttpServlet {
	
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
			String roomType = request.getParameter("roomType");
			String checkIn = request.getParameter("checkIn");
			String checkOut = request.getParameter("checkOut");
			String rooms = request.getParameter("rooms");
			String adults = request.getParameter("adults");
			String children = request.getParameter("children");
			String specialNote = request.getParameter("specialNote");
			
			HttpSession session=request.getSession(false);
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection hotelReservation = db.getCollection("HotelReservation");			
			
				BasicDBObject doc = new BasicDBObject("hotelId", hotelId).		
				append("customerId", session.getAttribute("userId")).				
				append("hotelName", hotelName).
				append("roomType", roomType).
				append("checkIn", checkIn).
				append("checkOut", checkOut).
				append("rooms", Integer.parseInt(rooms)).
				append("adults", Integer.parseInt(adults)).	
				append("children", Integer.parseInt(children)).	
				append("specialNote", specialNote);			
							
				hotelReservation.insert(doc);
				
				BasicDBObject searchQuery = new BasicDBObject();
				List<BasicDBObject> param = new ArrayList<BasicDBObject>();
				param.add(new BasicDBObject("customerId", session.getAttribute("userId")));
				param.add(new BasicDBObject("hotelId",hotelId));
				param.add(new BasicDBObject("roomType",roomType));
				param.add(new BasicDBObject("checkIn",checkIn));
				searchQuery.put("$and",param );			
		
				DBCursor cursor = hotelReservation.find(searchQuery);		
				BasicDBObject obj = null;
				if(cursor.hasNext()) {			
					obj = (BasicDBObject) cursor.next();		

				}
				
				response.sendRedirect(request.getContextPath()+"/resconfirmation.jsp?resConfirm="+obj.getObjectId("_id"));
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
