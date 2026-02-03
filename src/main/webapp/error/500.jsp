<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - サーバーエラー</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>500 エラー</h1>
        
        <div class="error-message">
            <h2>サーバーエラーが発生しました</h2>
            <p>申し訳ございません。サーバー内部でエラーが発生しました。</p>
            <p>しばらく時間をおいてから再度お試しください。</p>
        </div>
        
        <% if (exception != null && request.getAttribute("javax.servlet.error.exception") != null) { %>
            <div class="info">
                <h3>エラー詳細（開発モード）</h3>
                <p><strong>エラータイプ:</strong> <%= exception.getClass().getName() %></p>
                <p><strong>メッセージ:</strong> <%= exception.getMessage() %></p>
            </div>
        <% } %>
        
        <div class="actions">
            <a href="${pageContext.request.contextPath}/calculator.jsp" class="btn-back">
                ← 電卓に戻る
            </a>
        </div>
        
        <footer>
            <p>Servlet + JSP 電卓デモアプリケーション</p>
            <p>Powered by Open Liberty</p>
        </footer>
    </div>
</body>
</html>