package com.fzu.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fzu.utils.StuSqlUtils;
import com.fzu.utils.TeacherSqlUtils;


public class FileUpload extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String filepath;
		response.setCharacterEncoding("utf-8");
		HttpSession Session = request.getSession();
		String userID = (String) Session.getAttribute("userID");
		String filename = request.getParameter("filename");
		filename = userID + filename;
		String userType = (String) Session.getAttribute("userType");
		//设置保存上传文件的路径
		String path=getServletContext().getRealPath("/images");
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		//System.out.println(path);

		InputStream in = request.getInputStream();
				
		String tempfilename = path+"\\"+filename; 
		
		File tempfile = new File(tempfilename);
		
        byte[] b = new byte[1024];
        int len = 0;     
        FileOutputStream fos = new FileOutputStream(tempfile);
        int i = 1;
        while((len = in.read(b)) !=-1 ){
        	fos.write(b,0,len);
        }
        in.close();
        fos.close();  
        
        
        if(userType.equals("student")){
        	String sql="update student set images = ? where Sno = ?";
        	String []paras ={filename,userID};
        	boolean flag = StuSqlUtils.updataStu(sql, paras);
        	if(flag==true){
        		response.getWriter().println("上传成功");
        	}
        }else{
        	String sql="update teacher set images = ? where Tno = ?";
        	String []paras ={filename,userID};
        	boolean flag = TeacherSqlUtils.updataTea(sql, paras);
        	if(flag==true){
        		response.getWriter().println("上传成功");
        	}
        }
	}
	
}
