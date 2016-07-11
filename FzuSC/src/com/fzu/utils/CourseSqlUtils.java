package com.fzu.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fzu.sqlhelper.SQLHelper;
import com.fzu.userBean.CourseBean;
import com.fzu.userBean.MyCourseBean;

public class CourseSqlUtils {

	public static List<CourseBean> getCourse(String userID){
		List<CourseBean> course = new ArrayList();
		String sql = "select a.cno,a.Cname,a.CTime,a.Cplace,a.Cmaterial" +
					 ",a.Tname from course a right join Sel b on " +
					 "a.Cno = b.Cno where SNO = ?";
		String []paras = {userID};
		SQLHelper sqlhelper = new SQLHelper();
		ResultSet rs = sqlhelper.QueryExecute(sql, paras);
		
		try {
			while(rs.next()){
				CourseBean cb = new CourseBean();
				cb.setCourseNo(rs.getString(1));
				cb.setCourseName(rs.getString(2));
				cb.setCourseTime(rs.getString(3));
				cb.setCoursePlace(rs.getString(4));
				cb.setCourseMaterial(rs.getString(5));
				cb.setTeacherName(rs.getString(6));
				course.add(cb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		sqlhelper.close();
		return course;
	}

	public static List<MyCourseBean> getMyCourse(String userID){
		List<MyCourseBean> course = new ArrayList();
		String sql = "select a.Cno,a.Cname,a.Ctime,a.Cplace,a.Cmaterial," +
					 "c.Sname from course a right join sel b on a.Cno = b.Cno " +
					 "right join Student c on b.sno = c.Sno where a.Tno = ?";  
		String []paras = {userID};
		SQLHelper sqlhelper = new SQLHelper();
		ResultSet result = sqlhelper.QueryExecute(sql, paras);
		try {
			while(result.next()){
				MyCourseBean mcb = new MyCourseBean();
				mcb.setCno(result.getString(1));
				mcb.setCname(result.getString(2));
				mcb.setCtime(result.getString(3));
				mcb.setCplace(result.getString(4));
				mcb.setCmeterial(result.getString(5));
				mcb.setSname(result.getString(6));
				course.add(mcb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		sqlhelper.close();
		return course;
	}
}
