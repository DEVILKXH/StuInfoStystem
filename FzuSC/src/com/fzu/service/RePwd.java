package com.fzu.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fzu.sqlhelper.SQLHelper;
import com.fzu.utils.StuSqlUtils;

public class RePwd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String psd = request.getParameter("psd");
		String psd1 = request.getParameter("psd1");
		String psd2 = request.getParameter("psd2");
		SQLHelper sqlhelper = new SQLHelper();
		HttpSession Session = request.getSession();
		String userType = (String) Session.getAttribute("userType");
		String userID = (String) Session.getAttribute("userID");
		
		if(psd.equals("") || psd==null || psd1.equals("") || psd1==null || psd2.equals("") || psd2==null){
			response.getWriter().print("密码不能为空");
			return ;
		}
		
		if(!psd1.equals(psd2)){
			response.getWriter().print("两次密码不一致");
			return ;
		}
		
		if(psd1.length() < 6){
			response.getWriter().print("密码至少需要六位");
			return ;
		}

		String sqlQuery;
		String sqlUpdate;
		
		if(userType.equals("student")){
			sqlQuery = "select spwd from student where Sno = ? and spwd = ?";
			sqlUpdate = "update student set Spwd = ? where Sno = ?";
		}else{
			sqlQuery = "select Tpwd from teacher where Tno = ? and Tpwd = ?";
			sqlUpdate = "update teacher set Tpwd = ? where Tno = ?";
		}
		
		String []paras = {userID,psd};
		boolean flag = sqlhelper.isExist(sqlQuery, paras);
		if(!flag){
			response.getWriter().print("密码错误");
		}else{
			String []paras1 = {psd1,userID};
			boolean updateFlag = StuSqlUtils.updataStu(sqlUpdate, paras1);
			if(updateFlag){
				response.getWriter().print("密码修改成功");
			}else{
				response.getWriter().print("服务器忙，请稍后重试");
			}
		}
	}
}
