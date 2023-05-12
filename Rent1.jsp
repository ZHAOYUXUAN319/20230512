<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="javaJdbc.JdbcConn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database Table</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>
<script>
	function makeEditable(row) {
		var cells = row.getElementsByTagName("td");
		for (var i = 0; i < cells.length; i++) {
			var cell = cells[i];
			var cellValue = cell.innerHTML;
			cell.innerHTML = "<input type='text' value='" + cellValue + "' />";
		}
	}

	function handleDoubleClick(event) {
		var target = event.target || event.srcElement;
		if (target.tagName === "TD") {
			var row = target.parentNode;
			makeEditable(row);
		}
	}

	document.addEventListener("dblclick", handleDoubleClick);
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>··ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>ID</th>

			</tr>
		</thead>
		<tbody>
			<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {

				Class.forName("org.postgresql.Driver");
				String url = "jdbc:postgresql://localhost:5434/postgres";
				String user = "postgres";
				String password = "319333633";
				conn = DriverManager.getConnection(url, user, password);

				// 执行查询语句
				String sql = "SELECT * FROM Property order by property_id";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);

				// 遍历结果集并显示在表格中
				while (rs.next()) {
					String PropertyId = rs.getString("property_id");
					String PropertyName = rs.getString("property_name");
					String Address = rs.getString("address");
					String PropertyType = rs.getString("property_type");
					String PropertyArea = rs.getString("property_area");
					String Price = rs.getString("price");
					String Status = rs.getString("status");
					out.println("<tr ondblclick='makeEditable(this)'>");
					out.println("<td contenteditable='true'>" + PropertyId + "</td>");
					out.println("<td contenteditable='true'>" + PropertyName + "</td>");
					out.println("<td contenteditable='true'>" + Address + "</td>");
					out.println("<td contenteditable='true'>" + PropertyType + "</td>");
					out.println("<td contenteditable='true'>" + PropertyArea + "</td>");
					out.println("<td contenteditable='true'>" + Price + "</td>");
					out.println("<td contenteditable='true'>" + Status + "</td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 关闭数据库资源
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			}
			%>
		</tbody>
	</table>
</body>
</html>
