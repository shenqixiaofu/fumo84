package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.course;
import utils.utils;

public class coursedao {
 
    //获取课程信息列表
    public static List<course> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<course> list = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM course");
            rs = stmt.executeQuery();
            while (rs.next()) {
            	course cour = new course();
            	cour.setId(rs.getInt(1));
            	cour.setCourseno(rs.getString(2));
            	cour.setCoursename(rs.getString(3));
            	cour.setType(rs.getString(4));
            	cour.setPeriod(rs.getString(5));
            	cour.setCredit(rs.getString(6));
                list.add(cour);
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
 
    //增加课程信息
    public static void add(course cour) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("insert into course(courseno,coursename,type,period,credit) values(?,?,?,?,?)");
            //pStmt.setInt(1, cour.getId());
            pStmt.setString(1, cour.getCourseno());
            pStmt.setString(2, cour.getCoursename());
            pStmt.setString(3, cour.getType());
            pStmt.setString(4, cour.getPeriod());
            pStmt.setString(5, cour.getCredit());
            pStmt.executeUpdate();//更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //根据课程号删除课程信息
    public static void delete(int id) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("delete from course where id=?");
            pStmt.setInt(1, id);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //按课程号返回全部课程对象
    public static course getCourse(String courseno) throws ClassNotFoundException {
        course s = new course();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from course where courseno=?");
            stmt.setString(1, courseno);
            rs = stmt.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setCourseno(rs.getString("courseno"));
                s.setCoursename(rs.getString("coursename"));
                s.setType(rs.getString("type"));
                s.setPeriod(rs.getString("period"));
                s.setCredit(rs.getString("credit"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
        return s;
    }
 
    //按课程名返回部分课程对象
    /*public static course getCourse1(String coursename) throws ClassNotFoundException {
        course c = new course();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from course where coursename=?");
            stmt.setString(1, coursename);
            rs = stmt.executeQuery();
            if (rs.next()) {
                //s.setId(rs.getInt("id"));
                c.setCourseno(rs.getString("courseno"));
                c.setCoursename(rs.getString("coursename"));
                c.setType(rs.getString("type"));
                c.setPeriod(rs.getString("period"));
                c.setCredit(rs.getString("credit"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
        return c;
    }*/
    
    //修改课程功能
    public static void updateCourse(course course) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            String sql = "UPDATE course SET courseno=?,coursename=?,type=?,period=?,credit=? where courseno=?";
            stmt = conn.prepareStatement(sql);
            //stmt.setInt(1, course.getId());
            //stmt.setInt(1, course.getNumber());
            //stmt.setString(1, course.getName());
            stmt.setString(1, course.getCourseno());
            stmt.setString(2, course.getCoursename());
            stmt.setString(3, course.getType());
            stmt.setString(4, course.getPeriod());
            stmt.setString(5, course.getCredit());
            stmt.setString(6, course.getCourseno());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
    }
}
 
