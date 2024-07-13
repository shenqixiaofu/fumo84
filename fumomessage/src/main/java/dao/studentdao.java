package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import bean.student;
import utils.utils;

public class studentdao {
 
    //获取学生信息列表
    public static List<student> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<student> list = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM student");
            rs = stmt.executeQuery();
            while (rs.next()) {
                student stu = new student();
                stu.setId(rs.getInt(1));
                stu.setNumber(rs.getInt(2));
                stu.setName(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setAge(rs.getInt(5));
                stu.setClassno(rs.getString(6));
                stu.setPhone(rs.getString(7));
                stu.setEmail(rs.getString(8));
                stu.setDepartment(rs.getString(9));
                stu.setCollege(rs.getString(10));
                list.add(stu);
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
 
    //增加学生信息
    public static void add(student stu) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("insert into student(number,name,sex,age,classno,phone,email,department,college) values(?,?,?,?,?,?,?,?,?)");
            //pStmt.setInt(1, stu.getId());
            pStmt.setInt(1, stu.getNumber());
            pStmt.setString(2, stu.getName());
            pStmt.setString(3, stu.getSex());
            pStmt.setInt(4, stu.getAge());
            pStmt.setString(5, stu.getClassno());
            pStmt.setString(6, stu.getPhone());
            pStmt.setString(7, stu.getEmail());
            pStmt.setString(8, stu.getDepartment());
            pStmt.setString(9, stu.getCollege());
            pStmt.executeUpdate();//更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //根据学号删除学生信息
    public static void delete(int number) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = utils.getConnection();
            pStmt = con.prepareStatement("delete from student where number=?");
            pStmt.setInt(1, number);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
 
    //按学号查询单个学生对象
    public static student getStudent(int number) throws ClassNotFoundException {
        student s = new student();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from student where number=?");
            stmt.setInt(1, number);
            rs = stmt.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setNumber(rs.getInt("number"));
                s.setName(rs.getString("name"));
                s.setSex(rs.getString("sex"));
                s.setAge(rs.getInt("age"));
                s.setClassno(rs.getString("classno"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setDepartment(rs.getString("department"));
                s.setCollege(rs.getString("college"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
        return s;
    }
 
    
    //修改功能
    public static void updateStudent(student student) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = utils.getConnection();
            String sql = "UPDATE student SET sex=?,age=?,classno=?,phone=?,email=?,department=?,college=? where number=?";
            stmt = conn.prepareStatement(sql);
            //stmt.setInt(1, student.getId());
            //stmt.setInt(1, student.getNumber());
            //stmt.setString(1, student.getName());
            stmt.setString(1, student.getSex());
            stmt.setInt(2, student.getAge());
            stmt.setString(3, student.getClassno());
            stmt.setString(4, student.getPhone());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, student.getDepartment());
            stmt.setString(7, student.getCollege());
            stmt.setInt(8, student.getNumber());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
            utils.release(rs, stmt, conn);
        }
    }
 
    //查询功能，根据模糊查询学号返回所有学生信息
    public static List<student> getStudentList(String number) throws ClassNotFoundException    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<student> allStudent = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from student where number like ?");
            stmt.setString(1, "%" + number + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                student stu = new student();
                stu.setId(rs.getInt(1));
                stu.setNumber(rs.getInt(2));
                stu.setName(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setAge(rs.getInt(5));
                stu.setClassno(rs.getString(6));
                stu.setPhone(rs.getString(7));
                stu.setEmail(rs.getString(8));
                stu.setDepartment(rs.getString(9));
                stu.setCollege(rs.getString(10));
                allStudent.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }   finally {
            utils.release(rs, stmt, conn);
        }
        return allStudent;
    }
    
  //查询功能，根据模糊查询班级返回基础学生信息
    public static List<student> getStudentList1(String classno) throws ClassNotFoundException    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<student> allStudent = new ArrayList<>();
        try {
            conn = utils.getConnection();
            stmt = conn.prepareStatement("select * from student where classno like ?");
            stmt.setString(1, "%" + classno + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                student stu = new student();
                stu.setId(rs.getInt(1));
                stu.setNumber(rs.getInt(2));
                stu.setName(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setAge(rs.getInt(5));
                stu.setClassno(rs.getString(6));
                stu.setPhone(rs.getString(7));
                stu.setEmail(rs.getString(8));
                stu.setDepartment(rs.getString(9));
                stu.setCollege(rs.getString(10));
                allStudent.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }   finally {
            utils.release(rs, stmt, conn);
        }
        return allStudent;
    }
}