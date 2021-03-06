<%@page language="java" import="java.sql.*" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
	<head><title>删除一条记录页面</title></head>
	<body>
		<%
			//使用PreparedStatement对象实现数据库记录的修改，其步骤如下：
			//（1）建立数据库的连接
			String driverName = "com.mysql.jdbc.Driver";
			String userName = "root";
			String userPwd = "root";
			String dbName = "students";
			String url1 = "jdbc:mysql://localhost:3306/" + dbName;
			String url2 = "?user=" + userName + "&password=" + userPwd;
			String url3 = "&useUnicode=true&characterEncoding=UTF-8";
			String url = url1 + url2 + url3;
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);
			
			//（2）形成带参数的修改SQL语句
			String sql = "delete from stu_info where weight>=?";
			
			//（3）利用数据库连接对象建立PreparedStatement对象
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			//（4）若是带参数的SQL语句，则对各参数设置相应的参数值
			pstmt.setFloat(1, 80);
			
			//（5）调用PreparedStatement对象中的executeUpdate()方法
			int n = pstmt.executeUpdate();
			//（6）根据executeUpdate()方法的返回值，判断执行结果
			if(n==1) {%> 数据删除操作成功！<br><%}
			else {%> 数据删除操作失败！<br><%}
			
			//（7）关闭所有资源
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		 %>
	</body>
</html>