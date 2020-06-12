<%@ page import="models.Worker" %>
<%@ page import="java.util.List" %>
<%@ page import="models.PlaceOfWork" %>
<%@ page import="DAO.PlaceOfWorkDao" %>
<%@ page import="DAO.WorkerDao" %>
<%@ page import="models.Attendance" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Управление работниками</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <%--    <a class="navbar-brand" href="#">Navbar</a>--%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <%--            <a class="nav-item nav-link" href="http://samara.nebar.ru/">Отдых после тяжелого рабочего дня</a>--%>
        </div>
    </div>
</nav>


<%--<a href="store">Перейти к управлению данными о складах</a>
<a href="manufactory">Перейти к управлению данными о цехах</a>
<a href="assign">Перейти к управлению данными о назначении цехов</a>--%>
<div class="my-table">
<table class="table table-striped">
    <thead class="thead-dark">
    <tr>
        <th scope="col"></th>
        <th scope="col">Фамилия</th>
        <th scope="col">Имя</th>
        <th scope="col">Отчество</th>
        <th scope="col">Должность</th>
        <th scope="col">Место работы</th>
        <th scope="col">Отпуск</th>
        <th scope="col">Больничный</th>
        <th scope="col"></th>
        <th scope="col"></th>
        <th scope="col"></th>

    </tr>
    </thead>
    <%

        //List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
        Worker worker = (Worker) request.getAttribute("worker");
        if (worker != null) {
    %>

    <tr>
        <div class="input-group mb-3">
            <td>
                <input type="text" hidden class="form-control" name="id" value="<%=worker.getIdWorker()%>"
                       title="<%=Long.toString(worker.getIdWorker())%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="lastname" value="<%=worker.getLastname()%>"
                       title="<%=worker.getFirstname()%>" readonly>
            </td>

            <td>
                <input type="text" class="form-control" name="firstname" value="<%=worker.getFirstname()%>"
                       title="<%=worker.getLastname()%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="middlename" value="<%=worker.getMiddlename()%>"
                       title="<%=worker.getMiddlename()%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="post" value="<%=worker.getPost()%>"
                       title="<%=worker.getPost()%>" readonly>
            </td>
            <td width="12%">
                <%
                    PlaceOfWorkDao placeOfWorkDao = new PlaceOfWorkDao();
                    //long idassign = manufactory.getAssignmentOfManufactory().getIdAssignmentOfManufactory();
                    //if(Objects.isNull(idassign))
                    try {
                        PlaceOfWork thisPlaceOfWork = placeOfWorkDao.get(worker.getPlaceOfWork().getIdPlaceOfWork());
                %>
                <input type="text" class="form-control" title="<%=thisPlaceOfWork.getPlaceOfWorkName()%>"
                       value="<%=thisPlaceOfWork.getPlaceOfWorkName()%>" readonly>

                <%
                } catch (Exception ex) {
                %>
                <input type="text" class="form-control" value="" readonly>
                    <%
                        }
                    %>
            </td>

            <td>
                <div style="text-align: center">
                    <%
                        if (worker.isVacation()) {
                    %>
                    <input type="checkbox" class="form-check-input" onclick="return false" name="vacation" checked readonly>
                    <%
                    } else {
                    %>
                    <input type="checkbox" class="form-check-input" onclick="return false" name="vacation" readonly>
                    <%
                        }
                    %>
                </div>
            </td>
            <td>
                <div style="text-align: center">
                    <%
                        if (worker.isSickLeave()) {
                    %>
                    <input type="checkbox" class="form-check-input" onclick="return false" name="sickLeave" checked readonly>
                    <%
                    } else {
                    %>
                    <input type="checkbox" class="form-check-input" onclick="return false" name="sickLeave" readonly>
                    <%
                        }
                    %>
                </div>
            </td>
        </div>
        <form action="worker" method="post">
            <td>
                <input type="text" hidden class="form-control" name="id" value="<%=worker.getIdWorker()%>"
                       title="<%=Long.toString(worker.getIdWorker())%>" readonly>
            </td>
            <td>
                <%

                    if (worker.isPresence()) {

                %>
                <input type="text" class="form-control" name="presence" value="Присутствует" readonly>
                <%

                } else {
                %>
                <input type="text" class="form-control" name="presence" value="Отсутствует" readonly>
                <%
                    }

                %>
                <button type="submit" class="btn btn-secondary" name="action" value="inOut">Пришёл/Ушёл</button>
            </td>
        </form>
        <td>
            <form action="attendance" method="get">

                <button type="submit" class="btn btn-secondary" name="attendance" value="<%=worker.getIdWorker()%>">
                    Посещаемость
                </button>
            </form>
        </td>

    </tr>
    <%

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
