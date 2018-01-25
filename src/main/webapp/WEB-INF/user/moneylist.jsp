<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>

<html>
<head>
    <title>积分余额管理</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<div class="input-group">
    <div class="input-icon-group">
        <input type="text" class="form-control fc-clear" id="funame" placeholder="请输入昵称" />
    </div>
    <span class="input-group-btn">
        <button class="btn btn-primary" type="button" onclick="search()">
            搜索
        </button>
    </span>
</div>
<table class="table" id="money-table" border="1"></table>
<script type="text/javascript">
    function search(){
        $("#money-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        $("#money-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/integral/queryIntegralPage.do",
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
                    funame:$("#funame").val(),
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
                    field: 'funame',
                    title: '用户昵称',
                    idField:true,
                    width: 100
                },{
                    field: 'usname',
                    title: '用户账号',
                    width: 100

                },{
                    field: 'monintegrator',
                    title: '用户积分',
                    width: 100

                },{
                    field: 'monbalance',
                    title: '用户余额',
                    width: 100

                },{
                    field: 'monstatus',
                    title: '账户状态',
                    width: 100,
                    formatter:function(value,row,index){
                        if(row.monstatus=="1"){
                            return "正常"
                        }else if(row.monstatus=="2"){
                            return "冻结"
                        }
                    }

                }]
        })
    })
</script>
</body>
</html>
