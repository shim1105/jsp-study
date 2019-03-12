<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String carName = request.getParameter("carName");
String carYear = request.getParameter("carYear");
String carVendor = request.getParameter("carVendor");
String carEtc = request.getParameter("carEtc");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 등록 </title>
</head>
<body>
<form action="/jsp-study/car_info/insert_ok.jsp" method="post">
자동차 이름 : <input type="text" name="carName"><br>
자동차 연식 : <input type="number" max="2019" min="1900" name="carYear"><br>
자동차 브렌드 : <input type="text" name="carVendor"><br>
자동차 설명 : <input type="text" name="carEtc"><br>
<button>등록</button>
</form>
</body>
</html>