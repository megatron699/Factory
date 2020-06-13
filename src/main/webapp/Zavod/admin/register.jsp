<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 10.06.2020
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <%--        <a class="navbar-brand" href="#">Navbar</a>--%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="index">На главную</a>
            <a class="nav-item nav-link active" href="store">Управление складами</a>
            <a class="nav-item nav-link active" href="manufactory">Управление цехами</a>
            <a class="nav-item nav-link active" href="assign">Управление назначениями цехов</a>
            <form action="worker" method="post">
                <button type="submit" name="action" value="exit" class="nav-item btn nav-link active">Выйти</button>
            </form>
        </div>
    </div>
</nav>

<div class="my-panel tiny-panel">
    <div style="padding: 15px; padding-bottom: 5px">
    <form action="register" method="post">
        <input type="text" hidden name="register" value="<%=request.getAttribute("register")%>">
        <table style="text-align: center">
            <tr>
                <td>
                    <label for="username">Логин</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="password">Пароль</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="passconfirm">Подтверждение пароля</label>
                    <input type="password" id="passconfirm" name="passconfirm" class="form-control" required>
                </td>
            </tr>
            <tr>
                <td>

                    <%--  </td>
                      <td>--%>
                    <input type="checkbox" id="userrole" name="userrole" class="form-check-input"> <label for="userrole">Администратор</label>
                </td>
            </tr>
            <%
                if(request.getAttribute("status") == "username") {
            %>
            <tr>
                <td>
                    <label class="text-danger">Такой логин уже существует</label>
                </td>
            </tr>
            <%
                } else if (request.getAttribute("status") == "password") {
            %>
            <tr>
                <td>
                    <label class="text-danger">Пароли не совпадают</label>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td>
                    <button type="submit" class="btn btn-secondary">Зарегистрировать</button>
                </td>

            </tr>
        </table>
    </form>
    </div>

</div>
<div class="tiny-panel" style="text-align: center">
<a href="worker" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Вернуться к работникам</a>
</div>
</body>
</html>
