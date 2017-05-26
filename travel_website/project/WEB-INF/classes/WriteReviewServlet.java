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


public class WriteReviewServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form			
			String hotelId= request.getParameter("hotelId");
			String hotelName = request.getParameter("hotelName");
			String roomType = request.getParameter("roomType");
			String price = request.getParameter("price");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String custName = request.getParameter("custName");
			String custCity = request.getParameter("custCity");
			String custState = request.getParameter("custState");
			String custAge = request.getParameter("custAge");
			String gender = request.getParameter("gender");
			String custOccupation = request.getParameter("custOccupation");
			String reviewRating = request.getParameter("reviewRating");
			String reviewDate = request.getParameter("reviewDate");
			String reviewSummary = request.getParameter("reviewSummary");
			String reviewText = request.getParameter("reviewText");
			Double drating = (Double.parseDouble(reviewRating))*20;
			int iRating = drating.intValue();;
			
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection hotelReview = db.getCollection("HotelReviews");			
			
				BasicDBObject doc = new BasicDBObject("hotelId", hotelId).				
				append("hotelName", hotelName).
				append("roomType", roomType).
				append("city", city).
				append("state", state).
				append("price", price).
				append("zip", zip).
				append("custName", custName).	
				append("custCity", custCity).	
				append("custState", custState ).				
				append("custAge", custAge).
				append("gender", gender ).
				append("custOccupation", custOccupation ).
				append("reviewRating", iRating).
				append("reviewDate", reviewDate ).
				append("reviewSummary", reviewSummary ).
				append("reviewText", reviewText );				
					
				hotelReview.insert(doc);					

				
			
				response.sendRedirect(request.getContextPath()+"/viewsinglehotel.jsp?hotelId="+hotelId+"&hotelName="+hotelName);				
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
