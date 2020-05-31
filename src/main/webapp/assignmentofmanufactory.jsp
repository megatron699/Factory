<%@ page import="models.AssignmentOfManufactory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Управление назначениями цехов</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/style.css"/>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <%--    <a class="navbar-brand" href="#">Navbar</a>--%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="index">На главную<span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="store">Управление складами</a>
            <a class="nav-item nav-link" href="worker">Управление работниками</a>
            <a class="nav-item nav-link" href="manufactory" >Управление цехами</a>

        </div>
    </div>
</nav>

<%--
<a href="store">Перейти к управлению данными о складах</a>
<a href="worker">Перейти к управлению данными о работниках</a>
<a href="manufactory">Перейти к управлению данными о цехах</a>
--%>

<form action="assign" method="POST">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Наименование назначения</th>
        </tr>
        </thead>
        <tr>
            <td title="Введите назначение цеха">
                <input type="text" name="assign" placeholder="Введите назначение"
                       title="Введите назначение цеха" width="100%" required>
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="add">Сохранить</button>
            </td>
        </tr>
    </table>
</form>

<form action="assign" method="get">

    <table>
        <tr>
            <td>
                <select name="search">
                    <option value="assign">Название цеха</option>
                </select>
            </td>
            <td>
                <input type="search" placeholder="Поиск..." name="searchfield">
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="searching" value="search">Найти</button>
                <button type="submit" class="btn btn-secondary" name="searching" value="reset">Сбросить</button>
            </td>
        </tr>
    </table>

</form>

    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование назначения</th>
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
            <td>
                <input type="text" name="id" value="<%=assignmentOfManufactory.getIdAssignmentOfManufactory()%>"
                       title="<%=Long.toString(assignmentOfManufactory.getIdAssignmentOfManufactory())%>" readonly required>
            </td>
            <td width="100%">
                <input type="text" name="assign" value="<%=assignmentOfManufactory.getAssign()%>"
                       title="<%=assignmentOfManufactory.getAssign()%>">
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="edit">Изменить</button>
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="delete">Удалить</button>
            </td>
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


</body>
</html>
