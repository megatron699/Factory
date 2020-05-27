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
<a href="manufactory">Перейти к управлению данными о цехах</a>
<a href="worker">Перейти к управлению данными о работниках</a>
<a href="assign">Перейти к управлению данными о назначении цехов</a>

<form action="store" method="POST">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Название</th>
            <th scope="col">Тип хранимого <br> на складе</th>
            <th scope="col">Количество хранимого <br> на складе</th>
        </tr>
        </thead>
        <tr>
            <td title="Введите название склада"><input type="text" name="placeofworkname" placeholder="Введите название"
                       title="Введите название склада"></td>
            <td title="Введите тип хранимого на складе">
                <input type="text" name="typeofstored" placeholder="Введите тип"
                title="Введите тип хранимого на складе">
            </td>
            <td title="Введите количество хранимого на складе">
                <input type="number" name="amountofstored" placeholder="Введите количество"
                title="Введите количество хранимого на складе" min="0">
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
            <th scope="col">Название</th>
            <th scope="col">Тип хранимого <br> на складе</th>
            <th scope="col">Количество хранимого <br> на складе</th>
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
            <td>
                <input type="text" name="id" value="<%=store.getIdPlaceOfWork()%>"
                       title="<%=Long.toString(store.getIdPlaceOfWork())%>" readonly>
            </td>
            <td>
                <input type="text" name="placeofworkname" value="<%=store.getPlaceOfWorkName()%>"
                       title="<%=store.getPlaceOfWorkName()%>">
            </td>

            <td>
                <input type="text" name="typeofstored" value="<%=store.getTypeOfStored()%>"
                title="<%=store.getTypeOfStored()%>">
            </td>
            <td>
                <input type="number" name="amountofstored" value="<%=store.getAmountOfStored()%>"
                title="<%=store.getAmountOfStored()%>" min="0">
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
