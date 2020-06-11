<%@ page import="models.AssignmentOfManufactory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Управление назначениями цехов</title>
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
            <a class="nav-item nav-link active" href="index">На главную<span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link active" href="store">Управление складами</a>
            <a class="nav-item nav-link active" href="worker">Управление работниками</a>
            <a class="nav-item nav-link active" href="manufactory" >Управление цехами</a>

        </div>
    </div>
</nav>

<%--
<a href="store">Перейти к управлению данными о складах</a>
<a href="worker">Перейти к управлению данными о работниках</a>
<a href="manufactory">Перейти к управлению данными о цехах</a>
--%>
<div class="my-table">
<form action="assign" method="POST">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Назначение цеха</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tr>
            <div class="input-group mb-3">
            <td title="Введите назначение цеха">
                <input type="text" class="form-control" name="assign" placeholder="Введите назначение"
                       title="Введите назначение цеха" required>
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="add">Сохранить</button>
            </td>
            </div>
        </tr>
    </table>
</form>

<form action="assign" method="get">

    <table class="table">
        <tr>
            <div class="input-group mb-3">
            <td>
                <select class="form-control" name="search">
                    <option class="form-control" value="assign">Назначение цеха</option>
                </select>
            </td>
            <td>
                <input type="search" class="form-control" placeholder="Поиск..." name="searchfield">
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="searching" value="search">Найти</button>
                <button type="submit" class="btn btn-secondary" name="searching" value="reset">Сбросить</button>
            </td>
            </div>
        </tr>
    </table>

</form>

    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col"></th>
            <th scope="col">Назначение цеха</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <%
            List<AssignmentOfManufactory> assignmentofmanufactories = (List<AssignmentOfManufactory>) request.getAttribute("assignmentofmanufactories");
            if (assignmentofmanufactories != null) {
                //for (PlaceOfWork placeOfWork : placeOfWorks) {
                for (AssignmentOfManufactory assignmentOfManufactory: assignmentofmanufactories) {


        %>
        <form action="assign" method="POST">
        <tr>
            <div class="input-group mb-3">
            <td>
                <input type="text" hidden class="form-control" name="id" value="<%=assignmentOfManufactory.getIdAssignmentOfManufactory()%>"
                       title="<%=Long.toString(assignmentOfManufactory.getIdAssignmentOfManufactory())%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="assign" value="<%=assignmentOfManufactory.getAssign()%>"
                       title="<%=assignmentOfManufactory.getAssign()%>">
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="edit">Изменить</button>
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="delete">Удалить</button>
            </td>
            </div>
        </tr>
        </form>
        <%
            }
        }

        // }
        else {
        %>
        Здесь ничего нет...
        <%
            }
        %>
    </table>

</div>
</body>
</html>
