<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 검사 관리 시스템</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* 헤더 스타일 */
header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 25px 0;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

header h1 {
    text-align: center;
    color: white;
    font-size: 1.8em;
    font-weight: 600;
    letter-spacing: 1px;
}

/* 네비게이션 스타일 */
nav {
    background: #2c3e50;
    padding: 0;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

nav ul {
    list-style: none;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 0 auto;
}

nav ul li {
    margin: 0;
}

nav a {
    display: block;
    padding: 18px 30px;
    color: white;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
    position: relative;
    font-size: 0.95em;
}

nav a:hover {
    background: #34495e;
    color: #3498db;
}

nav a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 0;
    height: 3px;
    background: #3498db;
    transition: all 0.3s ease;
    transform: translateX(-50%);
}

nav a:hover::after {
    width: 80%;
}

/* 활성 메뉴 표시 */
nav a.active {
    background: #34495e;
    color: #3498db;
}

/* 푸터 스타일 */
footer {
    background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
    position: fixed;
    bottom: 0;
    width: 100%;
    padding: 15px 0;
    box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
}

footer h2 {
    text-align: center;
    color: white;
    font-size: 0.9em;
    font-weight: 400;
    letter-spacing: 0.5px;
}

/* 컨텐츠 영역 여백 (푸터 고정으로 인한) */
body {
    padding-bottom: 60px;
}

/* 반응형 디자인 */
@media screen and (max-width: 768px) {
    header h1 {
        font-size: 1.3em;
        padding: 0 10px;
    }
    
    nav ul {
        flex-direction: column;
    }
    
    nav a {
        width: 100%;
        text-align: center;
        padding: 15px;
        border-bottom: 1px solid #34495e;
    }
    
    footer h2 {
        font-size: 0.8em;
        padding: 0 10px;
    }
}
</style>
</head>
<body>
<header>
    <h1>병원 검사 관리 시스템</h1>
</header>
<nav>
    <ul>
        <li><a href="index.jsp">홈</a></li>
        <li><a href="pselect.jsp">환자 조회</a></li>
        <li><a href="insert.jsp">검사결과 입력</a></li>
        <li><a href="tselect.jsp">검사결과 조회</a></li>
        <li><a href="cselect.jsp">지역별 검사건수</a></li>
    </ul>
</nav>
<footer>
    <h2>Copyright © 2020 Hospital Management System. All Rights Reserved.</h2>
</footer>
</body>
</html>
