<%@ page language="java" import="java.util.*,com.fzu.userBean.Student,com.fzu.userBean.CourseBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	HttpSession Session = request.getSession();
	String Status = (String)Session.getAttribute("status");
	String option = (String)Session.getAttribute("option");
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
	<script type="text/javascript" src="js/jQuery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  <style>
  	.classify{
  		width: 100%;
  		min-height: 335px;
  		margin-bottom: 10px;
  		
  		border: 1px solid #aaa;
  		border-radius: 5px; 
  		box-shadow: 2px 2px 2px #aaaaaa;  
  	}
  	.stu-option-title{
  		
  	}
  	.stu-option:hover,.stu-option-title:hover{
  		text-decoration: none;
  	}
  	
  	.welcome{
  		height: 335px;
  		margin: 0;
  		background: url("./img/welcome.jpg") no-repeat -100px -30px;
  	}
  	.stu-option{
  		list-style: none;
  		padding: 0;
  	}
  	
  	.stu-option li{
  		padding: 5px 0;
  	}
  	.mytable{
  		margin: 0
  	}
  	.mytable td{
  		width: 16.66666%;
  		text-align: center;
  		padding: 0;
  	}
  	.images{
  		position:relative;
  		z-index: 2;
  		width: 150px;
  	}
  	
  	.images-upload{
  		width: 230px;
  		height: 160px;
  		position:absolute;
  		z-index: 3;
  		filter: alpha(opacity: 0);
  		opacity: 0;
  		cursor: pointer;
  	}
  	.repawd{
  		padding: 10px;
  	}
  	#optionInfo{
  		display: none;
  	}
  	.courseTable{
  		text-align: center;
  		margin: 0;
  	}
  </style>
  <script type="text/javascript">
  $(function(){
  	
  	/*************************************************/
  	$(".stu-option-title").click(function(){
  		$(this).css("text-decoration","none");
  	});
  	
  	/*************************************************/
  	$(".images-upload").change(function(){
  		var files = this.files;
  		var file = files[0];
  		var index = file["name"].lastIndexOf(".");
  		
  		var filename = file["name"].substring(index,file["name"].length);
  		console.log(filename);
  		$.ajax({
  			url: "./servlet/FileUpload?filename="+filename+"&time"+new Date().getTime(),
  			type: "POST",
  			data: file,
  			contentType: false,
   			processData: false, 
  			success: function(str){
  				alert(str);
  				window.location.reload(true);
  			},
  			error: function(){
  			}
  		});
  	});
  	
  	/*************************************************/
  	$(".repswd-btn").click(function(){
  		var psd = $("#Password0").val();
  		var psd1 = $("#Password1").val();
  		var psd2 = $("#Password2").val();
  		
  		$.ajax({
  			url: "./servlet/RePwd",
  			type: "POST",
  			data: {psd: psd, psd1: psd1, psd2: psd2},
  			success: function(str){
  				$("#gridSystemModalLabel").html("重命名错误");
  				$("#message").html(str);
  				$("#optionInfo").click();
  				
  				$("#Password0").val("");
  				$("#Password1").val("");
  				$("#Password2").val("");
  			}
  		});
  	});
  	
  	/*************************************************/
  });
  </script>
  </head>
  
  <body>
  	<jsp:include page="../include/header.jsp" />
  	
  	<div class="container">
  		<div class="row">
  			<div class="col-md-4">
  				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
				    	<div class="panel-heading" role="tab" id="headingOne">
				      		<h4 class="panel-title">
				        		<a class="stu-option-title" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          			个人信息
				        		</a>
				      		</h4>
				    	</div>
					    <div id="collapseOne" class="panel-collapse collapse <% if(option.equals("info")) %><%="in" %>" role="tabpanel" aria-labelledby="headingOne">
					      	<div class="panel-body">
					        	<a class="stu-option" href="./servlet/student/option?option=info">个人信息</a>
					      	</div>
					    </div>
				  	</div>
				  	<div class="panel panel-default">
				    	<div class="panel-heading" role="tab" id="headingTwo">
				      		<h4 class="panel-title">
				        		<a class="stu-option-title" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				          			选课结果
				        		</a>
				      		</h4>
				    	</div>
					    <div id="collapseTwo" class="panel-collapse collapse <% if(option.equals("choSubject")) %><%="in" %>" role="tabpanel" aria-labelledby="headingTwo">
					     	<div class="panel-body">
					        	<a class="stu-option" href="./servlet/student/option?option=choSubject">我的选课</a>
					      	</div>
					    </div>
				  	</div>
				  	<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingThree">
						      <h4 class="panel-title">
							        <a class="stu-option-title" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							          	个人管理
							        </a>
						      </h4>
					    </div>
					    <div id="collapseThree" class="panel-collapse collapse <% if(option.equals("repswd") || option.equals("logout")) %><%="in" %>" role="tabpanel" aria-labelledby="headingThree">
					     	<div class="panel-body">
					     		<ul class="stu-option">
					        		<li><a class="stu-option" href="./servlet/student/option?option=repswd">修改密码</a></li>
					        		<li><a class="stu-option" href="./servlet/student/option?option=logout">安全退出</a></li>
					      		</ul>
					      	</div>
				  		</div>
				  	</div>
				  	
				</div>	
  			</div>
  			
  			<div class="col-md-8">
  				<div class="classify">
		  			<%
						if(option.equals("welcome")){
					%>
						<div class="jumbotron welcome">
						</div>
					<%
						}else if(option.equals("info")){
							List<Student> stu = (List<Student>)Session.getAttribute("userINFO");
							Student student = stu.get(0); 
						
					%>
					<table class="table table-hover table-bordered mytable">
						<tbody>
							<tr>
								<td class="mytd">学号</td>
								<td><%=student.getSno() %></td>
								<td>姓名</td>
								<td><%=student.getSname() %></td>
								<td colspan=2 rowspan=4 class="upload-image">
									<input type="file" class="images-upload" />
									<img  class="images" src = "./images/<%=student.getSimages() %>" />
								</td>
							</tr>
							<tr>
								<td>姓名拼音</td>
								<td></td>
								<td>曾用名</td>
								<td ></td>
							</tr>
							<tr>
								<td>性别</td>
								<td><%=student.getSsex() %></td>
								<td>出生日期</td>
								<td></td>
							</tr>
							<tr>
								<td>民族</td>
								<td ></td>
								<td>政治面貌</td>
								<td></td>
							</tr>
							<tr>
								<td>生源地</td>
								<td ></td>
								<td>年龄</td>
								<td><%=student.getSage() %></td>
								<td>婚否</td>
								<td><%=student.getSgrade() %></td>
							</tr>
							<tr>
								<td>身份证</td>
								<td colspan=2></td>
								
								<td>考生号</td>
								<td colspan=2></td>
							</tr>
							<tr>
								<td>籍贯</td>
								<td></td>
								<td>QQ</td>
								<td></td>
								<td>E-mail</td>
								<td ></td>
							</tr>
							<tr>
								<td>联系方式</td>
								<td></td>
								<td>紧急联系人</td>
								<td></td>
								<td>紧急联系电话</td>
								<td ></td>
							</tr>
							<tr>
								<td>学院名称</td>
								<td colspan=2></td>
								<td>专业名称</td>
								<td colspan=2></td>
							</tr>
							<tr>
								<td>专业方向</td>
								<td colspan=2></td>
								<td>原专业</td>
								<td colspan=2></td>
							</tr>
							<tr>
								<td>年级</td>
								<td><%=student.getSgrade() %></td>
								<td>班级</td>
								<td></td>
								<td>辅导员</td>
								<td ></td>
							</tr>
							<tr>
								<td>家庭地址</td>
								<td colspan=3></td>
								<td>邮编</td>
								<td ></td>
							</tr>
						</tbody>						
					</table>
					<%
						}else if(option.equals("choSubject")){
							List<CourseBean> course = (List<CourseBean>)Session.getAttribute("userCourse");
					%>
						<table class="table table-hover table-bordered courseTable">
							<thead>
								<tr>
									<td>课程编号</td>
									<td>课程名称</td>
									<td>上课时间</td>
									<td>上课地点</td>
									<td>教辅书</td>
									<td>任课教师</td>
								</tr>
							</thead>
							<tbody>
					<%
							for(CourseBean cb: course){
					%>
							<tr>
								<td><%=cb.getCourseNo() %></td>
								<td><%=cb.getCourseName() %></td>
								<td><%=cb.getCourseTime() %></td>
								<td><%=cb.getCoursePlace() %></td>
								<td><%=cb.getCourseMaterial() %></td>
								<td><%=cb.getTeacherName() %></td>
							</tr>
					<%
							}
					 %>
							</tbody>
						</table>
					<%
						}else if(option.equals("repswd")){
					%>
					<div class="repawd">
						 <div class="form-group">
						 	<label for="Password0">原密码</label>
						    <input type="password" class="form-control" id="Password0" required="required"  autofocus="true" placeholder="请输入原密码">
						  </div>
						  <div class="form-group">
						    <label for="Password1">新密码</label>
						    <input type="password" class="form-control" id="Password1" required="required" placeholder="请输入新密码">
						  </div>
						  <div class="form-group">
						    <label for="Password2">确认密码</label>
						    <input type="password" class="form-control" id="Password2" required="required" placeholder="请输入新密码">
						  </div>
						  
						  <input class="btn btn-default repswd-btn" type="button" value="确定">
					</div>
					<%
						}		
		  			 %>
  			 	</div>
  			</div>
  		</div>
  	</div>
  	<jsp:include page="../include/footer.html" /> 
  	
  	
  	
  	<!-- 错误信息 -->
 	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#gridSystemModal" id="optionInfo">
	   		操作信息
	 </button>
 		
 		<div class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" id="gridSystemModal">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title" id="gridSystemModalLabel">操作失败</h4>
	      		</div>
		      	<div class="modal-body" id="message">
		        	
		        </div>
	    	</div><!-- /.modal-content -->
	  	</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
  		
  </body>
</html>
