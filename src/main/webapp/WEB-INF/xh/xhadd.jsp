<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/1/23
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<html>
<head>
    <title>添加笑话</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>

<form id="addXiaoh" type="post">
    <table cellpadding="0" cellspacing="1" border="1" >
        <tr>
            <td> 标题 </td>
            <td><input  name="jotitle"  style="width:250px"></td>
        </tr>
        <tr>
            <td> 类型 </td>
            <td> <select  class="easyui-combobox" name="jotype" editable="false" style="width:250px;">
                <option value="少儿不宜">少儿不宜</option>
                <option value="各种口味">各种口味</option>
                <option value="校园趣闻">校园趣闻</option>
                <option value="超级内涵">超级内涵</option>
                <option value="贴近生活">贴近生活</option>
                <option value="图片笑话">图片笑话</option>
            </select>
            </td>
        </tr>
        <tr>
            <td> 内容 </td>
            <td><textarea name="jocontent" style='height:20px ; width:400px'></textarea></td>
        </tr>
    </table>
</form>

</body>
</html>
