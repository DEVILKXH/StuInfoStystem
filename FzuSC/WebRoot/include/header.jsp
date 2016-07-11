
<%@ page language="java" import="java.util.*,com.fzu.userBean.Student" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

  <style>
  	.container{
  		width: 1100px;
  	}
  	
  	.header{
  		height: 250px;
  		background: url("./img/banner.jpg") no-repeat 0 0;
  	}
  	#webName{
  		color: #fff;
  		margin-left: 300px;
  	}
  </style>
    <div class="container">
    	<div class="jumbotron header">
			<h3 id="webName">学生信息管理系统</h3>
		</div>

    </div>
