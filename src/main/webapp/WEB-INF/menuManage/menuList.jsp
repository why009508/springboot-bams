<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>




<center>

        <br><br>
        <form class="form-inline" role="form">
            <div class="form-group">
                <label class="sr-only" >名称</label>
                <input type="text" class="form-control" id="serach-box" placeholder="请输入名称或编号" style="width: 250px">
            </div>
            <button type="button" class="btn btn-default" onclick="search()">搜索</button>
            <button type="button" class="btn btn-default" onclick="toAddMenuTabs()">新增</button>
        </form>
</center>
<div>
    <table id="menu-table" ></table>
</div>

<script type="text/javascript">

    function search(){
        $("#menu-table").bootstrapTable("refresh");
    }

    $(function(){
        /*queryType();*/
        $("[name='datet']").datetimepicker({
            format: 'yyyy-mm-dd'
        });

        $("#menu-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/Menu/queryMenu.do",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            /* search:true,//是否显示搜索框 */
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:20,//每页条数
            pageList:[1,2,3,4],
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
//    	     	console.info(params.search);
//    	            var name= $("#empName").val();
//    	             var sex = $("#sex").val();
//    	             alert(name+","+sex);
//    	             return 的数据 是传递到  action类中的参数

                var str = params.search;
                return {

                    text:$("#serach-box").val(),
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    title: '',
                    width: 20,
                    formatter:function(value,row,index){
                        return "<input type='checkbox' value='"+row.bookid+"' name='che'/>";
                    },
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'id',
                    title: '菜单编号',
                    width: 20,
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'text',
                    title: '菜单名',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'pid',
                    title: '父级菜单',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'url',
                    title: '访问地址',
                    width: 100,
                    align: 'center',
                    valign: 'middle',

                }, {
                    field:'id',
                    title: '操作',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){

                        return actionFormatter(row.id);
                    },

                }, ]
        })
    })

    function actionFormatter(value, row, index) {
        var id = value;
        var result = "";
        result += "<a href='javascript:;' class='btn btn-xs green' onclick=\"EditViewById('" + id + "', view='view')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>&nbsp&nbsp&nbsp";
        result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditViewById('" + id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>&nbsp&nbsp&nbsp";
        result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"deleteMenuById('" + id + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";

        return result;
    }
    function deleteMenuById(id){
        var r=confirm("确定要删除id为"+id+"的菜单吗？");
        if(r==true){
            $.ajax({
                url:"<%=basePath%>/Menu/deleteMenu",
                type : "post",
                data:{"id":id},
                success : function(data) {
                    alert("删除成功");
                    search();
                }
            })
        }

    }
    function toAddMenuTabs(){
        $.ajax({
            url:"<%=basePath%>/Menu/toAddMenu",
            type : "post",
            success : function(data) {
                //                     				添加选项卡面板
                $.addtabs.add({
                    id : 3,
                    title : '新建菜单',
                    content : data,
                })
            }
        })
    }

    //修改
    function EditViewById(id){
        alert(id);
        BootstrapDialog.show({
            title: '修改',
            message: $('<div style="height: 300px"></div>').load('<%=request.getContextPath()%>/Menu/toEditMenu?id='+id),
            buttons: [{
                label: '修改',
                action: function(dialog) {

                    $.ajax({
                        url:'<%=request.getContextPath()%>/Menu/updateMenu',
                        type:"post",
                        data:$("#update-menu-form").serialize(),
                        dataType:"json",
                        success:function(){
                            alert("成功");
                            search();
                            dialog.close();
                        }

                    })
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                    //更改弹框标题
//                     dialog.setTitle('Title 2');
                }
            }]
        });
    }

</script>
</body>
</html>