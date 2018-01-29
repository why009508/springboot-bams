<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/24
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加主播信息</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<form id="addAnchor-form" method="post">

    <table>
        <tr>
            <td>姓名:</td>
            <td><input type="text" name="anname"></td>
        </tr>
        <tr>
            <td>身份证:</td>
            <td><input type="text" name="annum"></td>
        </tr>
        <tr>
            <td>账号:</td>
            <td><input type="text" name="anusername"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="text" name="anpass"></td>
        </tr>

    </table>
</form>



</body>
</html>
