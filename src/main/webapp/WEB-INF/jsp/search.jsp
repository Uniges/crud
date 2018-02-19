<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head><title>SpringBoot</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Author</th>
        <th>Isbn</th>
        <th>Year</th>
        <th>isRead</th>
    </tr>
    <c:forEach var = "list" items="${search}">
        <tr>
            <td>${list.id}</td>
            <td>${list.title}</td>
            <td>${list.description}</td>
            <td>${list.getAuthor()}</td>
            <td>${list.isbn}</td>
            <td>${list.printYear}</td>
            <td>${list.readAlready}</td>
        </tr>
    </c:forEach>
</table>
<br>
<form method="get" action="/">
    <input type="submit" value="Back">
</form>
</body>
</html>