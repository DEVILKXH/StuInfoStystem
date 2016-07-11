package com.fzu.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fzu.sqlhelper.SQLHelper;
import com.fzu.userBean.Student;
import com.fzu.userBean.Teacher;

public class TeacherSqlUtils {
	public static boolean isTeacher(String userID,String userPwd){
		boolean flag = false;
		String sql = "select tpwd from teacher where Tno = ? and Tpwd = ?";
		String []paras = {userID,userPwd};
		SQLHelper sqlhelper = new SQLHelper();
		flag = sqlhelper.isExist(sql, paras);
		return flag;
	};
	
	public static List<Teacher> QueryTeacher(String userID){
		List<Teacher> tea = new ArrayList();
		String sql = "select * from teacher where Tno=?";
		String []paras = {userID};
		SQLHelper sqlhelper = new SQLHelper();
		ResultSet result = sqlhelper.QueryExecute(sql, paras); 
		try {
			while(result.next()){
				Teacher teacher = new Teacher();
				teacher.setTno(result.getString(1));
				teacher.setTname(result.getString(2));
				teacher.setTsex(result.getString(3));
				teacher.setTcourse(result.getString(4));
				teacher.setTimages(result.getString(6));
				tea.add(teacher);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlhelper.close();
		return tea;
	};
	
	
	public static boolean updataTea(String sql,String[] paras){
		boolean flag = false;
		SQLHelper sqlhelper = new SQLHelper();
		flag = sqlhelper.updExecute(sql, paras);
		return flag;
	}
}
