package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import bean.user;
import utils.utils;
public class userdao {
	//获取用户信息列表
    public static List<user> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<user> list = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM users");
            rs = stmt.executeQuery();
            while (rs.next()) {
            	user user = new user();
            	user.setId(rs.getInt(1));
            	user.setUsername(rs.getString(2));
            	user.setPassword(rs.getString(3));
            	user.setZhuceday(rs.getString(4));
                list.add(user);
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
 
    //增加用户信息
    public static void add(user user) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("insert into users(username,password,zhuceday) values(?,?,?)");
            //pStmt.setInt(1, user.getId());
            pStmt.setString(1, user.getUsername());
            pStmt.setString(2, user.getPassword());
            pStmt.setString(3, user.getZhuceday());
            pStmt.executeUpdate();//更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //根据用户名删除用户信息
    public static void delete(int id) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("delete from users where id=?");
            pStmt.setInt(1, id);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //按用户名返回全部用户对象
    public static user getUsername(String username) throws ClassNotFoundException {
    	user user = new user();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from users where username=?");
            stmt.setString(1, username);
            rs = stmt.executeQuery();
            if (rs.next()) {
            	user.setId(rs.getInt("id"));
            	user.setUsername(rs.getString("username"));
            	user.setPassword(rs.getString("password"));
            	user.setZhuceday(rs.getString("zhuceday"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
        return user;
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
    
    //修改用户密码功能
    public static void updateuser(user user) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            String sql = "UPDATE users SET password=? where username=?";
            stmt = conn.prepareStatement(sql);
            //stmt.setInt(1, course.getId());
            //stmt.setInt(1, course.getNumber());
            //stmt.setString(1, course.getName());
            //stmt.setString(1, banji.getCno());
            stmt.setString(1, user.getPassword());
            stmt.setString(2, user.getUsername());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
    }
}