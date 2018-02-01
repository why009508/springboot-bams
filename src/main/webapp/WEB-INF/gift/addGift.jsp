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

</head>
<body>
<div id="a" style="width:150px; float:left;">
    &nbsp
</div>
<h3>新增礼品</h3>

<form id="add-gift-form" method="post"  action="<%=basePath%>/AD/addAD" enctype="multipart/form-data">
    <table align="center" cellspacing="10px" height="200px">
        <tr>
            <td>礼品名称：</td>
            <td>
                <input type="text" class="form-control" placeholder="请输入名称" name="giftname" style="width: 350px">
            </td>
        </tr>
        <tr>
            <td>兑换所需积分：</td>
            <td>
                <input type="number" class="form-control" placeholder="请输入积分" name="giftprice" style="width: 350px">
            </td>
        </tr>
        <tr>
            <td>礼品失效时间：</td>
            <td>
                <input id="d4311" class="form-control" type="text" name="giftfailtime" onFocus="WdatePicker()"/>
                <input type="hidden" name="giftimg" id="adimg-input">
            </td>
        </tr>
    </table>
</form>
<table align="center" cellspacing="10px" height="100px">
    <tr>
        <td>礼品图片：</td>
        <td>
            <div id="show-img"></div>
            <form action="<%=request.getContextPath()%>/Gift/upload" method="post" enctype="multipart/form-data" id="upImg-form">
                <input type="file" name="test"/><input type="button" value="确定上传" onclick="upImg()"/>

            </form>
        </td>
    </tr>
</table>












<script type="text/javascript">
    function upImg(){
        $.ajax({
            url:'<%=request.getContextPath()%>/Gift/upload',
            type:'post',
            data:new FormData($("#upImg-form")[0]),
            dataType:'text',
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
            success:function(data){
                alert(data);
                $("#show-img").html("<img src=\""+data+"\" width=\"300px\" height=\"300px\">");
                $("#adimg-input").val(data);
            }
        })
    }











</script>
</body>
</html>