package com.fzu.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fzu.userBean.CourseBean;
import com.fzu.userBean.Student;
import com.fzu.utils.CourseSqlUtils;
import com.fzu.utils.StuSqlUtils;

public class option extends HttpServlet {

	private String option;
	private HttpSession Session;
	private String userID;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Session = request.getSession();
		option = request.getParameter("option");
		userID = (String) Session.getAttribute("userID");
		
		Session.setAttribute("option",option);
		
		if(option.equals("welcome")){
			RequestDispatcher rd = request.getRequestDispatcher("../../student/index.jsp");
			rd.forward(request, response);
		}else if(option.equals("info")){
			List<Student> stus = StuSqlUtils.QueryStudent(userID);
			Session.setAttribute("userINFO",stus);
			RequestDispatcher rd = request.getRequestDispatcher("../../student/index.jsp");
			rd.forward(request, response);
		}else if(option.equals("choSubject")){
			List<CourseBean> course = CourseSqlUtils.getCourse(userID);
			Session.setAttribute("userCourse",course);
			RequestDispatcher rd = request.getRequestDispatcher("../../student/index.jsp");
			rd.forward(request, response);
		}else if(option.equals("repswd")){
			RequestDispatcher rd = request.getRequestDispatcher("../../student/index.jsp");
			rd.forward(request, response);
		}else if(option.equals("logout")){
			Session.setAttribute("userID",null);
			Session.setAttribute("status","logout");
			response.sendRedirect("../../login.jsp");
		}
		
		
	}

	
}
