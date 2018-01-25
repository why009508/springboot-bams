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
<h3>新增/编辑菜单</h3>
<form id="add-menu-form" method="post"  action="">
    <table align="center" cellspacing="10px" height="200px">
        <tr>
            <td>菜单名称：</td>
            <td>
                <input type="text" class="form-control" placeholder="请输入名称" name="text">
            </td>
        </tr>
        <tr>
            <td>父级菜单：</td>
            <td>
                <input type="text" class="form-control" placeholder="请输入父级菜单ID" name="pid">
                <%--<select name="bookwriter" class="form-control">
                    <c:forEach items="${writer}" var="w">
                        <option value="${w.writerid}">${w.writername}</option>
                    </c:forEach>
                </select>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center"><button type="button" onclick="addDept()" class="btn btn-default">提交</button></td>
        </tr>
    </table>
</form>

<div id="dlg" class="easyui-dialog"  title="选择上级部门" closed="true" style="width:300px;height:500px;padding:10px"
     data-options="
					iconCls: 'icon-save',
					toolbar: '#dlg-toolbar',
					buttons: '#dlg-buttons'
				">
    <ul id="menuTree" class="ztree"></ul>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">关闭</a>
</div>




<script type="text/javascript">
    function toDeptTree(){
        alert();
        $('#dlg').dialog('open')
    }
    function addDept(){
        $.ajax({
            url:'<%=basePath%>/Dept/addDept.do',
            type:'post',
            data:$('#add-dept-form').serialize(),
            dataType:'json',
            success:function(data){
                confirm1();
            }
        })
    }
    function confirm1(){
        $.messager.confirm('新增成功', '是否继续新增?', function(r){
            if (r){
                document.getElementById("add-dept-form").reset();
            }else{
                //$("#tabs").tabs("close", "新增机构");
                window.parent.$('#tabs').tabs('close', "新增机构")
            }
        });
    }

    $(document).ready(function(){

        //var zTree = $.fn.zTree.getZTreeObj("menuTree");

        $.ajax({
            url:"<%=request.getContextPath()%>/Dept/queryDeptTree.do",
            dataType:"json",
            type:"post",
            success:function(zNodes){
                $.fn.zTree.init($("#menuTree"), setting, zNodes);
            },
            error:function(){
                alert("查询失败");
            }

        })

    });

    function zTreeOnCheck(event, treeId, treeNode) {
        //alert(treeNode.id + ", " + treeNode.name + "," + treeNode.checked);
        $("#pid-input").textbox('setValue',treeNode.name);
        $("#pid-id").val(treeNode.id);
    };

    var setting = {

        data: {
            simpleData: {
                enable: true,
                pIdKey:"pid",
                idKey:"id",
            }
        },
        view: {
            selectedMulti: false
        },
        callback: {
            onClick:function(e, id, node){
                var zTree = $.fn.zTree.getZTreeObj("menuTree");
                if(node.isParent) {
                    zTree.expandNode();
                } else {
                    addTabs(node.name, node.file);
                }
            },
            onCheck: zTreeOnCheck
        },
        check: {
            enable: true,
            chkStyle: "radio",
            radioType: "all"
        }

    };

</script>
</body>
</html>