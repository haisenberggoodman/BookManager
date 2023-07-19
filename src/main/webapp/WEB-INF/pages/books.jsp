<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix=""%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <title>Books Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ec3e18;
        }

        .tg td {
            font-family: SansSerif, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ec3e18;
            color: aquamarine;
            background-color: antiquewhite;
        }

        .tg th {
            font-family: SansSerif, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ec3e18;
            color: aquamarine;
            background-color: antiquewhite;
        }
        .tg .tg-4eph {
            background-color: antiquewhite;
        }

    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Book List</h1>

<c:if test="${!empty listBooks}"> {
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="120">Author</th>
            <th width="120">Price</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var = "books">

        <tr>
                <td>${book.id}</td>
                <td>${book.bookTitle}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.price/100}${book.price%100}</td>
            <td><a href="<c:url value='/edit/${book.id}>'/>">">Edit</a></td>
            <td><a href="<c:url value='/remove/${book.id}>'/>">">Delete</a></td>

                <td></td>
        </tr>
            </c:forEach>
    </table>
</c:if>

<h1>Add a Book</h1>

<c:url var="addAction" value ="/books/add"/>

    <form:form action="${addAction}" commandName="book">
        <table>
            <c:if test="${!empty book.name}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="bookTitle">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookTitle"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookAuthor">
                        <spring:message text="Author"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookAuthor"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="price">
                        <spring:message text="Price"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="price"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty book.bookTitle}">
                        <input type="submit"
                               value="<spring:message text="Edit Book"/>"/>
                    </c:if>
                    <c:if test="${empty book.bookTitle}">
                        <input type="submit"
                            value="<spring:message text ="Add Book"/>"/>
                    </c:if>
                </td>
            </tr>
            </table>
    </form:form>
</body>
</html>
