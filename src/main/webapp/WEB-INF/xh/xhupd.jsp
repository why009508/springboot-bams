<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<html>
<head>
    <title>修改笑话</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>

<form id="updXiaoh" type="get">
    <input type="hidden" name="joid" value="${xhupd.joid}">
    <input type="hidden" name="jotime" value="${xhupd.jotime}">
    <input type="hidden" name="juid" value="${xhupd.juid}">
    <table cellpadding="0" cellspacing="1" border="1" >
        <tr>
            <td> 标题 </td>
            <td><input  name="jotitle"  style="width:250px" value="${xhupd.jotitle}"></td>
        </tr>
        <tr>
            <td> 类型 </td>
            <td> <select  class="easyui-combobox" name="jotype" editable="false" style="width:250px;">
                <option value="少儿不宜" <c:if test="${xhupd.jotype =='少儿不宜'}"> selected</c:if>>少儿不宜</option>
                <option value="各种口味" <c:if test="${xhupd.jotype =='各种口味'}"> selected</c:if>>各种口味</option>
                <option value="校园趣闻" <c:if test="${xhupd.jotype =='校园趣闻'}"> selected</c:if>>校园趣闻</option>
                <option value="超级内涵" <c:if test="${xhupd.jotype =='超级内涵'}"> selected</c:if>>超级内涵</option>
                <option value="贴近生活" <c:if test="${xhupd.jotype =='贴近生活'}"> selected</c:if>>贴近生活</option>
                <option value="图片笑话" <c:if test="${xhupd.jotype =='图片笑话'}"> selected</c:if>>图片笑话</option>
            </select>
            </td>
        </tr>
        <tr>
            <td> 内容 </td>
            <td><textarea name="jocontent" style='height:20px ; width:400px'> ${xhupd.jocontent}</textarea></td>
        </tr>
    </table>
</form>
</body>
</html>
