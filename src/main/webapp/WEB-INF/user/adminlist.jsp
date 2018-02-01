<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>

<html>
<head>
    <title>管理员列表</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<input type="hidden" value="${loginuser.ustatic}" id="ustatic"/>
<table class="table" id="admin-table" border="1"></table>
<script type="text/javascript">
    var static = document.getElementById("ustatic").value;
    function search(){
        $("#admin-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){

        $("[name='datet']").datetimepicker({
            format: 'yyyy-mm-dd'
        });

        $("#admin-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/user/queryAdminPage.do",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:false,//显示切换视图
            search:false,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:2,//每页条数
            pageList:[1,2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
                //	     	console.info(params.search);
                //	            var name= $("#empName").val();
                //	             var sex = $("#sex").val();
                //	             alert(name+","+sex);
                //	             return 的数据 是传递到  action类中的参数
                return {
                    page:this.pageNumber,//当前页
                    rows:this.pageSize, //每页条数
//                    fname:$("#fname").val(),
//                    uname:$("#uname").val(),
//                    cotype:$("[name='cotype'] option:selected").val(),
//                    joname:$("#jobname").val(),
//                    starttime:$("#uname").val(),
//                    endtime:$("#endtime").val(),
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'uid',
                    title: '用户编号',
                    idField:true,
                    width: 100
                },{
                    field: 'uname',
                    title: '用户账号',
                    idField:true,
                    width: 100
                },{
                    field: 'upass',
                    title: '用户密码',
                    width: 100

                },{
                    field: 'rname',
                    title: '用户角色',
                    width: 100,

                },{
                    field: 's',
                    title: '操作',
                    width: 100,
                    formatter:function(value,row,index){
                        if(static ==2){
                            return "";
                        }else{
                            return"<button type='button' class='btn btn-default' onClick='role("+row.uid+")'>设置权限</button>";
                        }

                    }
                },]
        })
    })

    function role(usid){
        alert(usid)
        BootstrapDialog.show({
            title: '角色列表',
            message: $('<div></div>').load('<%=request.getContextPath()%>/user/torole?uid='+usid),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    var str="";
                    $("[name='aa']:checked").each(function(){
                        str+=","+$(this).val();
                        //alert($(this).val());
                    });
                    alert(str);
                    var roid = str.substr(1);
                    alert(roid);
                    $.ajax({
                        url:"user/addRid",
                        type:"post",
                        data:{"uid":usid,"r":roid},
                        dataType:"text",
                        success:function(series){
                            if(series=="1"){
                                alert("设置成功");
                                dialog.close();
                                $("#admin-table").bootstrapTable("refresh");
                            }
                        }
                    })
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                    //更改弹框标题
//                 dialog.setTitle('Title 2');
                }
            }]
        });
    }
</script>
</body>
</html>
