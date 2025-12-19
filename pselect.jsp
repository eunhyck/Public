<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 조회</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f5f5;
    line-height: 1.6;
}

.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
}

.content-wrapper {
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    padding: 30px;
}

h2 {
    color: #2c3e50;
    margin-bottom: 30px;
    text-align: center;
    font-size: 1.8em;
    border-bottom: 3px solid #3498db;
    padding-bottom: 15px;
}

.table-wrapper {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th {
    background-color: #3498db;
    color: white;
    padding: 15px;
    text-align: center;
    font-weight: 600;
    font-size: 0.95em;
    letter-spacing: 0.5px;
}

td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #e0e0e0;
    color: #555;
}

tr:hover {
    background-color: #f8f9fa;
    transition: background-color 0.3s ease;
}

tr:last-child td {
    border-bottom: none;
}

.no-data {
    text-align: center;
    padding: 40px;
    color: #7f8c8d;
    font-style: italic;
}

@media screen and (max-width: 768px) {
    table {
        font-size: 0.9em;
    }
    
    th, td {
        padding: 10px 8px;
    }
}
</style>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "select p_no, p_name, p_birth, p_gender, p_tel1, p_tel2, p_tel3, p_city from tbl_patient_202005";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="container">
    <div class="content-wrapper">
        <h2>환자 조회</h2>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>환자 코드</th>
                        <th>환자 이름</th>
                        <th>생년월일</th>
                        <th>성별</th>
                        <th>전화번호</th>
                        <th>거주지</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    boolean hasData = false;
                    while(rs.next()) {
                        hasData = true;
                        String gender = rs.getString(4);

                        if(gender.equals("M")) {
                            gender = "남";
                        } else if(gender.equals("F")) {
                            gender = "여";
                        }

                        String city = rs.getString(8);

                        if(city.equals("10")) {
                            city = "서울";
                        } else if(city.equals("20")) {
                            city = "경기";
                        } else if(city.equals("30")) {
                            city = "강원";
                        } else if(city.equals("40")) {
                            city = "대구";
                        }
                    %>
                    <tr>
                        <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=gender %></td>
                        <td><%=rs.getString(5) %>-<%=rs.getString(6) %>-<%=rs.getString(7) %></td>
                        <td><%=city %></td>
                    </tr>
                    <% } 
                    if(!hasData) {
                    %>
                    <tr>
                        <td colspan="6" class="no-data">등록된 환자 정보가 없습니다.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
