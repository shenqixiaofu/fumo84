package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.score;
import bean.student;
import utils.utils;

public class scoredao {
 
    //获取成绩信息列表
    public static List<score> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<score> list = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM score");
            rs = stmt.executeQuery();
            while (rs.next()) {
            	score sc = new score();
            	sc.setId(rs.getInt(1));
            	sc.setStudentnumber(rs.getString(2));
            	sc.setStudentname(rs.getString(3));
            	sc.setCoursename(rs.getString(4));
            	sc.setUpscore(rs.getString(5));
            	sc.setDownscore(rs.getString(6));
                list.add(sc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            utils.release(rs, stmt, conn);
        }
        return list;
    }
 
    //增加成绩信息
    public static void add(score sco) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("insert into score(studentnumber,studentname,coursename,upscore,downscore) values(?,?,?,?,?)");
            //pStmt.setInt(1, cour.getId());
            pStmt.setString(1, sco.getStudentnumber());
            pStmt.setString(2, sco.getStudentname());
            pStmt.setString(3, sco.getCoursename());
            pStmt.setString(4, sco.getUpscore());
            pStmt.setString(5, sco.getDownscore());
            pStmt.executeUpdate();//更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //根据id名删除成绩信息
    public static void delete(int id) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("delete from score where id=?");
            pStmt.setInt(1, id);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //按课程名返回全部成绩对象
    public static score getScore(int id) throws ClassNotFoundException {
        score s = new score();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from score where id=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                s.setStudentnumber(rs.getString("studentnumber"));
                s.setStudentname(rs.getString("studentname"));
                s.setCoursename(rs.getString("coursename"));
                s.setUpscore(rs.getString("upscore"));
                s.setDownscore(rs.getString("downscore"));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
        return s;
    }
    
    //修改成绩功能
    public static void updateScore(score score) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            String sql = "UPDATE score SET coursename=?,upscore=?,downscore=? where id=?";
            stmt = conn.prepareStatement(sql);
            //stmt.setInt(1, score.getId());
            //stmt.setInt(1, score.getNumber());
            //stmt.setString(1, score.getName());
            //stmt.setString(1, score.getStudentnumber());
            //stmt.setString(2, score.getStudentname());
            stmt.setString(1, score.getCoursename());
            stmt.setString(2, score.getUpscore());
            stmt.setString(3, score.getDownscore());
            stmt.setInt(4, score.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
    }
    
    //查询功能，根据模糊查询课程号返回所有学生信息
    public static List<score> getScorebycoursename(String coursename) throws ClassNotFoundException    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<score> allScore = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from score where coursename like ?");
            stmt.setString(1, "%" + coursename + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                score sc = new score();
                sc.setId(rs.getInt(1));
                sc.setStudentnumber(rs.getString(2));
                sc.setStudentname(rs.getString(3));
                sc.setCoursename(rs.getString(4));
                sc.setUpscore(rs.getString(5));
                sc.setDownscore(rs.getString(6));
                allScore.add(sc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }   finally {
            utils.release(rs, stmt, conn);
        }
        return allScore;
    }
    
    //查询功能，查询上学期所有学生成绩
    public static List<score> getUpScore() throws ClassNotFoundException    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<score> upScore = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select id,studentnumber,studentname,coursename,upscore from score");
            rs = stmt.executeQuery();
            while (rs.next()) {
                score sc = new score();
                sc.setId(rs.getInt(1));
                sc.setStudentnumber(rs.getString(2));
                sc.setStudentname(rs.getString(3));
                sc.setCoursename(rs.getString(4));
                sc.setUpscore(rs.getString(5));
                upScore.add(sc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }   finally {
            utils.release(rs, stmt, conn);
        }
        return upScore;
    }
    
    //查询功能，查询下学期所有学生成绩
    public static List<score> getDownScore() throws ClassNotFoundException    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<score> downScore = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select id,studentnumber,studentname,coursename,downscore from score");
            rs = stmt.executeQuery();
            while (rs.next()) {
                score sc = new score();
                sc.setId(rs.getInt(1));
                sc.setStudentnumber(rs.getString(2));
                sc.setStudentname(rs.getString(3));
                sc.setCoursename(rs.getString(4));
                sc.setDownscore(rs.getString(5));
                downScore.add(sc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }   finally {
            utils.release(rs, stmt, conn);
        }
        return downScore;
    }
}
 
