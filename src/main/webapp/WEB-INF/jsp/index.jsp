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

<%--<h2>HTML Table</h2>--%>

<%--<table>
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Action</th>
    </tr>
    <c:forEach var = "list" items="${lists}">
    <tr>
        <td>${list.id}</td>
        <td>${list.firstName}</td>
        <td>${list.lastName}</td>
        <td>
            <a href="/view/${list.id}">View</a>
            <a href="/delete/${list.id}">Delete</a>
            <a href="/edit/${list.id}">Edit</a>
        </td>
    </tr>
    </c:forEach>
</table>--%>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Author</th>
        <th>Isbn</th>
        <th>Year</th>
        <th>isRead</th>
        <th>Menu</th>
    </tr>
    <c:forEach var = "list" items="${listUsers}">
        <tr>
            <td>${list.id}</td>
            <td>${list.title}</td>
            <td>${list.description}</td>
            <td>${list.getAuthor()}</td>
            <td>${list.isbn}</td>
            <td>${list.printYear}</td>
            <td>${list.readAlready}</td>
            <td>
                <form method="post" action="/view/${list.id}">
                    <input type="submit" value="Button">
                </form>
            </td>
            <%--<td>
                <a href="/view/${list.id}">View</a>
                <a href="/delete/${list.id}">Delete</a>
                <a href="/edit/${list.id}">Edit</a>
            </td>--%>
        </tr>
    </c:forEach>
</table>
<hr/>
<div id="pagination">
    <c:url value="/" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
    <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>
    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
    <c:choose>
    <c:when test="${page == i.index}">
    <span>${i.index}</span>
    </c:when>
    <c:otherwise>
    <c:url value="/" var="url">
        <c:param name="page" value="${i.index}"/>
    </c:url>
    <a href='<c:out value="${url}" />'>${i.index}</a>
    </c:otherwise>
    </c:choose>
    </c:forEach>
    <c:url value="/" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
    <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
<%--<form method="post" action="/save">--%>
<form method="request" action="/add">
    <%--<input type="hidden" name="id" value=""/>
    Title:<br>
    <input type="text" name="title"/>
    <br>
    Description:<br>
    <input type="text" name="description"/>
    <br>
    Author:<br>
    <input type="text" name="author"/>
    <br>
    Isbn:<br>
    <input type="text" name="isbn"/>
    <br>
    Year:<br>
    <input type="text" name="printyear"/>
    <br><br>
    <input type="hidden" name="readalready" value=""/>--%>
    <input type="submit" value="Add book">
    <br>
</form>
        <br>
        <form method="post" action="/search">
            <input type="hidden" name="id" value=""/>
            Search by year:<br>
            <input type="number" name="printyear" min="1000" max="2018"/>
            <br><br>
            <input type="hidden" name="readalready" value=""/>
            <input type="submit" value="Submit">
        </form>
</body>
</html>