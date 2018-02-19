<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<title>SpringBoot</title>
<form method="post" action="/save">
    <input type="hidden" name="id" value=""/>
    Title:<br>
    <input type="text" name="title" maxlength="30" required/>
    <br>
    Description:<br>
    <input type="text" name="description" maxlength="40" required/>
    <br>
    Author:<br>
    <input type="text" name="author" maxlength="25" required/>
    <br>
    Isbn:<br>
    <input type="text" name="isbn" maxlength="15" required/>
    <br>
    Year:<br>
    <%--Т.к. мы вводим текст, при отправке которого может быть ошибка импорта в БД.--%>
    <input type="number" name="printyear" min="1000" max="2018" required/>
    <br><br>
    <input type="hidden" name="readalready" value=""/>
    <input type="submit" value="Submit">
</form>
<form method="get" action="/">
    <input type="submit" value="Back">
</form>
<html/>