<%@page import="org.omg.PortableInterceptor.SUCCESSFUL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#bk {
	text-align: center;
	display: flex;
}

#bk p {
	border: solid 2px;
	padding: 10px;
	margin: 10px;
}

#bk-home {
	width: 600px;
	height: 400px;
}

#ks {
	margin: 20px;
}
</style>
<script>

</script>
</head>
<body>
	welcome:
	<%
String name = (String) session.getAttribute("uname");

if (name != null) {
	out.print(name);
%>
	<a href="invalidate.jsp">ログアウト</a>
	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>
	<div id="bk">
		<p>
			<a href='Rent.jsp' >管理者物件一覧</a>
		</p>
		<p>
			<a href='BukenShiki.jsp'>物件新規</a>
		</p>
		<p>
			<a href='NewLogin.jsp'>物件削除</a>
		</p>
		<p>
			<a href='NewLogin.jsp'>物件編集</a>
		</p>
		<p>
			<a href='NewLogin.jsp'>中身部屋</a>
		</p>
	</div>
	<!--  
	<form action="搜索结果页面.html" method="GET" id="ks">
			  <input type="submit" value="搜索">
		  <input type="text" name="search" placeholder="输入关键词">
	</form>
-->
	<iframe src="Rent1.jsp" id="bk-home" name="iframe"></iframe>
</body>
</html>