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
        <td>${lists.id}</td>
    </tr>
    <tr>
        <th>Title</th>
        <td>${lists.title}</td>
    </tr>
    <tr>
        <th>Description</th>
        <td>${lists.description}</td>
    </tr>
    <tr>
        <th>Author</th>
        <td>${lists.author}</td>
    </tr>
    <tr>
        <th>Isbn</th>
        <td>${lists.isbn}</td>
    </tr>
    <tr>
        <th>Year</th>
        <td>${lists.printYear}</td>
    </tr>
    <tr>
        <th>isRead</th>
        <td>${lists.readAlready}</td>
    </tr>
</table>
<br>
<form method="post" action="/editor/${lists.id}">
    <input type="submit" value="Edit">
</form>
<br>
<form method="post" action="/delete/${lists.id}">
    <input type="submit" value="Delete">
</form>
<br>
</body>
</html>