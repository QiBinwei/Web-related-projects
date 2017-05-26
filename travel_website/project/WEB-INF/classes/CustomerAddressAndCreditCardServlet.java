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


public class CustomerAddressAndCreditCardServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form			
			String street1 = request.getParameter("street1");
			String street2 = request.getParameter("street2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			Integer zip = Integer.parseInt(request.getParameter("zipcode"));
			String customerId =  request.getParameter("userId");	
			
			String nameOnCard = request.getParameter("nameOnCard");
			String creditCardNumber = request.getParameter("creditCardNum");
			String creditCardType = request.getParameter("cardType");
			String expirationMonth = request.getParameter("expmonth");
			String expirationYear = request.getParameter("expyear");
			String cvv = request.getParameter("cvvCode");	
			
			HttpSession session=request.getSession(false);  
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection customerPersonalInfo = db.getCollection("CustomerPersonalInfo");
			
			
			BasicDBObject doc = new BasicDBObject("street1", street1).				
			append("street2", street2).
			append("city", city).
			append("state", state).
			append("zip", zip).
			append("customerId", customerId).
			append("nameOnCard", nameOnCard).
			append("creditCardType", creditCardType).
			append("expirationMonth", expirationMonth).
			append("expirationYear", expirationYear).
			append("cvv", cvv).
			append("creditCardNumber", creditCardNumber);
					
			customerPersonalInfo.insert(doc);
				
			if(session.getAttribute("userId")==null){
				session=request.getSession();  
	        	session.setAttribute("userId",customerId);
				session.setAttribute("userType", "Customer");
	        	response.sendRedirect(request.getContextPath()+"/index.jsp");
			}
			
				
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
