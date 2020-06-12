<%@ page import="models.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 12.06.2020
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Логины пользователей</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <%--    <a class="navbar-brand" href="#">Navbar</a>--%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="index">На главную</a>
            <a class="nav-item nav-link active" href="store">Управление складами</a>
            <a class="nav-item nav-link active" href="manufactory">Управление цехами</a>
            <a class="nav-item nav-link active" href="assign" >Управление назначениями цехов</a>
            <form action="workerlogin" method="post">
                <button type="submit" name="action" value="exit" class="nav-item btn nav-link active">Выйти</button>
            </form>
        </div>
    </div>
</nav>
<div class="my-table">
<table class="table table-striped">
    <thead class="thead-dark">
    <tr>

        <th scope="col">Логин</th>
        <th scope="col">Пароль</th>
        <th scope="col">Администратор</th>
    </tr>
    </thead>
    <%
        //List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
        User user = (User) request.getAttribute("user");

            //for (PlaceOfWork placeOfWork : placeOfWorks) {


    %>
        <tr>
            <div class="input-group mb-3">
                <td>
                    <input type="text" class="form-control" name="id" value="<%=user.getUsername()%>"
                           title="<%=user.getUsername()%>" readonly>
                </td>
                <td>
                    <input type="text" class="form-control" name="placeofworkname" value="<%=user.getPassword()%>"
                           title="<%=user.getPassword()%>" readonly>
                </td>

                <td>
                    <input type="text" class="form-control" name="typeofstored" value="<%=user.isUserRole()%>"
                           title="<%=user.isUserRole()%>" readonly>
                </td>
            </div>
        </tr>

</table>
</div>
<a href="worker" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Вернуться к работникам</a>
</body>
</html>
