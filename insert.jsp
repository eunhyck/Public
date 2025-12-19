<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과 입력</title>
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
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
}

.form-wrapper {
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

table {
    width: 100%;
    border-collapse: collapse;
}

tr {
    border-bottom: 1px solid #e0e0e0;
}

td {
    padding: 15px;
    vertical-align: middle;
}

td:first-child {
    width: 30%;
    font-weight: 600;
    color: #34495e;
    background-color: #f8f9fa;
}

input[type="text"] {
    width: 60%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 0.95em;
    transition: border-color 0.3s ease;
}

input[type="text"]:focus {
    outline: none;
    border-color: #3498db;
    box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
}

select {
    width: 60%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 0.95em;
    background-color: white;
    cursor: pointer;
}

select:focus {
    outline: none;
    border-color: #3498db;
}

input[type="radio"] {
    margin: 0 5px 0 15px;
    cursor: pointer;
}

label {
    margin-right: 10px;
    cursor: pointer;
}

.hint {
    color: #7f8c8d;
    font-size: 0.85em;
    margin-left: 10px;
}

.button-group {
    text-align: center;
    padding-top: 20px;
}

.btn {
    padding: 12px 30px;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    margin: 0 10px;
    transition: all 0.3s ease;
}

.btn-submit {
    background-color: #3498db;
    color: white;
}

.btn-submit:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.btn-reset {
    background-color: #95a5a6;
    color: white;
}

.btn-reset:hover {
    background-color: #7f8c8d;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<div class="container">
		<div class="form-wrapper">
			<h2>검사결과 입력</h2>
			<form action="insertdetail.jsp" name="fr">
				<table>
					<tr>
						<td>환자 코드</td>
						<td>
							<input type="text" name="p_no">
							<span class="hint">예) 1001</span>
						</td>
					</tr>
					<tr>
						<td>검사명</td>
						<td>
							<select name="t_code">
								<option value="no">검사명</option>
								<option value="T001">[T001]결핵</option>
								<option value="T002">[T002]장티푸스</option>
								<option value="T003">[T003]수두</option>
								<option value="T004">[T004]홍역</option>
								<option value="T005">[T005]콜레라</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>검사시작일</td>
						<td>
							<input type="text" name="t_sdate">
							<span class="hint">예) 20200101</span>
						</td>
					</tr>
					<tr>
						<td>검사상태</td>
						<td>
							<input type="radio" name="t_status" value="1" id="status1">
							<label for="status1">검사 중</label>
							<input type="radio" name="t_status" value="2" id="status2">
							<label for="status2">검사 완료</label>
						</td>
					</tr>
					<tr>
						<td>검사완료일</td>
						<td>
							<input type="text" name="t_ldate">
							<span class="hint">예) 20200101</span>
						</td>
					</tr>
					<tr>
						<td>검사결과</td>
						<td>
							<input type="radio" name="t_result" value="X" id="result1">
							<label for="result1">미입력</label>
							<input type="radio" name="t_result" value="P" id="result2">
							<label for="result2">양성</label>
							<input type="radio" name="t_result" value="N" id="result3">
							<label for="result3">음성</label>
						</td>
					</tr>
				</table>
				<div class="button-group">
					<input type="button" value="등록" class="btn btn-submit" onclick="ou(); return false;">
					<input type="reset" value="다시쓰기" class="btn btn-reset">
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		function ou() {
			if(document.fr.p_no.value=="") {
				alert("환자코드를 입력하시오.");
				document.fr.p_no.focus();
			} else if(document.fr.t_code.value=="no") {
				alert("검사명를 고르시오.");
				document.fr.t_code.focus();
			} else if(document.fr.t_sdate.value=="") {
				alert("검사시작일를 입력하시오.");
				document.fr.t_sdate.focus();
			} else if(document.fr.t_status.value=="") {
				alert("검사상태를 고르시오.");
				document.fr.t_status.focus();
			} else if(document.fr.t_ldate.value=="") {
				alert("검사완료일를 입력하시오.");
				document.fr.t_ldate.focus();
			} else if(document.fr.t_result.value=="") {
				alert("검사결과를 고르시오.");
				document.fr.t_result.focus();
			} else{
				document.fr.submit();
			}
		}
	</script>
</body>
</html>
