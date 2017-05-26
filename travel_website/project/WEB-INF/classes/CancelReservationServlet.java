import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;


public class CancelReservationServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;		
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);		
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			HttpSession session = request.getSession(false);
			
			
			String rerservationId= request.getParameter("rerservationId");
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection reservation = db.getCollection("HotelReservation");
			
			BasicDBObject searchQuery = new BasicDBObject();					
			searchQuery.put("customerId",session.getAttribute("userId"));
			
			 DBCursor cursor = reservation.find(searchQuery);
			 BasicDBObject obj = null;
			 
			 while(cursor.hasNext()){
				 obj= (BasicDBObject) cursor.next();	
				 if(obj.getObjectId("_id").toString().equalsIgnoreCase(rerservationId))					 
					 break;							 
			 }	
				
			 BasicDBObject query = new BasicDBObject();
			 query.put("_id", obj.getObjectId("_id"));
			 DBObject dbObj = reservation.findOne(query);
			 reservation.remove(dbObj);	 
			 
			 
			 
			 
			 response.sendRedirect(request.getContextPath()+"/myreservation.jsp");
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
}
