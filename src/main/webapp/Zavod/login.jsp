<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 10.06.2020
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Авторизация</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
</head>
<body class="main-page">
<div class="my-panel tiny-panel">
    <form action="login" method="post">
        <div class="input-group mb-3">
            <div class="form-control">

                <input type="text" name="username" required>
            </div>
            <div class="form-control">
                <input type="password" name="password" required>
            </div>

            <button type="submit" class="btn btn-secondary">Войти</button>
        </div>
    </form>
</div>
</body>
</html>
