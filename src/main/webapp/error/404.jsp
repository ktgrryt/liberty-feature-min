<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - ページが見つかりません</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>404 エラー</h1>
        
        <div class="error-message">
            <h2>ページが見つかりません</h2>
            <p>お探しのページは存在しないか、移動した可能性があります。</p>
        </div>
        
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