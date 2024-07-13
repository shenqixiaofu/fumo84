package servlet;

import dao.studentdao;
import bean.student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *  /search 是注解也可以在 web.xml中配置servlet
 *
 */

@WebServlet("/searchstudent")
public class searchstudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String number = req.getParameter("number");
        String classno = req.getParameter("classno");
        
        List<student> list = null;

        if (number != null && !number.isEmpty()) {
            try {
				list = studentdao.getStudentList(number);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            req.setAttribute("type", "number");
        } else if (classno != null && !classno.isEmpty()) {
            try {
				list = studentdao.getStudentList1(classno);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            req.setAttribute("type", "classno");
        }

        req.setAttribute("list", list);
        req.getRequestDispatcher("searchstudent.jsp").forward(req, resp);
    
}
}