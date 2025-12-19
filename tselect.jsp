<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과 조회</title>
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
    max-width: 1400px;
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

/* 검사 상태 뱃지 */
.status-badge {
    display: inline-block;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 0.85em;
    font-weight: 600;
}

.status-ongoing {
    background-color: #fff3cd;
    color: #856404;
}

.status-complete {
    background-color: #d4edda;
    color: #155724;
}

/* 검사 결과 뱃지 */
.result-badge {
    display: inline-block;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 0.85em;
    font-weight: 600;
}

.result-none {
    background-color: #e2e3e5;
    color: #383d41;
}

.result-positive {
    background-color: #f8d7da;
    color: #721c24;
}

.result-negative {
    background-color: #d1ecf1;
    color: #0c5460;
}

.no-data {
    text-align: center;
    padding: 40px;
    color: #7f8c8d;
    font-style: italic;
}

@media screen and (max-width: 768px) {
    table {
        font-size: 0.85em;
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

String sql = "select r.p_no, p_name, t_name, t_sdate, t_status, t_ldate, t_result from tbl_lab_test_202005 l, tbl_result_202005 r, tbl_patient_202005 p where l.t_code = r.t_code and r.p_no = p.p_no";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="container">
    <div class="content-wrapper">
        <h2>검사결과 조회</h2>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>환자 코드</th>
                        <th>환자 이름</th>
                        <th>검사명</th>
                        <th>검사 시작일</th>
                        <th>검사 상태</th>
                        <th>검사 완료일</th>
                        <th>검사 결과</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    boolean hasData = false;
                    while(rs.next()) {
                        hasData = true;
                        String s = rs.getString(5).trim();
                        String statusClass = "";
                        
                        if(s.equals("1")) {
                            s = "검사 중";
                            statusClass = "status-ongoing";
                        } else if (s.equals("2")) {
                            s = "검사 완료";
                            statusClass = "status-complete";
                        }
                        
                        String t = rs.getString(7).trim();
                        String resultClass = "";
                        
                        if(t.equals("X")){
                            t = "미입력";
                            resultClass = "result-none";
                        } else if (t.equals("P")) {
                            t = "양성";
                            resultClass = "result-positive";
                        } else if (t.equals("N")){
                            t = "음성";
                            resultClass = "result-negative";
                        }
                    %>
                    <tr>
                        <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=rs.getString(4).substring(0, 10) %></td>
                        <td><span class="status-badge <%=statusClass%>"><%=s %></span></td>
                        <td><%=rs.getString(6).substring(0, 10) %></td>
                        <td><span class="result-badge <%=resultClass%>"><%=t %></span></td>
                    </tr>
                    <% } 
                    if(!hasData) {
                    %>
                    <tr>
                        <td colspan="7" class="no-data">검사 결과가 없습니다.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
