<%@ page import="models.Manufactory" %>
<%@ page import="java.util.List" %>
<%@ page import="models.AssignmentOfManufactory" %>
<%@ page import="DAO.AssignmentOfManufactoryDao" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Управление цехами</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
    <script src="../../js/bootstrap.min.js"></script>
</head>
<body>



<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="index">На главную</a>
            <a class="nav-item nav-link active" href="store">Управление складами</a>
            <a class="nav-item nav-link active" href="worker">Управление работниками</a>
            <a class="nav-item nav-link active" href="assign" >Управление назначениями цехов</a>
            <form action="register" method="post">
                <button type="submit" name="action" value="exit" class="nav-item btn nav-link active">Выйти</button>
            </form>
        </div>
    </div>
</nav>

<div class="my-table">
<form action="manufactory" method="POST">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Название цеха</th>
            <th scope="col">Количество произведённого на данный момент</th>
            <th scope="col">Количество небходимого производства за месяц</th>
            <th scope="col">Назначение цеха</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tr>
            <div class="input-group mb-3">
            <td>
                <input type="text" class="form-control" name="placeofworkname" placeholder="Введите название"
                       title="Введите название цеха" required>
            </td>
            <td title="Введите количество произведённого на данный момент">
                <input type="number" class="form-control" name="amountcurrently" placeholder="Введите количество"
                       title="Введите количество произведённого на данный момент" min="0" required>
            </td>
            <td>
                <input type="number" class="form-control" name="amountpermonth" placeholder="Введите количество"
                       title="Введите количество, сколько необходимо произвести за месяц" min="0" required>
            </td>
            <td>
                <select class="form-control" type="text" name="assignmentofmanufactory">
                    <%
                        List<AssignmentOfManufactory> assignmentOfManufactories = (List<AssignmentOfManufactory>) request.getAttribute("assignmentofmanufactories");
                        for (AssignmentOfManufactory assignmentOfManufactory : assignmentOfManufactories) {
                    %>
                    <option value="<%=assignmentOfManufactory.getIdAssignmentOfManufactory()%>">
                        <%=assignmentOfManufactory.getAssign()%>
                    </option>
                    <%
                        }
                    %>
                </select>

            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="add">Сохранить</button>
            </td>
            </div>
        </tr>
    </table>
</form>

<form action="manufactory" method="get">

    <table class="table">
        <tr>
            <div class="input-group mb-3">
            <td>
                <select class="form-control" name="search">
                    <option class="form-control" value="place_of_work_name">Название цеха</option>
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
        <thead  class="thead-dark">
        <tr>
            <th scope="col"></th>
            <th scope="col">Название цеха</th>
            <th scope="col">Количество произведённого на данный момент</th>
            <th scope="col">Количество небходимого производства за месяц</th>
            <th scope="col">Назначение цеха</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <%
            List<Manufactory> manufactories = (List<Manufactory>) request.getAttribute("manufactories");
            if (manufactories != null) {
                for (Manufactory manufactory : manufactories) {
        %>
        <form action="manufactory" method="POST">
        <tr>
            <div class="input-group mb-3">
            <td>
                <input type="text" hidden class="form-control" name="id" value="<%=manufactory.getIdPlaceOfWork()%>"
                       title="<%=Long.toString(manufactory.getIdPlaceOfWork())%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="placeofworkname" value="<%=manufactory.getPlaceOfWorkName()%>"
                       title="<%=manufactory.getPlaceOfWorkName()%>" required>
            </td>
            <td>
                <input type="number" class="form-control" name="amountcurrently" value="<%=manufactory.getAmountCurrently()%>"
                       title="<%=manufactory.getAmountCurrently()%>" min="0" required>
            </td>
            <td>
                <input type="number" class="form-control" name="amountpermonth" value="<%=manufactory.getAmountPerMonth()%>"
                       title="<%=manufactory.getAmountPerMonth()%>" min="0" required>
            </td>
            <td>
                <select class="form-control" type="text" name="assignmentofmanufactory">
                    <%
                        try{
                        AssignmentOfManufactoryDao assignmentOfManufactoryDao = new AssignmentOfManufactoryDao();
                        AssignmentOfManufactory assignmentOfThisManufactory = assignmentOfManufactoryDao.get(manufactory.getAssignmentOfManufactory().getIdAssignmentOfManufactory());
                    %>
                    <option value="<%=assignmentOfThisManufactory.getIdAssignmentOfManufactory()%>" selected disabled>
                        <%=assignmentOfThisManufactory.getAssign()%>
                    </option>
                    <%
                        } catch (Exception ex) {%>
                    <option value="" selected disabled></option>
                    <%}
                        for (AssignmentOfManufactory assignmentOfManufactory : assignmentOfManufactories) {
                    %>
                    <option value="<%=assignmentOfManufactory.getIdAssignmentOfManufactory()%>">
                        <%=assignmentOfManufactory.getAssign()%>
                    </option>
                    <%
                        }
                    %>
                </select>
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
        } else {
        %>
        Здесь ничего нет...
        <%
            }
        %>
    </table>
</div>

</body>
</html>
