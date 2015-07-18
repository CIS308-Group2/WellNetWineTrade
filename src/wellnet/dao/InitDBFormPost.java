package wellnet.dao;

import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.SQLException;

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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		try {
			DBContext context = new DBContext();
			String filePath = context.getScriptFilePath(action);
			context.executeSqlFile(filePath);
			
		} catch (ClassNotFoundException | SQLException | URISyntaxException e) {
			e.printStackTrace();
		}
		
	}

}
