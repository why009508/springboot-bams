<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>

<h3>新增/编辑菜单</h3>

<form id="update-menu-form" method="post" >
    <table align="center" cellspacing="10px" height="200px">
        <tr>
            <td>菜单名称：</td>
            <td>
                <input value="${me.text}" type="text" class="form-control" placeholder="请输入名称" name="text" style="width: 350px">
                <input type="hidden" value="${me.id}" name="id" >
            </td>
        </tr>
        <tr>
            <td>父级菜单：</td>
            <td>
                <select class="form-control" name="pid">
                    <option value="0" ${me.pid==0?"selected":""}>0 页面显示</option>
                    <option value="3" ${me.pid==3?"selected":""}>3 倾听世界</option>
                    <option value="5" ${me.pid==5?"selected":""}>5 每日一笑</option>

                </select>

            </td>
        </tr>

    </table>
</form>

<script type="text/javascript">


</script>
</body>
</html>