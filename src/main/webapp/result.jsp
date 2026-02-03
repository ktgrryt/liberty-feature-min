<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>計算結果 - 電卓アプリケーション</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>計算結果</h1>
        
        <div class="result-display">
            <div class="calculation">
                <h2>計算式</h2>
                <p class="formula">
                    <%= request.getAttribute("num1") %> 
                    <%= request.getAttribute("operator") %> 
                    <%= request.getAttribute("num2") %>
                </p>
            </div>
            
            <div class="result">
                <h2>結果</h2>
                <p class="result-value">
                    <%= request.getAttribute("result") %>
                </p>
            </div>
        </div>
        
        <div class="actions">
            <a href="${pageContext.request.contextPath}/calculator.jsp" class="btn-back">
                ← 電卓に戻る
            </a>
        </div>
        
        <div class="result-info">
            <h3>計算詳細</h3>
            <table class="detail-table">
                <tr>
                    <th>項目</th>
                    <th>値</th>
                </tr>
                <tr>
                    <td>数値1</td>
                    <td><%= request.getAttribute("num1") %></td>
                </tr>
                <tr>
                    <td>演算子</td>
                    <td><%= request.getAttribute("operator") %></td>
                </tr>
                <tr>
                    <td>数値2</td>
                    <td><%= request.getAttribute("num2") %></td>
                </tr>
                <tr class="result-row">
                    <td><strong>計算結果</strong></td>
                    <td><strong><%= request.getAttribute("result") %></strong></td>
                </tr>
            </table>
        </div>
        
        <footer>
            <p>Servlet + JSP 電卓デモアプリケーション</p>
            <p>Powered by Open Liberty</p>
        </footer>
    </div>
</body>
</html>