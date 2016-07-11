package com.fzu.sqlhelper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.fzu.userBean.Student;

public class SQLHelper {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private Statement stmt=null;
	private String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url="jdbc:sqlserver://127.0.0.1:1433;databaseName=coursemanagement";
	private String user="root";
	private String pwd="root";
	
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	//����ɾ�ĺ���һ��
	
	//�ر������Դ
	public void  close(){
		try{
			if(rs!=null) rs.close();
			if(con!=null) con.close();
			if(ps!=null) ps.close();
		}catch(Exception e){ 
			e.printStackTrace();
		}
	}
	
	//��ѯ��ݿ����
	public ResultSet QueryExecute(String sql,String []paras){
		try{
			Class.forName(JDriver);
			con=DriverManager.getConnection(url,user,pwd);
			ps=con.prepareStatement(sql);
			for(int i=0;i<paras.length;i++){
				ps.setString(i+1, paras[i]);
			}
			rs=ps.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return rs;
	}
	
	
	public boolean isExist(String sql,String []paras){
		boolean flag = false;
		ResultSet result = QueryExecute(sql, paras);
		try {
			if(result.next()){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			flag = false;
		}
		return flag;
	}
	
	
	public boolean updExecute(String sql,String[] paras){
		boolean b=true;
		try{
			Class.forName(JDriver);
			con=DriverManager.getConnection(url,user,pwd);
			ps=con.prepareStatement(sql);
			for(int i=0;i<paras.length;i++){
				ps.setString(i+1, paras[i]);
			}
			if(ps.executeUpdate()!=1){
				b=false;
			}
		}catch(Exception e){
			b=false;
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
	}
}
