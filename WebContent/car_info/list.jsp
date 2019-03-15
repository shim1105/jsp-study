<%@page import="java.sql.ResultSet"%>
<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAR INFO</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String carNum = request.getParameter("ci_num");
		String carName = request.getParameter("ci_name");
		String carYear = request.getParameter("ci_year");
		String carVendor = request.getParameter("ci_vendor");
		String carEtc = request.getParameter("ci_etc");
	%>

	<table border="3">
		<form>
			<input type="text" name="ci_name">
			<button>검색</button>
		</form>
		<form method="post" action="/jsp-study/car_info/delete_ok.jsp">
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>차모델</th>
			<th>연식</th>
			<th>제조회사</th>
			<th>설명</th>
			<th>삭제버튼</th>
		</tr>
		<%
			String sql = "select * from car_info where 1=1 ";
			if (carName != null) {
				sql += " and ci_name like '%' || ? || '%'";
			}
			sql += " order by ci_num ";
			try {
				PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
				if (carName != null) {
					ps.setString(1, carName);
				}
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					out.write("<tr>");
		%>
		<td><input type="checkbox" name="ci_num"
			value="<%=rs.getString("ci_num")%>"></td>
		<%
			out.write("<td>" + rs.getInt("ci_num") + "</td>");
					out.write("<td>");
					out.write("<a href=\"/jsp-study/car_info/view.jsp?carNum=" + rs.getInt("ci_num") + "	\">");
					out.write(rs.getString("ci_name") + "</a></td>");
					out.write("<td>" + rs.getString("ci_year") + "</td>");
					out.write("<td>" + rs.getString("ci_vendor") + "</td>");
					out.write("<td>" + rs.getString("ci_etc") + "</td>");
					out.write("<td align=\"center\"><button type=\"button\" onclick=\"carDelete(" + rs.getInt("ci_num")
							+ ")\">삭제</button></td>");
					out.write("</tr>");
				}
			} catch (Exception e) {
				out.write(" DBCon오류 @@@@@");
			} finally {
				DBCon.close();
			}
		%>
		<tr>
			<td colspan="1" align="center"><button>차량삭제</button></td>
			<td colspan="3" align="center"><button type="button" onclick="carInsert()">차량등록</button></td>
		</form>
		</tr>

	</table>
</body>
</html>
<script>

	function carInsert() {
		var isDelete = confirm("만들것니 ?>??");
		if (isDelete) {
			location.href = "/jsp-study/car_info/insert.jsp";
		}
	}
	function carDelete(carNum) {
		var isDelete = confirm("리얼리?");
		if (isDelete) {
			location.href = "/jsp-study/car_info/delete.jsp?carNum=" + carNum;
		}
	
	}
</script>