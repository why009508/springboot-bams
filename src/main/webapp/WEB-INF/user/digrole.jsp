<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>角色列表</title>
</head>
<body>
<form action="post" id="addurro">
    <input  type="hidden"  name="rid"/>
</form>
<table id="dg1">
    <tr>
        <td>
            <c:forEach items="${rol}" var="r">
                <input type="checkbox" name="aa" value="${r.roleid}"
                        <c:forEach items="${uro}" var="u">
                            ${u.rid==r.roleid?'checked':''}
                        </c:forEach>
                />
                ${r.rolename}
            </c:forEach>
        </td>
    </tr>
</table>
</body>
</html>
