<%@ page import="java.util.List" %>
<%@ page import="models.Store" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Управление складами</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
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
            <a class="nav-item nav-link active" href="manufactory">Управление цехами</a>
            <a class="nav-item nav-link active" href="worker">Управление работниками</a>
            <a class="nav-item nav-link active" href="assign" >Управление назначениями цехов</a>
        </div>
    </div>
</nav>

<%--<a href="manufactory">Перейти к управлению данными о цехах</a>
<a href="worker">Перейти к управлению данными о работниках</a>
<a href="assign">Перейти к управлению данными о назначении цехов</a>--%>
<div class="my-table">
<form action="store" method="POST">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Название склада</th>
            <th scope="col">Тип хранимого на складе</th>
            <th scope="col">Количество хранимого на складе</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tr>
            <div class="input-group mb-3">
            <td>
                <input type="text" class="form-control" name="placeofworkname" placeholder="Введите название"
                       title="Введите название склада" required>
            </td>
            <td>
                <input type="text" class="form-control" name="typeofstored" placeholder="Введите тип"
                title="Введите тип хранимого на складе" required>
            </td>
            <td>
                <input type="number" class="form-control" name="amountofstored" placeholder="Введите количество"
                title="Введите количество хранимого на складе" min="0" required>
            </td>
            <td>
                <button type="submit" class="btn btn-secondary" name="action" value="add">Сохранить</button>
            </td>
            </div>
        </tr>
    </table>
</form>

<form action="store" method="get">

    <table class="table">
        <tr>
            <div class="input-group mb-3">
            <td>
                <select class="form-control" name="search">
                    <option value="place_of_work_name">Название склада</option>
                    <option value="type_of_stored">Тип хранимого на складе</option>
                </select>
            </td>
            <td>
                <input class="form-control" type="search" placeholder="Поиск..." name="searchfield" required>
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
            <th scope="col">Название склада</th>
            <th scope="col">Тип хранимого на складе</th>
            <th scope="col">Количество хранимого на складе</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <%
            //List<PlaceOfWork> placeOfWorks = (List<PlaceOfWork>) request.getAttribute("placeofworks");
            List<Store> stores = (List<Store>) request.getAttribute("stores");
            if (stores != null) {
                //for (PlaceOfWork placeOfWork : placeOfWorks) {
                    for (Store store: stores) {


        %>
        <form action="store" method="POST">
        <tr>
            <div class="input-group mb-3">
            <td>
                <input type="text" class="form-control" hidden name="id" value="<%=store.getIdPlaceOfWork()%>"
                       title="<%=Long.toString(store.getIdPlaceOfWork())%>" readonly>
            </td>
            <td>
                <input type="text" class="form-control" name="placeofworkname" value="<%=store.getPlaceOfWorkName()%>"
                       title="<%=store.getPlaceOfWorkName()%>" required>
            </td>

            <td>
                <input type="text" class="form-control" name="typeofstored" value="<%=store.getTypeOfStored()%>"
                title="<%=store.getTypeOfStored()%>" required>
            </td>
            <td>
                <input type="number" class="form-control" name="amountofstored" value="<%=store.getAmountOfStored()%>"
                title="<%=store.getAmountOfStored()%>" min="0" required>
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
