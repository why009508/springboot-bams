<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/21
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主播信息修改</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>

<form id="up-form" method="post">

    <input type="hidden" name="anid" value="${anchorlist.anid}"/>
    <table>
        <tr>
            <td>名称:</td>
            <td><input type="text" name="anname" value="${anchorlist.anname}"></td>
        </tr>
        <tr>
            <td>身份证:</td>
            <td><input type="text" name="annum" value="${anchorlist.annum}"></td>
        </tr>
        <tr>
            <td>账号:</td>
            <td><input type="text" name="anusername" value="${anchorlist.anusername}"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="text" name="anpass" value="${anchorlist.anpass}"></td>
        </tr>

    </table>
</form>

</body>
</html>
