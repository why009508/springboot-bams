<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/22
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>批量修改密码</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
    <form id="plup-form" method="post">

        <table>
            <c:forEach items="${anclist}" var="a">

                <tr>
                    <td>姓名</td>
                    <td>
                        <input type="hidden" name="anid" value="${a.anid}">
                        <input type="text" name="anname" value="${a.anname}">
                    </td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td>
                        <input type="text" name="anpass" value="${a.anpass}">
                    </td>
                </tr>
            </c:forEach>

        </table>


    </form>
</body>
</html>
