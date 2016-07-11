<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	HttpSession Session = request.getSession();
	String errorMes = (String)Session.getAttribute("error");
  	Session.setAttribute("error",null);
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>福州大学学生信息 管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
	<script type="text/javascript" src="js/jQuery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	window.onload = function(){
		var oErrorMes = document.getElementById("errorMes").value;
		var oErrorInfo = document.getElementById("errorINfo");
		if(oErrorMes != "" && oErrorMes != null){
			oErrorInfo.click();
		}
	}
	</script>
  </head>
  
  <body> 
  		<jsp:include page="include/header.jsp" />
  		
  		<div class="container" id="container">
  			<div class="row">
  				<div class="col-md-7">
  					<div class="panel panel-success">
						<div class="panel-heading">通知公告</div>
					  	<div class="panel-body">
					  		<ul class="notice">
					  			<li>
					  				<span class="glyphicon glyphicon-menu-right fonts" aria-hidden="true"></span>
					  				<a href="http://jwch.fzu.edu.cn/html/jwtz/bm02/9896.html">
					  					关于公布2016—2017学年第一学期修读辅修专业学生名单的通知
					  				</a>
					  			</li>
					  			<li>
					  				<span class="glyphicon glyphicon-menu-right fonts" aria-hidden="true"></span>
					  				<a href="http://jwch.fzu.edu.cn/html/jwtz/bm05/9897.html">
					  					福州大学关于印发修订后的授予学士学位工作细则的通知
					  				</a>
					  			</li>
					  			<li>
					  				<span class="glyphicon glyphicon-menu-right fonts" aria-hidden="true"></span>
					  				<a href="http://jwch.fzu.edu.cn/html/jwtz/bm02/9896.html">
					  					关于公布2016届优秀本科生毕业设计（论文）名单的通知
					  				</a>
					  			</li>
					  			<li>
					  				<span class="glyphicon glyphicon-menu-right fonts" aria-hidden="true"></span>
					  				<a href="http://jwch.fzu.edu.cn/html/jwtz/bm04/9874.html">
					  					关于公布参加首届远志创业实验班选拔面试学生名单的紧急通知
					  				</a>
					  			</li>
					  			<li>
					  				<span class="glyphicon glyphicon-menu-right fonts" aria-hidden="true"></span>
					  				<a href="http://jwch.fzu.edu.cn/html/jwtz/bm04/9772.html">
					  					关于2015-2016学年第二学期校选课开课的有关通知
					  				</a>
					  			</li>
					  			<li>
					  				<span class="glyphicon glyphicon-menu-right fonts" aria-hidden="true"></span>
					  				<a href="http://jwch.fzu.edu.cn/html/jwtz/bm04/9885.html">
					  					关于核对2016-2017第一学期全校性公共选修课开课信息的有关通知
					  				</a>
					  			</li>
					  			<li>
					  				<span class="glyphicon glyphicon-menu-right fonts" aria-hidden="true"></span>
					  				<a href="http://jwch.fzu.edu.cn/html/jwtz/bm04/9885.html">
					  					关于核对2016-2017第一学期全校性公共选修课开课信息的有关通知
					  				</a>
					  			</li>
					  		</ul>
					  	</div>
					</div>
  				</div>
  			
  				<div class="col-md-5 wrapper">
				    <form action="./servlet/LoginCheck" method="post" >
					    <div class="loginBox">
					    	<h1>登录 | Login </h1>
					        <div class="loginBoxCenter">
					            <p style="color:#900"><label for="username">学号：</label></p>
					            <p><input type="text" id="text" name="userID" class="loginInput" autofocus="true" required="required" autocomplete="off" placeholder="请输入您的账号" value="" /></p>
					            <p style="color:#900"><label for="password">密码：</label></p>
					            <p><input type="password" id="password" name="userPwd" class="loginInput" required="required" placeholder="请输入密码" value="" /></p>
					        </div>
					        <div class="loginBoxButtons">
					            <input id="remember" type="checkbox" name="remember" />
					            <label style="color:#900" for="remember">记住登录状态</label>
					            <input type="reset" class="loginBtn" value="重置"/>
					            <input type="submit" class="loginBtn" value="登录" />
					        </div>
					    </div>
				    </form>
  				</div>
  			</div>
  		</div>
  		
  		
  		<%
  			if(errorMes !="" && errorMes != null){
  		 %>
  		 	<input type="hidden" value="<%=errorMes %>" id="errorMes" />
  			
  		<%
  			}
  		 %>
  		
  		<!-- 错误信息 -->
  		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#gridSystemModal" id="errorINfo">
		   		错误信息
		 </button>
  		
  		<div class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" id="gridSystemModal">
			<div class="modal-dialog" role="document">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        		<h4 class="modal-title" id="gridSystemModalLabel">登录失败</h4>
		      		</div>
			      	<div class="modal-body">
			        	<%=errorMes %>
			        </div>
		    	</div><!-- /.modal-content -->
		  	</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
  		
  		<jsp:include page="include/footer.html" /> 
  </body>
</html>
