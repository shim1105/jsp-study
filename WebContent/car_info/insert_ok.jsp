<%@page import="text.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String sql= "insert into car_info(ci_num,ci_name,ci_year,ci_vendor,ci_etc) values((select nvl(max(ci_num),0)+1 from car_info),?,?,?,?)";
String carName = request.getParameter("carName");
String carYear = request.getParameter("carYear");
String carVendor = request.getParameter("carVendor");
String carEtc = request.getParameter("carEtc");
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1, carName);
ps.setString(2, carYear);
ps.setString(3, carVendor);
ps.setString(4, carEtc);
int cnt = ps.executeUpdate();
String result = "실패 하였습니다.";
if( cnt == 1){
	result = "성공했습니다.";
}
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/car_info/list.jsp";
</script>
