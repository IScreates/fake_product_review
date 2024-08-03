package com.code.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.algo.SVM;
import com.db.conn.ConnectionProvider;

@WebServlet("/Feedbackk")
public class Feedbackk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String feedback= request.getParameter("feedback");
		String stars= request.getParameter("stars");
		
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();

		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `feedback`(`email`, `feedback`, `stars`, `status`) VALUES ('"+email+"','"+feedback+"','"+stars+"', 'Fake Review')");
			int result=ps1.executeUpdate();
		
			if(result>0)
    		{
				System.out.println("Record Store Feedback");
				
				PositiveFeedback(email, feedback, stars);
				
				NegativeFeedback(email, feedback, stars);	
    		
    		}
			
			PrintWriter out=response.getWriter();
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Comment Added successfully');");  
			out.println("</script>");
			
			response.sendRedirect("CustomerHome.jsp?Insert");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void PositiveFeedback(String email, String feedback, String stars)
	{
		
		String str=feedback;
		System.out.println("Commentdata="+feedback);
		
		String sentence[]=str.split(" ");
		
		String inputSearch[] = {"good", "best", "better", "high","fast", "awesome", "beautiful", "nice", "smart", "great", 
	    		"like","amazing", "more", "most", "wonderful","cool", "happy", "romantic", "aboud", "accessable","access",
	    		"accurate", "achieve", "adapt", "advantage", "aspire", "available", "award", "balanced", "better", "bless",
	    		"capable", "cheer", "cgeerful", "cool", "correct", "dedicate", "dedicated", "desire", "eager", "effective",
	    		"enjoy", "enjoyed", "exalt", "excallent", "excite", "excited", "faith", "faithful", "faithfully", "superb",
	    		"fantastic", "favorite", "fine", "freedom", "fresh", "fun", "genius", "great", "heaven", "impress","positive"};
		
		int flag=0;
		
		for(int i=0;i<inputSearch.length;i++)
		{
			for(String words:sentence)
			{
				words=words.replaceAll("[-+.^:,!]","");
				
				if(words.equals(inputSearch[i]))
				{
					System.out.println("Found1");
					InsertData(email, feedback, stars, "positive");
					flag++;
				}
				
				if(flag!=0)
					break;		
			}
		}	
	}
	
	
	public void NegativeFeedback(String email, String feedback, String stars)
	{
		
		String str=feedback;
		
		String sentence[]=str.split(" ");
		
		String inputSearch[] = {"medium", "low", "sad", "saddy", "sady", "unlucky", "unhappy",
				"difficult", "confused", "problamatic", "guilty", "boring", "slow", "dislike", 
				"worst", "disgust", "disgusting", "meaningless", "irritated", "angry", "disguisting",
				"fear", "dismood", "excited", "afraid", "tired", "jealous", "breakup", "sorry",
	    		"not", "less", "few", "fewer", "bad", "embrassed","kill","hate", "addict", "addicted",
	    		"suicide", "shock", "amused", "speechless", "missing", "frightened", "aweful", "hatred",
	    		"bug", "cheap", "cheat", "cheater", "confuse", "confused", "defect", "depress", "die", "dirt", 
	    		"dirty", "error", "expire", "Negative"};
		
		int flag=0;
		
		for(int i=0;i<inputSearch.length;i++)
		{
			for(String words:sentence)
			{
				words=words.replaceAll("[-+.^:,!]","");
				
				if(words.equals(inputSearch[i]))
				{
					//System.out.println("Found2");
					InsertData(email, feedback, stars, "negative");
					flag++;
				}
				
				if(flag!=0)
					break;			
			}
		}	
	}
	
	
	public void InsertData(String email, String feedback, String stars, String status)
	{
		try 
		{
			//PreparedStatement ps=con.prepareStatement("insert into tblfeedback(email,feedback,stars,sentiment_sts) values('"+email+"','"+feedback+"','"+stars+"','"+status+"')");	
			PreparedStatement ps=con.prepareStatement("update feedback set sentiment='"+status+"' order by Id DESC limit 1;");
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("Insert Done ");
				SVM svm = new SVM(i, i+1, null);
				svm.startAnalysis();
			}
			else
			{
				System.out.println("Fail Insert ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}