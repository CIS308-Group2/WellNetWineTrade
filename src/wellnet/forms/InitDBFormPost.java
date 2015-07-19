package wellnet.forms;

import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wellnet.DBContext;


/**
 * Servlet implementation class InitDBFormPost
 */
@WebServlet("/InitDBFormPost")
public class InitDBFormPost extends HttpServlet {

	private static final long serialVersionUID = 6772823439096439856L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			DBContext context = new DBContext();
			
			String message = "There was a problem creating and initializing the database. Please <a href='DropPage.jsp'>"
					+ "Drop All Tables</a> and try again. The database may already exist.";
			if(context.initDB()){
				message = "The database was successfully created and initialized with data.";
			}
			request.setAttribute("message", message);
			RequestDispatcher view = request.getRequestDispatcher("initializeResults.jsp");			
			view.forward(request, response);		
			
		} catch (ClassNotFoundException | SQLException | URISyntaxException e) {
			e.printStackTrace();
		}
		
	}

}
