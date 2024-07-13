package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.scoredao;
import bean.score;
/**
 * Servlet implementation class searchscore
 */
@WebServlet("/searchscore")
public class searchscore extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String coursename = req.getParameter("coursename");
        String semester = req.getParameter("semester");
        List<score> scoreList = null;

        if (coursename != null && !coursename.isEmpty()) {
            // 按课程名查询成绩
            try {
                scoreList = scoredao.getScorebycoursename(coursename);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else if (semester != null && !semester.isEmpty()) {
            // 按上下学期查询成绩
            try {
                if (semester.equals("上学期")) {
                    scoreList = scoredao.getUpScore();
                } else if (semester.equals("下学期")) {
                    scoreList = scoredao.getDownScore();
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        req.setAttribute("scoreList", scoreList);
        req.getRequestDispatcher("searchscore.jsp").forward(req, resp);
        //super.doPost(req, resp);
    }
}

