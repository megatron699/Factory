<%@ page import="models.Attendance" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Посещаемость</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <%--        <a class="navbar-brand" href="#">Navbar</a>--%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="index">На главную</a>
            <a class="nav-item nav-link active" href="store">Управление складами</a>
            <a class="nav-item nav-link active" href="manufactory">Управление цехами</a>
            <a class="nav-item nav-link active" href="assign" >Управление назначениями цехов</a>
        </div>
    </div>
</nav>

<div class="my-table">
<table class="table table-striped">
    <thead class="thead-dark">
    <tr>
        <th scope="col"></th>
        <th scope="col">Время прихода</th>
        <th scope="col">Время ухода</th>
        <th scope="col"></th>
        <th scope="col"></th>
    </tr>
    </thead>
    <%
        //List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
        List<Attendance> attendances = (List<Attendance>) request.getAttribute("attendances");
        if (attendances != null) {
            //for (PlaceOfWork placeOfWork : placeOfWorks) {
            for (Attendance attendance: attendances) {


    %>
    <form action="attendance" method="POST">
        <tr>
            <div class="input-group mb-3">
            <td>
                <input type="text" class="form-control" hidden name="id" value="<%=attendance.getIdReport()%>"
                       title="<%=Long.toString(attendance.getIdReport())%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="dateinwork" value="<%=attendance.getFormatDateInWork()%>"
                       title="<%=attendance.getFormatDateInWork()%>" readonly>
            </td>

            <td>
                <%
                    if(attendance.getDateOutWork() != null){
                %>
                <input type="text" class="form-control" name="dateoutwork" value="<%=attendance.getFormatDateOutWork()%>"
                       title="<%=attendance.getFormatDateOutWork()%>" readonly>
                <%
                    } else {
                %>
                <input type="text" class="form-control" name="dateoutwork" value="" readonly>
                <%
                    }
                %>
            </td>
            <td>

                <input type="text" class="form-control" hidden name="idworker" value="<%=attendance.getWorker().getIdWorker()%>"
                       title="<%=attendance.getWorker().getIdWorker()%>>" readonly>
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
    <a href="worker" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Вернуться к работникам</a>
</div>
</body>
</html>
