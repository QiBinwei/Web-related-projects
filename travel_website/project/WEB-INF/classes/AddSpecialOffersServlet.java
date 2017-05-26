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


public class AddSpecialOffersServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				System.out.println("in special offer servlet");
		try{
			//Get the values from the form			
			String offerId = request.getParameter("offerId");			
			String hotel = request.getParameter("hotel");					
			String discountOn= request.getParameter("discountOn");						
			String minNo = request.getParameter("minNo");	
			String percent=request.getParameter("percent");
			String description = request.getParameter("description");													
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection specialOffers = db.getCollection("SpecialOffers");			
			
			BasicDBObject doc = new BasicDBObject("offerId", offerId).				
				append("hotel", hotel).
				append("discountOn", discountOn).
				append("minNo", Integer.parseInt(minNo)).
				append("percent", Integer.parseInt(percent)).		
				append("description", description);				
					
				if(request.getParameter("req")!=null){
					BasicDBObject searchQuery = new BasicDBObject();					
					searchQuery.put(hotel,request.getParameter("hotelID"));
					BasicDBObject updateData = new BasicDBObject("$set",doc);					
					
					specialOffers.update(searchQuery,updateData);
				}	
				else{
					specialOffers.insert(doc);
				}
							
			
				response.sendRedirect(request.getContextPath()+"/managespecialoffers.jsp");				
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
