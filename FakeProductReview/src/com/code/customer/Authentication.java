package com.code.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mail.OTP;
import com.db.conn.ConnectionProvider;

@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Authentication() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		
	System.out.println("Hello Servlet");
	response.setContentType("text/html;charset=UTF-8");
	HttpSession session = request.getSession();
	PrintWriter out = response.getWriter();
	
	try{
		String email=session.getAttribute("email").toString();
		System.out.println("Details "+email);
		Connection con = ConnectionProvider.getConnection();
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery("select * from `customer_details` where email='"+email+"'");
		System.out.println(rs);
		if(rs.next()){
			
			String id = rs.getString("id");
			String name = rs.getString("name");
			String p = rs.getString("email");
			email=rs.getString("email");
			
			System.out.println("id: "+id);
			
			if(email.equalsIgnoreCase(p)){
				
				SessionTest.id = rs.getString("id");
				session.setAttribute("name", name);
				session.setAttribute("id", id);
				System.out.println("UserId: "+id);
				session.setAttribute("email", rs.getString("email"));
				System.out.println("name:= "+name);
				session.setAttribute("email", email);
				OTP otp=new OTP();
				String otpe=otp.skKeyGenerate();
				System.out.println(otpe);
				
				com.mail.SendMailSSL sendmail= new com.mail.SendMailSSL();
				String Sub="OTP For Authentcation";
				String Msg="Hello '"+email+"' for login please use OTP for login is:"+otpe;
				session.setAttribute("otpm", otpe);
				sendmail.EmailSending(email, Sub, Msg);
				
				response.sendRedirect("Verify.jsp");
				
			}else{
				
				response.sendRedirect("paymentProcess.jsp?incorrect");
			}	
		}
			
	}catch(Exception e){
e.printStackTrace();
}finally{
		
		out.close();
	}	 
  }
}
