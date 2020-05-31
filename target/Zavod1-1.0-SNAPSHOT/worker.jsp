<%@ page import="models.Worker" %>
<%@ page import="java.util.List" %>
<%@ page import="models.PlaceOfWork" %>
<%@ page import="DAO.PlaceOfWorkDao" %>
<%@ page import="DAO.WorkerDao" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Управление работниками</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/style.css"/>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<%--    <a class="navbar-brand" href="#">Navbar</a>--%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="index">На главную<span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="store">Управление складами</a>
            <a class="nav-item nav-link" href="manufactory">Управление цехами</a>
            <a class="nav-item nav-link" href="assign" >Управление назначениями цехов</a>
<%--            <a class="nav-item nav-link" href="http://samara.nebar.ru/">Отдых после тяжелого рабочего дня</a>--%>
        </div>
    </div>
</nav>

<%--<a href="store">Перейти к управлению данными о складах</a>
<a href="manufactory">Перейти к управлению данными о цехах</a>
<a href="assign">Перейти к управлению данными о назначении цехов</a>--%>

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
        </tr>
        </thead>
        <tr>
            <td  title="Введите имя работника">
                <input type="text" name="lastname" placeholder="Введите фамилию"
                       title="Введите фамилию работника" required>
            </td>
            <td title="Введите имя работника">
                <input type="text" name="firstname" placeholder="Введите имя"
                       title="Введите имя работника" required>
            </td>
            <td title="Введите отчество работника">
                <input type="text" name="middlename" placeholder="Введите отчество"
                       title="Введите отчество работника" required>
            </td>
            <td title="Введите должность работника">
                <input type="text" name="post" placeholder="Введите должность"
                       title="Введите должность работника" required>
            </td>

            <td>
            <select type="text" name="placeofwork">
                <%
                    List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
                    for (PlaceOfWork placeOfWork : placeOfWorks) {
                %>
                <option value="<%=placeOfWork.getIdPlaceOfWork()%>">
                    <%=placeOfWork.getPlaceOfWorkName()%>
                </option>
                <%
                    }
                %>
            </select>
            </td>
            <td>
                <input type="checkbox" name="vacation">
            </td>
            <td>
                <input type="checkbox" name="sickLeave">
            </td>
          <%--  <td title="Введите ID места работы">
                <input type="number" name="idplaceofwork" placeholder="Введите ID"
                       title="Введите ID места работы" min="0">
            </td>--%>
            <td class="my-td">
                <button type="submit" class="btn btn-secondary" name="action" value="add">Сохранить</button>
            </td>
        </tr>
    </table>
</form>

<form action="worker" method="get">

   <table>
       <tr>
           <td>
               <select name="search">
                   <option value="lastname">Фамилия</option>
                   <option value="firstname">Имя</option>
                   <option value="middlename">Отчество</option>
                   <option value="post">Должность</option>
<%--                   <option value="placeofwork">Место работы</option>--%>
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
            <th scope="col">Фамилия</th>
            <th scope="col">Имя</th>
            <th scope="col">Отчество</th>
            <th scope="col">Должность</th>
            <th scope="col">Место работы</th>
            <th scope="col">Отпуск</th>
            <th scope="col">Больничный</th>
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
            <td>
                <input type="text" name="id" value="<%=worker.getId()%>"
                       title="<%=Long.toString(worker.getId())%>" readonly>
            </td>
            <td>
                <input type="text" name="lastname" value="<%=worker.getLastname()%>"
                       title="<%=worker.getFirstname()%>" required>
            </td>

            <td>
                <input type="text" name="firstname" value="<%=worker.getFirstname()%>"
                       title="<%=worker.getLastname()%>" required>
            </td>
            <td>
                <input type="text" name="middlename" value="<%=worker.getMiddlename()%>"
                       title="<%=worker.getMiddlename()%>" required>
            </td>
            <td>
                <input type="text" name="post" value="<%=worker.getPost()%>"
                       title="<%=worker.getPost()%>" required>
            </td>
            <td>
                <select type="text" name="placeofwork">
                    <%
                        //long idassign = manufactory.getAssignmentOfManufactory().getIdAssignmentOfManufactory();
                        //if(Objects.isNull(idassign))
                        try{
                            PlaceOfWorkDao placeOfWorkDao = new PlaceOfWorkDao();
                            PlaceOfWork thisPlaceOfWork = placeOfWorkDao.get(worker.getPlaceOfWork().getIdPlaceOfWork());
                    %>
                    <option value="<%=thisPlaceOfWork.getIdPlaceOfWork()%>" selected disabled>
                        <%=thisPlaceOfWork.getPlaceOfWorkName()%>
                    </option>
                    <%
                    } catch (Exception ex) {%>
                    <option value="" selected disabled></option>
                    <%}
                     //   List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
                        for (PlaceOfWork placeOfWork : placeOfWorks) {
                    %>
                    <option value="<%=placeOfWork.getIdPlaceOfWork()%>">
                        <%=placeOfWork.getPlaceOfWorkName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>

          <%--  <td>
                <% if(worker.getPlaceOfWork() != null) { %>
                <input type="number" name="idplaceofwork" value="<%=worker.getPlaceOfWork().getIdPlaceOfWork()%>"
                       title="<%=worker.getPlaceOfWork().getIdPlaceOfWork()%>" min="0">
                <%  } else {
                    %>
                <input type="number" name="idplaceofwork" value="" placeholder="Введите id" min="0">
                <%
                }
                %>
            </td>--%>
            <td>
                <%
                    if(worker.isVacation()){
                %>
                <input type="checkbox" name="vacation" checked>
                <%
                }  else {
                %>
                <input type="checkbox" name="vacation">
                <%
                    }
                %>
            </td>
            <td>
                <%
                    if(worker.isSickLeave()) {
                %>
                <input type="checkbox" name="sickLeave" checked>
                <%
                } else {
                %>
                <input type="checkbox" name="sickLeave">
                <%
                    }
                %>
            </td>

            <td class="my-td">
                <button type="submit" class="btn btn-secondary" name="action" value="edit">Изменить</button>
            </td>
            <td class="my-td">
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
