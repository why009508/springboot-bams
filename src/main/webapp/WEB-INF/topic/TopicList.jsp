<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>

<html>
<head>
    <title></title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<table class="table" id="topic-table" border="1"></table>
<script type="text/javascript">
    function search(){
        $("#topic-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        $("#topic-table").bootstrapTable({
            url:"Topic/queryTopicPage",
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
                    field: 'picid',
                    title: '话题编号',
                    idField:true,
                    width: 100
                },{
                    field: 'pictitle',
                    title: '话题标题',
                    idField:true,
                    width: 100
                },{
                    field: 'piccontent',
                    title: '图片',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        return "<img src=\""+row.piccontent+"\" width=\"100px\" height=\"50px\">"
                    },
                },{
                    field: 'starttime',
                    title: '上传时间',
                    width: 100

                }]
        })
    })

    function del(id){
        if(confirm("确定删除吗？")){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/deleteUsers.do",
                type:"post",
                data:{"userinfoid":id},
                dataType:"json",
                success:function(me){
                    if(me==1){
                        $("#user-table").bootstrapTable("refresh",{'pageNumber':1});
                    }
                },
                error:function(){
                    alert("错啦");
                }
            })
        }
    }
</script>
</body>
</html>
