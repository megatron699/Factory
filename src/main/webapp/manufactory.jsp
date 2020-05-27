<%@ page import="models.Manufactory" %>
<%@ page import="java.util.List" %>
<%@ page import="models.AssignmentOfManufactory" %>
<%@ page import="DAO.AssignmentOfManufactoryDao" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Управление цехами</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/style.css"/>
</head>
<body>
<a href="store">Перейти к управлению данными о складах</a>
<a href="worker">Перейти к управлению данными о работниках</a>
<a href="assign">Перейти к управлению данными о назначении цехов</a>

<form action="manufactory" method="POST">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Название цеха</th>
            <th scope="col">Количество произведённого <br> на данный момент</th>
            <th scope="col">Количество небходимого <br> производства за месяц</th>
            <th scope="col">Назначение цеха</th>
        </tr>
        </thead>
        <tr>
            <td title="Введите название цеха"><input type="text" name="placeofworkname" placeholder="Введите название"
                       title="Введите название цеха"></td>
            <td title="Введите количество произведённого на данный момент"><input type="number" name="amountcurrently" placeholder="Введите количество"
                       title="Введите количество произведённого на данный момент" min="0"></td>
            <td title="Введите, сколько небходимо произвести за месяц"><input type="number" name="amountpermonth" placeholder="Введите количество"
                       title="Введите количество, сколько необходимо произвести за месяц" min="0"></td>
           <%-- <td title="Введите ID назначения цеха"><input type="number" name="idassign" placeholder="Введите ID"
                       title="Введите ID назначения цеха" min="0"></td>
            <td>--%>
            <td>
                <select type="text" name="assignmentofmanufactory">
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
        </tr>
    </table>
</form>


    <table class="table table-striped">
        <thead  class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Название цеха</th>
            <th scope="col">Количество произведённого <br> на данный момент</th>
            <th scope="col">Количество небходимого <br> производства за месяц</th>
            <th scope="col">Назначение цеха</th>
        </tr>
        </thead>
        <%
            List<Manufactory> manufactories = (List<Manufactory>) request.getAttribute("manufactories");
            if (manufactories != null) {
                for (Manufactory manufactory : manufactories) {
        %>
        <form action="manufactory" method="POST">
        <tr>
            <td>
                <input type="text" name="id" value="<%=manufactory.getIdPlaceOfWork()%>"
                       title="<%=Long.toString(manufactory.getIdPlaceOfWork())%>" readonly>
            </td>
            <td>
                <input type="text" name="placeofworkname" value="<%=manufactory.getPlaceOfWorkName()%>"
                       title="<%=manufactory.getPlaceOfWorkName()%>">
            </td>
            <td>
                <input type="number" name="amountcurrently" value="<%=manufactory.getAmountCurrently()%>"
                       title="<%=manufactory.getAmountCurrently()%>" min="0">
            </td>
            <td>
                <input type="number" name="amountpermonth" value="<%=manufactory.getAmountPerMonth()%>"
                       title="<%=manufactory.getAmountPerMonth()%>" min="0">
            </td>

          <%--  <td>
                <% if(manufactory.getAssignmentOfManufactory() != null) { %>
                <input type="number" name="idassign" value="<%=manufactory.getAssignmentOfManufactory().getIdAssignmentOfManufactory()%>"
                       title="<%=manufactory.getAssignmentOfManufactory().getIdAssignmentOfManufactory()%>" min="0">
                <%  } else {
                %>
                <input type="number" name="idassign" value="" placeholder="Введите id" min="0">
                <%
                    }
                %>
            </td>--%>

            <td>
                <select type="text" name="assignmentofmanufactory">
                    <%
                        //long idassign = manufactory.getAssignmentOfManufactory().getIdAssignmentOfManufactory();
                        //if(Objects.isNull(idassign))
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
                        //   List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
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


</body>
</html>
