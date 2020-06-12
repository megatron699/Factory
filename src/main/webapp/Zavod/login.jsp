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
    <div style="padding: 15px; padding-bottom: 5px">
    <form action="login" method="post">
        <table style="text-align: center">
            <tr>
                <td>
                <div>
                <label for="username">Логин</label>
                <input type="text" id="username" name="username" class="form-control" required>
                </div>
                </td>
            </tr>
            <tr>
                <td>
                <div>
            <label for="password">Пароль</label>
                <input type="password" id="password" name="password" class="form-control" required>
                </div>
                </td>
            </tr>

            <%
            if (!Boolean.parseBoolean(request.getAttribute("success").toString())){
            %>
            <tr>
                <td>
                <div>
            <label class="text-danger">Неверный логин и/или пароль</label>
                </div>
                </td>
            </tr>
            <%
            }
            %>
            <tr>

                    <td style="padding-top: 15px">
                        <div>
            <button type="submit" class="btn btn-secondary">Войти</button>
                        </div>
                    </td>

            </tr>
        </table>
    </form>
    </div>
</div>
</body>
</html>
