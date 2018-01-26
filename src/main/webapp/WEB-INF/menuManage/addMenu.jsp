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

<form id="add-menu-form" method="post"  action="<%=basePath%>/Menu/addMenu">
    <table align="center" cellspacing="10px" height="200px">
        <tr>
            <td>菜单名称：</td>
            <td>
                <input type="text" class="form-control" placeholder="请输入名称" name="text" style="width: 350px">
            </td>
        </tr>
        <tr>
            <td>父级菜单：</td>
            <td>
                <select class="form-control" name="pid">
                    <option value="0">0 页面显示</option>
                    <option value="3">3 倾听世界</option>
                    <option value="5">5 每日一笑</option>

                </select>

            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="button" onclick="addMenu()" class="btn btn-default">新增</button>&nbsp&nbsp&nbsp
                <button type="reset" onclick="closeTabs()" class="btn btn-default">清空</button>
            </td>

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


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 350px">
        <div class="modal-content">
            <div class="modal-body">新增成功，是否继续新增？</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="toMenuTabs()">退出新增</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="resetAddForm()">继续新增</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>



<script type="text/javascript">
    function toDeptTree(){
        $('#dlg').dialog('open')
    }
    //新增方法
    function addMenu(){
        $.ajax({
            url:'<%=basePath%>/Menu/addMenu',
            type:'post',
            data:$('#add-menu-form').serialize(),
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
        $('#add-menu-form')[0].reset()
    }

    function toMenuTabs(){
        $('#myModal').modal({
            keyboard: false
        })
        $('#add-menu-form')[0].reset();
        $.ajax({
            url:"<%=basePath%>/Menu/toMenuList",
            type : "post",
            success : function(data) {
                //                     				添加选项卡面板
                $.addtabs.add({
                    id : 2,
                    title : '菜单列表',
                    content : data,
                })
            }
        })
    }

    $(document).ready(function(){

        //var zTree = $.fn.zTree.getZTreeObj("menuTree");

        /*$.ajax({
            url:"<%=request.getContextPath()%>/Dept/queryDeptTree.do",
            dataType:"json",
            type:"post",
            success:function(zNodes){
                $.fn.zTree.init($("#menuTree"), setting, zNodes);
            },
            error:function(){
                alert("查询失败");
            }

        })*/

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