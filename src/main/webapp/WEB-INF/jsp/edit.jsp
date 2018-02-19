<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<title>SpringBoot</title>
<form method="post" action="/save">
    <input type="hidden" name="id" value="${lists.id}"/>
    Title:<br>
    <input type="text" name="title" maxlength="30" value="${lists.title}" required/>
    <br>
    Description:<br>
    <input type="text" name="description" maxlength="40" value="${lists.description}" required/>
    <br>
    Isbn:<br>
    <input type="text" name="isbn" maxlength="15" value="${lists.isbn}" required/>
    <br>
    Year:<br>
    <%--Т.к. мы вводим текст, при отправке которого может быть ошибка импорта в БД.--%>
    <input type="number" name="printyear" min="1000" max="2018" value="${lists.printYear}" required/>
    <br><br>
    <input type="hidden" name="author" maxlength="25" minlength="1" value="${lists.author}" required/>
    <input type="hidden" name="readalready" value="${lists.readAlready}"/>
    <input type="submit" value="Submit">
</form>
<form method="get" action="/">
    <input type="submit" value="Back">
</form>
