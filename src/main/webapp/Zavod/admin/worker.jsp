<%@ page import="models.Worker" %>
<%@ page import="java.util.List" %>
<%@ page import="models.PlaceOfWork" %>
<%@ page import="DAO.PlaceOfWorkDao" %>
<%@ page import="DAO.WorkerDao" %>
<%@ page import="models.Attendance" %>
<%@ page import="DAO.UserDao" %>
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
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="index">На главную</a>
            <a class="nav-item nav-link active" href="store">Управление складами</a>
            <a class="nav-item nav-link active" href="manufactory">Управление цехами</a>
            <a class="nav-item nav-link active" href="assign" >Управление назначениями цехов</a>
            <%--            <a class="nav-item nav-link" href="http://samara.nebar.ru/">Отдых после тяжелого рабочего дня</a>--%>
        </div>
    </div>
</nav>


<%--<a href="store">Перейти к управлению данными о складах</a>
<a href="manufactory">Перейти к управлению данными о цехах</a>
<a href="assign">Перейти к управлению данными о назначении цехов</a>--%>
<div class="my-table">
<form action="worker" method="POST">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Фамилия</th>
            <th scope="col">Имя</th>
            <th scope="col">Отчество</th>
            <th scope="col">Должность</th>
            <th scope="col">Место работы</th>
            <th scope="col">Отпуск</th>
            <th scope="col">Больничный</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tr>
            <div class="input-group mb-3">
            <td  title="Введите имя работника">
                <input type="text" class="form-control" name="lastname" placeholder="Введите фамилию"
                       title="Введите фамилию работника" required>
            </td>
            <td title="Введите имя работника">
                <input type="text" class="form-control" name="firstname" placeholder="Введите имя"
                       title="Введите имя работника" required>
            </td>
            <td title="Введите отчество работника">
                <input type="text" class="form-control" name="middlename" placeholder="Введите отчество"
                       title="Введите отчество работника" required>
            </td>
            <td title="Введите должность работника">
                <input type="text" class="form-control" name="post" placeholder="Введите должность"
                       title="Введите должность работника" required>
            </td>

            <td>
            <select type="text" class="form-control" name="placeofwork">
                <%
                    PlaceOfWorkDao placeOfWorkDao = new PlaceOfWorkDao();
                    List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
                    for (PlaceOfWork placeOfWork : placeOfWorks) {
                %>
                <option class="form-control" value="<%=placeOfWork.getIdPlaceOfWork()%>">
                    <%=placeOfWork.getPlaceOfWorkName() /*+ " " + placeOfWorkDao.getPlaceOfWorkType(placeOfWork.getIdPlaceOfWork())*/%>
                </option>
                <%
                    }
                %>
            </select>
            </td>
            <td>
                <div style="text-align: center">
                <input type="checkbox" class="form-check-input" name="vacation">
                </div>
            </td>
            <td>
                <div style="text-align: center">
                <input type="checkbox" class="form-check-input" name="sickLeave">
                </div>
            </td>
          <%--  <td title="Введите ID места работы">
                <input type="number" name="idplaceofwork" placeholder="Введите ID"
                       title="Введите ID места работы" min="0">
            </td>--%>
            <td class="my-td">
                <button type="submit" class="btn btn-secondary" name="action" value="add">Сохранить</button>
            </td>
            </div>
        </tr>
    </table>
</form>

<form action="worker" method="get">

   <table class="table">
       <tr>
           <div class="input-group mb-3">
           <td>
               <select class="form-control" name="search">
                   <option class="form-control" value="lastname">Фамилия</option>
                   <option class="form-control" value="firstname">Имя</option>
                   <option class="form-control" value="middlename">Отчество</option>
                   <option class="form-control" value="post">Должность</option>
<%--                   <option value="placeofwork">Место работы</option>--%>
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

