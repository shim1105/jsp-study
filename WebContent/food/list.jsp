<%@page import="java.sql.ResultSet"%>
<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴목록</title>
</head>
<body>
	<%
		String foodName = request.getParameter("food_name");
		String foodPrice = request.getParameter("food_price");
		if (foodName != null) {
	%>
	니가 검색할 음식이름 :<%=foodName%><br> 니가 검색할 음식가격 :<%=foodPrice%><br>
	<%
		}
	%>
	<form>
		<input type="text" name="food_name"> <br> <input
			type="text" name="food_price"> <br>
		<button>검색</button>
		<br>
	</form>

	<%
		String sql = "select food_num,food_name,food_price from food";
		sql += " where 1=1";
		if (foodName != null && !"".equals(foodName)) {
			//sql += " and food_name like ?"; // 1번째
			sql += " and food_name like '%' || ? || '%' ";
		}
		if (foodPrice != null && !"".equals(foodPrice)) {
			sql += " and food_price=?";
		}
		sql += "order by food_num"; 
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			int cnt =1;
			if (foodName != null && !"".equals(foodName)) {
				ps.setString(cnt++, foodName);
			}
			if (foodPrice != null && !"".equals(foodPrice)) {
				ps.setString(cnt++, foodPrice);
			}
			ResultSet rs = ps.executeQuery();
			out.write("<table border=\"3\">");
			while (rs.next()) {
				out.write("<tr>");
				out.write("<td>" + rs.getInt("food_num") + "</td>");
				out.write("<td>");
				out.write("<a href=\"/jsp-study/food/view.jsp?foodNum="+rs.getInt("food_num")+"\"> ");
				out.write(rs.getString("food_name") + "</a></td>");
				out.write("<td>" + rs.getInt("food_price") + "</td>");
				out.write("<td><button onclick=\"foodDelete("+rs.getInt("food_num")+")\">삭제</button></td>");
				out.write("</tr>");
			}
			out.write("</table>");
		} catch (Exception e) {

		} finally {
			DBCon.close();
		}
	%>
	<a href="/jsp-study/food/insert.jsp">메뉴등록</a>
	<script >
	function foodDelete (foodNum){
		var isDelete = confirm("리얼리?");
		if(isDelete){
			location.href = "/jsp-study/food/delete_ok.jsp?foodNum="+foodNum;
		}
		
	}
	</script>
</body>
</html>