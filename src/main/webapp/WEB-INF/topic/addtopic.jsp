<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
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
<h3>新增话题</h3>

<form id="aform" method="post" enctype="multipart/form-data">
    <input type="hidden" id="adimg-input" name="piccontent"/>
    <table align="center" cellspacing="10px" height="200px">
        <tr>
            <td>话题名称：</td>
            <td>
                <input type="text" class="form-control" placeholder="请输入名称" name="pictitle" style="width: 350px">
            </td>
        </tr>
        <tr>
            <td>开始时间：</td>
            <td>
                <input  class="form-control" id="starttime1" name="starttime"  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
            </td>
        </tr>
        <tr>
            <td>结束时间：</td>
            <td>
                <input class="form-control" id="endtime1" name="endtime"  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
            </td>
        </tr>


    </table>
</form>
<table align="center" cellspacing="10px" height="100px">
    <tr>
        <td>话题图片：</td>
        <td>
            <div id="show-img"></div>
            <form action="<%=request.getContextPath()%>/Topic/upload" method="post" enctype="multipart/form-data" id="upImg-form">
                <input type="file" name="test"/><input type="button" value="确定上传" onclick="upImg()"/>

            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <button type="button" onclick="addTopic()" class="btn btn-default">新增</button>&nbsp&nbsp&nbsp
        </td>
    </tr>
</table>
<script type="text/javascript">
    $("#starttime1").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
        startView: 2,
        minView: 2
    });

    $("#endtime1").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
        startView: 3,
        minView: 3
    });

    function upImg(){
        $.ajax({
            url:'Topic/upload',
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
    function addTopic(){
        alert("qq")
        $.ajax({
            url:'Topic/addTopic',
            type:'post',
            data:$('#aform').serialize(),
            dataType:'json',
            success:function(data){
                if(data==1){
                    alert("添加成功")
                    toTabs();
                }
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

    function toTabs(){

        $("#show-img").html("");
        var cd = document.getElementById("count-div");
        $('#aform')[0].reset();
        $('#upImg-form')[0].reset();

    }





</script>
</body>
</html>
