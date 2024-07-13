package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.banji;
import utils.utils;
public class banjidao {
	//获取班级信息列表
    public static List<banji> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<banji> list = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM class");
            rs = stmt.executeQuery();
            while (rs.next()) {
            	banji bj = new banji();
            	bj.setId(rs.getInt(1));
            	bj.setCno(rs.getString(2));
            	bj.setClassname(rs.getString(3));
            	bj.setDepartment(rs.getString(4));
            	bj.setCollege(rs.getString(5));
                list.add(bj);
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
 
    //增加班级信息
    public static void add(banji bj) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("insert into class(cno,classname,department,college) values(?,?,?,?)");
            //pStmt.setInt(1, cour.getId());
            pStmt.setString(1, bj.getCno());
            pStmt.setString(2, bj.getClassname());
            pStmt.setString(3, bj.getDepartment());
            pStmt.setString(4, bj.getCollege());
            pStmt.executeUpdate();//更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //根据班级编号删除班级信息
    public static void delete(int id) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("delete from class where id=?");
            pStmt.setInt(1, id);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //按班级编号号返回全部班级对象
    public static banji getClass(String cno) throws ClassNotFoundException {
        banji bj = new banji();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from class where cno=?");
            stmt.setString(1, cno);
            rs = stmt.executeQuery();
            if (rs.next()) {
            	bj.setId(rs.getInt("id"));
            	bj.setCno(rs.getString("cno"));
            	bj.setClassname(rs.getString("classname"));
            	bj.setDepartment(rs.getString("department"));
            	bj.setCollege(rs.getString("college"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
        return bj;
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
    public static void updatebanji(banji banji) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            String sql = "UPDATE class SET classname=?,department=?,college=? where cno=?";
            stmt = conn.prepareStatement(sql);
            //stmt.setInt(1, course.getId());
            //stmt.setInt(1, course.getNumber());
            //stmt.setString(1, course.getName());
            //stmt.setString(1, banji.getCno());
            stmt.setString(1, banji.getClassname());
            stmt.setString(2, banji.getDepartment());
            stmt.setString(3, banji.getCollege());
            stmt.setString(4, banji.getCno());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
    }
}
