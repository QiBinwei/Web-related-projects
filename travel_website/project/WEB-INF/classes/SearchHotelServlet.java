import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;
import java.util.regex.Pattern;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.util.List;
import java.util.ArrayList;


public class SearchHotelServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{			
			DB db = mongo.getDB("CSP595HotelReservationTeam19");
			DBCollection hotels = db.getCollection("Hotel");
			BasicDBObject searchQuery = new BasicDBObject();
			List<BasicDBObject> param = new ArrayList<BasicDBObject>();
			param.add(new BasicDBObject("hotelName",  Pattern.compile("\\b"+request.getParameter("startswith"),Pattern.CASE_INSENSITIVE)));
			param.add(new BasicDBObject("city",  Pattern.compile("\\b"+request.getParameter("startswith"),Pattern.CASE_INSENSITIVE)));
			searchQuery.put("$or",param );					
			
			DBCursor cursor = hotels.find(searchQuery);
			
			StringBuilder resultStr = new StringBuilder("");
			
			while(cursor.hasNext()){
				BasicDBObject obj = (BasicDBObject) cursor.next();
				resultStr.append("<a href=\"viewsinglehotel.jsp?hotelId="+obj.getString("hotelId")+"&hotelName="+obj.getString("hotelName")+"&city="+obj.getString("city")+"\">"+obj.getString("hotelName")+", "+obj.getString("city")+"</a><br/><br/>");
			}
			
			response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(resultStr.toString());
		}
		catch (Exception e) {
			
		}
	}
	
}