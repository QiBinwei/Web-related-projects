/*
 * creatAccountServlet.java
 *
 */
 

import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.ecs.*;
import org.apache.ecs.html.*;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.zip.ZipOutputStream;
import java.util.zip.GZIPOutputStream;

public class creatAccountServlet extends HttpServlet {
   

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        // get compression support
        String encodings = request.getHeader("Accept-Encoding");
        String footer;
        ByteArrayOutputStream bstream = new ByteArrayOutputStream(1024);
        // the eventual stream that will be used
        OutputStream ostream;
        
        response.setContentType("text/html");
        if(encodings != null && 
            encodings.indexOf("gzip") != -1) {
            footer = "GZIP compressed";    
            ostream = new GZIPOutputStream(bstream);
            response.setHeader("Content-Encoding", "gzip");
        } else if(encodings != null &&
            encodings.indexOf("compress") != -1) {
            footer = "ZIP compressed";
            ostream = new ZipOutputStream(bstream);
            response.setHeader("Content-Encoding", "compress");
        } else {
            footer = "Non-compressed";
            ostream = bstream;
        }
        // instead of writing to the outputstream of the response
        // directly, write to a PrintWriter first, which is either
        // a ByteArray, GZIP, or Zip OutputStream.
        java.io.PrintWriter out = new PrintWriter(ostream);
        
        // format the response
        Table table = new Table();
        table.setBorder(1)
            .setCellPadding(2)
            .setCellSpacing(0);
        Html html = new Html()
            .addElement(new Head()
                .addElement(new Title("Account Servlet"))
                .addElement(table));
        /* format a nice response */
        table.addElement(new TR()
            .addElement(new TD()
                .setColSpan(2)
                .addElement( new H1()
                    .addElement("Thank you for submitting your account"))));
        /* now add the data */
        table.addElement(new TR()
            .addElement(new TD()
                .setColSpan(2)
                .addElement("You submitted the following information:")))
            .addElement(new TR()
                .addElement(new TD()
                    .addElement("Name"))
                .addElement(new TD()
                    .addElement(request.getParameter("userid") + " " +
                            request.getParameter("pasword") + " " +
                            request.getParameter("name") + " " +
                            request.getParameter("email")+" " +
                            request.getParameter("phonenumber"))))
            .addElement(new TR()
                .addElement(new TD()
                    .addElement("Address"))
                .addElement(new TD()
                    .addElement(request.getParameter("address") + "<br/>" +
                                request.getParameter("city") + ",&nbsp;" +
                                request.getParameter("state") + "&nbsp;&nbsp;" +
                                request.getParameter("zip"))))
            .addElement(new TR()
                .addElement(new TD()
                    .addElement("Payment"))
                .addElement(new TD()
                    .addElement(request.getParameter("creditcard") + "<br/> which is a " +
                                request.getParameter("ca_type") + request.getParameter("cvv2number"))));
        
        /* the compression data */
        html.addElement(new I()
            .addElement(new Font()
                .setColor(HtmlColor.blue)
                .addElement(footer)));
        
        out.println(html.toString());
        out.close();
        int len = bstream.size();
        response.setContentLength(len);
        bstream.writeTo(response.getOutputStream());
    } 

    /** Handles the HTTP <code>GET</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    } 

    /** Handles the HTTP <code>POST</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

}
