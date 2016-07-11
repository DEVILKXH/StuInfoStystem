1、按照java连接sql_server_2008.doc的内容配置数据库，是数据库的帐号密码均为root
2、导入数据库数据，script.sql和coursemanagement.mdf任选一个导入
script.sql只需将其已记事本打开，然后直接复制到数据库执行即可，
coursemanagement.mdf需要用到数据库的附加选项,右击选择附加，推荐使用这种方式
3.打开myeclipse，导入FzuSC项目，打开tomcat，即可运行，或将项目文件放在tomcat目录下的webapps里面


实现的功能
1.分角色登录登录系统----教师和学生，初始密码均为学号、教师号
2.个人信息的查看，个人图片上传功能，默认图片为default.jpg，图片格式不限
3.学生可以查看自己的选课信息，教师可以查看自己的开课信息及选择课程的学生
4.密码的修改

使用到的框架：
bootstrap和jQuery

mvc 模式开发

效果图保存在image文件夹下