<%--        <a href="logins" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Просмотреть логины работников</a>--%>

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
            <th scope="col"></th>
        </tr>
        </thead>
        <%

            //List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
            List<Worker> workers = (List<Worker>) request.getAttribute("workers");
            if (workers != null) {
                //for (PlaceOfWork placeOfWork : placeOfWorks) {
                for (Worker worker: workers) {


        %>
        <form action="worker" method="POST">
        <tr>
            <div class="input-group mb-3">
            <td>
                <input type="text" hidden class="form-control" name="id" value="<%=worker.getIdWorker()%>"
                       title="<%=Long.toString(worker.getIdWorker())%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="lastname" value="<%=worker.getLastname()%>"
                       title="<%=worker.getFirstname()%>" required>
            </td>

            <td>
                <input type="text" class="form-control" name="firstname" value="<%=worker.getFirstname()%>"
                       title="<%=worker.getLastname()%>" required>
            </td>
            <td>
                <input type="text" class="form-control" name="middlename" value="<%=worker.getMiddlename()%>"
                       title="<%=worker.getMiddlename()%>" required>
            </td>
            <td>
                <input type="text" class="form-control" name="post" value="<%=worker.getPost()%>"
                       title="<%=worker.getPost()%>" required>
            </td>
            <td width="12%">
                <select type="text" class="form-control" name="placeofwork">
                    <%
                        //long idassign = manufactory.getAssignmentOfManufactory().getIdAssignmentOfManufactory();
                        //if(Objects.isNull(idassign))
                        try{
                            PlaceOfWork thisPlaceOfWork = placeOfWorkDao.get(worker.getPlaceOfWork().getIdPlaceOfWork());
                    %>
                    <option title="<%=thisPlaceOfWork.getPlaceOfWorkName()%>" value="<%=thisPlaceOfWork.getIdPlaceOfWork()%>" selected disabled>
                        <%=thisPlaceOfWork.getPlaceOfWorkName() /*+ " " + placeOfWorkDao.getPlaceOfWorkType(thisPlaceOfWork.getIdPlaceOfWork())*/%>
                    </option>
                    <%
                    } catch (Exception ex) {%>
                    <option value="" selected disabled></option>
                    <%}

                     //   List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
                        for (PlaceOfWork placeOfWork : placeOfWorks) {
                    %>
                    <option value="<%=placeOfWork.getIdPlaceOfWork()%>">
                        <%=placeOfWork.getPlaceOfWorkName() /*+ " " + placeOfWorkDao.getPlaceOfWorkType(placeOfWork.getIdPlaceOfWork())*/%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>

            <td>
                <div style="text-align: center">
                <%
                    if(worker.isVacation()){
                %>
                <input type="checkbox" class="form-check-input" name="vacation" checked>
                <%
                }  else {
                %>
                <input type="checkbox" class="form-check-input" name="vacation">
                <%
                    }
                %>
                </div>
            </td>
            <td>
                <div style="text-align: center">
                <%
                    if(worker.isSickLeave()) {
                %>
                <input type="checkbox" class="form-check-input" name="sickLeave" checked>
                <%
                } else {
                %>
                <input type="checkbox" class="form-check-input" name="sickLeave">
                <%
                    }
                %>
                </div>
            </td>
                <td>
                    <button type="submit" class="btn btn-secondary" name="action" value="edit">Изменить</button>
                </td>
                <td>
                    <button type="submit" class="btn btn-secondary" name="action" value="delete">Удалить</button>
                </td>
            </div>
            <form action="worker" method="post">
            <td>
                <%

                        if(worker.isPresence()){

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
                    <button type="submit" class="btn btn-secondary" name="attendance" value="<%=worker.getIdWorker()%>">Посещаемость</button>
                </form>
                <%
                    UserDao userDao = new UserDao();
                    if(userDao.get(worker.getIdWorker()) == null){
                %>
                <form action="register" method="get">
                    <button type="submit" class="btn btn-secondary" name="register" value="<%=worker.getIdWorker()%>">Зарегистрировать</button>
<%--                <a href="register" class="btn btn-secondary" role="button">Зарегистрировать</a>--%>
                </form>
                <%
                    } else {
                %>
                <form action="workerlogin" method="get">
                    <button type="submit" class="btn btn-secondary" name="workerlogin" value="<%=worker.getIdWorker()%>">Данные для входа</button>
                    <%--                <a href="register" class="btn btn-secondary" role="button">Зарегистрировать</a>--%>
                </form>
                <%
                    }
                %>
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
</div>

</body>
</html>
