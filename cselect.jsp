<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 검사건수</title>
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
    max-width: 1000px;
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

.summary-info {
    background: #f8f9fa;
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 25px;
    text-align: center;
    color: #555;
    font-size: 0.95em;
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

/* 검사건수 강조 */
.test-count {
    font-weight: 700;
    color: #3498db;
    font-size: 1.1em;
}

/* 지역명 스타일 */
.region-name {
    font-weight: 600;
    color: #2c3e50;
}

/* 총계 행 */
.total-row {
    background-color: #ecf0f1;
    font-weight: 700;
}

.total-row td {
    color: #2c3e50;
    border-top: 2px solid #3498db;
}

/* 통계 카드 */
.stats-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-bottom: 30px;
}

.stat-card {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 20px;
    border-radius: 8px;
    color: white;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.stat-card h3 {
    font-size: 0.9em;
    font-weight: 500;
    margin-bottom: 10px;
    opacity: 0.9;
}

.stat-card .stat-value {
    font-size: 2em;
    font-weight: 700;
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
    
    .stats-container {
        grid-template-columns: 1fr;
    }
}
</style>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "select p.p_city, p_city, count(t_code) from tbl_patient_202005 p, tbl_result_202005 r where p.p_no = r.p_no group by p_city, p_city order by p.p_city";

ResultSet rs = conn.prepareStatement(sql).executeQuery();

// 통계 계산을 위한 변수
int totalTests = 0;
int regionCount = 0;
%>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="container">
    <div class="content-wrapper">
        <h2>지역별 검사건수 통계</h2>
        
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>지역 코드</th>
                        <th>지역명</th>
                        <th>검사건수</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    boolean hasData = false;
                    while(rs.next()) {
                        hasData = true;
                        regionCount++;
                        String city = rs.getString(2);
                        int testCount = rs.getInt(3);
                        totalTests += testCount;

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
                        <td class="region-name"><%=city %></td>
                        <td class="test-count"><%=testCount %>건</td>
                    </tr>
                    <% } %>
                    
                    <%if(hasData) { %>
                    <tr class="total-row">
                        <td colspan="2">총계</td>
                        <td class="test-count"><%=totalTests %>건</td>
                    </tr>
                    <% } else { %>
                    <tr>
                        <td colspan="3" class="no-data">검사 데이터가 없습니다.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <%if(hasData) { %>
        <div class="stats-container" style="margin-top: 30px;">
            <div class="stat-card">
                <h3>총 검사건수</h3>
                <div class="stat-value"><%=totalTests %></div>
            </div>
            <div class="stat-card" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                <h3>집계 지역</h3>
                <div class="stat-value"><%=regionCount %></div>
            </div>
            <div class="stat-card" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                <h3>평균 검사건수</h3>
                <div class="stat-value"><%=totalTests/regionCount %></div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
