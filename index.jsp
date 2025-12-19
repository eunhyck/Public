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
    background-color: #f5f5f5;
    line-height: 1.6;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.main-content {
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    padding: 40px;
    margin-top: 20px;
}

h1 {
    color: #2c3e50;
    text-align: center;
    margin-bottom: 30px;
    font-size: 2em;
    border-bottom: 3px solid #3498db;
    padding-bottom: 15px;
}

.intro-section {
    margin: 30px 0;
}

.intro-section h2 {
    color: #34495e;
    margin-bottom: 15px;
    font-size: 1.5em;
}

.intro-section p {
    color: #555;
    line-height: 1.8;
    margin-bottom: 15px;
}

.features {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-top: 30px;
}

.feature-card {
    background: #f8f9fa;
    padding: 25px;
    border-radius: 8px;
    border-left: 4px solid #3498db;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.feature-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.feature-card h3 {
    color: #2c3e50;
    margin-bottom: 10px;
    font-size: 1.2em;
}

.feature-card p {
    color: #666;
    font-size: 0.95em;
}

.action-buttons {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 40px;
    flex-wrap: wrap;
}

.btn {
    padding: 12px 30px;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-primary {
    background-color: #3498db;
    color: white;
}

.btn-primary:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
}

.btn-secondary {
    background-color: #2ecc71;
    color: white;
}

.btn-secondary:hover {
    background-color: #27ae60;
    transform: translateY(-2px);
}
</style>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="container">
    <div class="main-content">
        <h1>병원 검사 관리 시스템</h1>
        
        <div class="intro-section">
            <h2>시스템 소개</h2>
            <p>본 시스템은 병원의 검사 업무를 효율적으로 관리하기 위한 웹 기반 솔루션입니다.</p>
            <p>환자 정보 조회부터 검사 결과 입력까지 모든 과정을 통합 관리할 수 있습니다.</p>
        </div>
        
        <div class="features">
            <div class="feature-card">
                <h3>환자 관리</h3>
                <p>환자 정보를 체계적으로 조회하고 관리할 수 있습니다.</p>
            </div>
            
            <div class="feature-card">
                <h3>검사 입력</h3>
                <p>다양한 검사 항목에 대한 결과를 신속하게 입력할 수 있습니다.</p>
            </div>
            
            <div class="feature-card">
                <h3>검사 현황</h3>
                <p>진행 중인 검사와 완료된 검사를 실시간으로 확인할 수 있습니다.</p>
            </div>
            
            <div class="feature-card">
                <h3>통계 분석</h3>
                <p>검사 데이터를 기반으로 한 통계 및 분석 기능을 제공합니다.</p>
            </div>
        </div>
        
        <div class="action-buttons">
            <a href="insert.jsp" class="btn btn-primary">검사 결과 입력</a>
            <a href="pselect.jsp" class="btn btn-secondary">환자 조회</a>
        </div>
    </div>
</div>
</body>
</html>
