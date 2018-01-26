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
<div id="a" style="width:450px; float:left;">
    &nbsp
</div>
<h3>新增广告</h3>

<form id="add-ad-form" method="post"  action="<%=basePath%>/AD/addAD" enctype="multipart/form-data">
    <table align="center" cellspacing="10px" height="200px">
        <tr>
            <td>广告名称：</td>
            <td>
                <input type="text" class="form-control" placeholder="请输入名称" name="adname" style="width: 350px">
            </td>
        </tr>
        <tr>
            <td>广告内容：</td>
            <td>
                <textarea name="adtext" class="form-control" rows="6" placeholder="请输入内容，最多填写400字" id="booktext" onkeyup="countlength()"></textarea><td>
            <div id="count-div">还可输入<font color="red" id="countf">400</font>字</div>
            <input type="hidden" name="adimg" id="adimg-input">
            </td>
        </tr>
    </table>
</form>
    <table align="center" cellspacing="10px" height="100px">
        <tr>
            <td>广告图片：</td>
            <td>
                <div id="show-img"></div>
                <form action="<%=request.getContextPath()%>/AD/upload" method="post" enctype="multipart/form-data" id="upImg-form">
                    <input type="file" name="test"/><input type="button" value="确定上传" onclick="upImg()"/>

                </form>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="button" onclick="addAD()" class="btn btn-default">新增</button>&nbsp&nbsp&nbsp
                <%--<button type="reset" onclick="closeTabs()" class="btn btn-default">清空</button>--%>
            </td>

        </tr>
    </table>








<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 350px">
        <div class="modal-content">
            <div class="modal-body">新增成功，是否继续新增？</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="toADTabs()">退出新增</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="resetAddForm()">继续新增</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>



<script type="text/javascript">
    function upImg(){
        $.ajax({
            url:'<%=request.getContextPath()%>/AD/upload',
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
    //计数方法
    function countlength(){
        var booktext = document.getElementById("booktext").value;
        var cd = document.getElementById("count-div");
        if(booktext.length<=400){
            var c = 400-booktext.length;
            cd.innerHTML="还可输入<font color='red' id='countf'>"+c+"</font>字";
        }else{
            cd.innerHTML="<font color='red'>字数超过限制，新增将会失败</font>";
        }
    }
    //新增方法
    function addAD(){
        $.ajax({
            url:'<%=basePath%>/AD/addAD',
            type:'post',
            data:$('#add-ad-form').serialize(),
            dataType:'json',
            success:function(data){
                confirm1();
            }
        })
    }
    //是否继续新增提示框
    function confirm1(){
        $('#myModal').modal({
            keyboard: true
        })

    }
    //继续新增重置表单
    function resetAddForm(){
        $('#myModal').modal({
            keyboard: false
        })
        $("#show-img").html("");
        var cd = document.getElementById("count-div");
        cd.innerHTML="还可输入<font color='red' id='countf'>400</font>字";
        $('#add-ad-form')[0].reset()
        $('#upImg-form')[0].reset()
    }

    function toADTabs(){
        $('#myModal').modal({
            keyboard: false
        })
        $("#show-img").html("");
        var cd = document.getElementById("count-div");
        cd.innerHTML="还可输入<font color='red' id='countf'>400</font>字";
        $('#add-ad-form')[0].reset();
        $('#upImg-form')[0].reset();
        $.ajax({
            url:"<%=basePath%>/AD/toADList",
            type : "post",
            success : function(data) {
                //                     				添加选项卡面板
                $.addtabs.add({
                    id : 8,
                    title : '广告列表',
                    content : data,
                })
            }
        })
    }

    $(function(){

    })



</script>
</body>
</html>