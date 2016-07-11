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

import com.fzu.userBean.Student;
import com.fzu.utils.StuSqlUtils;
import com.fzu.utils.TeacherSqlUtils;

public class LoginCheck extends HttpServlet {
	private String userID;
	private String userPwd;
	private String userType;
	private HttpSession Session;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Session = request.getSession();
		
		userID = request.getParameter("userID");
		userPwd = request.getParameter("userPwd");

		if(userID.equals("") || userID == null){
			Session.setAttribute("error","请填写用户名");
			RequestDispatcher rd = request.getRequestDispatcher("../login.jsp");
			rd.forward(request, response);
		}
		
		if(userPwd.equals("") || userPwd == null){
			Session.setAttribute("error","请填写密码");
			RequestDispatcher rd = request.getRequestDispatcher("../login.jsp");
			rd.forward(request, response);
		}
		
		//response.getWriter().println(userID);
		//response.getWriter().print(userPwd);
		boolean isStu = false;
	
		isStu = StuSqlUtils.isStudent(userID, userPwd);
		if(isStu == true){
			Session.setAttribute("userID",userID);
			Session.setAttribute("status","login");
			Session.setAttribute("option","welcome");
			Session.setAttribute("userType","student");
			RequestDispatcher rd = request.getRequestDispatcher("../student/index.jsp?name=kxh");
			rd.forward(request, response);
		}else{
			boolean isTea = TeacherSqlUtils.isTeacher(userID, userPwd);
			if(isTea == true){
				Session.setAttribute("userID",userID);
				Session.setAttribute("status","login");
				Session.setAttribute("option","welcome");
				Session.setAttribute("userType","teacher");
				RequestDispatcher rd = request.getRequestDispatcher("../teacher/index.jsp");
				rd.forward(request, response);
			}else{
				Session.setAttribute("error", "用户名或密码错误");
//				RequestDispatcher rd = request.getRequestDispatcher("../login.jsp");
//				rd.forward(request, response);
				response.sendRedirect("../login.jsp");
			}
		}

	}

}
