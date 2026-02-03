<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>電卓アプリケーション</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>電卓アプリケーション</h1>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <div class="calculator-form">
            <form action="${pageContext.request.contextPath}/calculate" method="post">
                <div class="form-group">
                    <label for="num1">数値1:</label>
                    <input type="text" id="num1" name="num1" 
                           placeholder="数値を入力してください" 
                           value="${param.num1 != null ? param.num1 : ''}" 
                           required>
                </div>
                
                <div class="form-group">
                    <label for="operator">演算子:</label>
                    <select id="operator" name="operator" required>
                        <option value="">選択してください</option>
                        <option value="add" ${param.operator == 'add' ? 'selected' : ''}>+ (加算)</option>
                        <option value="subtract" ${param.operator == 'subtract' ? 'selected' : ''}>- (減算)</option>
                        <option value="multiply" ${param.operator == 'multiply' ? 'selected' : ''}>× (乗算)</option>
                        <option value="divide" ${param.operator == 'divide' ? 'selected' : ''}>÷ (除算)</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="num2">数値2:</label>
                    <input type="text" id="num2" name="num2" 
                           placeholder="数値を入力してください" 
                           value="${param.num2 != null ? param.num2 : ''}" 
                           required>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-calculate">計算する</button>
                </div>
            </form>
        </div>
        
        <div class="info">
            <h3>使い方</h3>
            <ul>
                <li>数値1と数値2に計算したい数値を入力してください</li>
                <li>演算子を選択してください（+、-、×、÷）</li>
                <li>「計算する」ボタンをクリックすると結果が表示されます</li>
                <li>小数点を含む数値も計算できます</li>
            </ul>
        </div>
        
        <footer>
            <p>Servlet + JSP 電卓デモアプリケーション</p>
            <p>Powered by Open Liberty</p>
        </footer>
    </div>
</body>
</html>