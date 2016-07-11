package com.fzu.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fzu.sqlhelper.SQLHelper;
import com.fzu.userBean.Student;

public class StuSqlUtils {
	
	
	//判断userID是否存在
	public static boolean isStudent(String userID,String userPwd){
		boolean flag = false;
		String sql = "select spwd from student where Sno=? and spwd = ?";
		String []paras = {userID,userPwd};
		SQLHelper sqlhelper = new SQLHelper();
		flag = sqlhelper.isExist(sql, paras);
		return flag;
	};
	
	
	public static List<Student> QueryStudent(String userID){
		List<Student> stu = new ArrayList();
		String sql = "select * from student where Sno=?";
		String []paras = {userID};
		SQLHelper sqlhelper = new SQLHelper();
		ResultSet result = sqlhelper.QueryExecute(sql, paras); 
		try {
			while(result.next()){
				Student student = new Student();
				student.setSno(result.getString(1));
				student.setSname(result.getString(2));
				student.setSsex(result.getString(3));
				student.setSage(result.getString(4));
				student.setSgrade(result.getString(5));
				student.setSimages(result.getString(7));
				stu.add(student);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlhelper.close();
		return stu;
	};
	
	public static boolean updataStu(String sql,String[] paras){
		boolean flag = false;
		SQLHelper sqlhelper = new SQLHelper();
		flag = sqlhelper.updExecute(sql, paras);
		return flag;
	}
}
