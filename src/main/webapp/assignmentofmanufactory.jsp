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
<a href="store">Перейти к управлению данными о складах</a>
<a href="worker">Перейти к управлению данными о работниках</a>
<a href="manufactory">Перейти к управлению данными о цехах</a>

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
