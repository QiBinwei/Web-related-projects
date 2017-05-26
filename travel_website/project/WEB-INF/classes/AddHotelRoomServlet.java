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


public class AddHotelRoomServlet extends HttpServlet {
	
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
			String roomTitle = request.getParameter("roomTitle");
			String bedType = request.getParameter("bedType");
			String beds = request.getParameter("beds");
			String adults = request.getParameter("adults");
			String children = request.getParameter("children");
			String price = request.getParameter("price");	
			String numOfRooms = request.getParameter("numOfRooms");		
			String imageurl = request.getParameter("imageurl");			
			String description = request.getParameter("description");
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection hotelRoom = db.getCollection("HotelRoom");			
			
				BasicDBObject doc = new BasicDBObject("hotel", hotel).				
				append("roomTitle", roomTitle).
				append("bedType", bedType).
				append("beds", Integer.parseInt(beds)).
				append("adults", Integer.parseInt(adults)).
				append("children", Integer.parseInt(children)).
				append("price", Double.parseDouble(price)).	
				append("numOfRooms", Integer.parseInt(numOfRooms)).	
				append("imageurl", imageurl).				
				append("description", description);				
					
				if(request.getParameter("req")!=null){
					BasicDBObject searchQuery = new BasicDBObject();					
					List<BasicDBObject> param = new ArrayList<BasicDBObject>();
					param.add(new BasicDBObject("hotel",request.getParameter("hotelID")));
					param.add(new BasicDBObject("roomTitle",request.getParameter("hotelRoomTitle")));
					searchQuery.put("$and",param );
					
					BasicDBObject updateData = new BasicDBObject("$set",doc);					
					
					hotelRoom.update(searchQuery,updateData);
				}	
				else{
					hotelRoom.insert(doc);
				}
							
			
				response.sendRedirect(request.getContextPath()+"/viewhotelroom.jsp");				
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
