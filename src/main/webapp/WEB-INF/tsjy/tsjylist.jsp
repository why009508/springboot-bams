<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/1/25
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<html>
<head>
    <title>投诉建议列表</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>

<table class="table" id="tsjy-table" ></table>
<script type="text/javascript">

    function search(){
        $("#tsjy-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        $("#tsjy-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/tsjy/queryTsjy.do",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 数据条数选择框
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:5,//每页条数
            pageList:[1,2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(){
                return {
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    field: 'comid',
                    title: '主键',
                    idField:true,
                    width: 100
                },{
                    field: 'cuid',
                    title: '投诉人id',
                    idField:true,
                    width: 100,
                    formatter:function(value,row,index){
                        // alert(row.ebeii);
                        if(row.cuid==1){
                            return "<font >张三</font>";
                        }else if(row.cuid==2){
                            return "<font >李四</font>";
                        }else{
                            return "<font '>王五</font>";
                        }
                    }
                },{
                    field: 'commsg',
                    title: '投诉信息',
                    idField:true,
                    width: 100,
                },{
                    field: 'comtime',
                    title: '投诉时间',
                    idField:true,
                    width: 100,
                    formatter: formatDatebox,
                },{
                    field:'comid',
                    title: '操作',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        return "<input type='button' value='删除' onclick='tshanchu("+row.comid+")'>";

                    }
                }
            ]
        })
    });

    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, // month
            "d+": this.getDate(), // day
            "h+": this.getHours(), // hour
            "m+": this.getMinutes(), // minute
            "s+": this.getSeconds(), // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()
            // millisecond
        }
        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    }
    function formatDatebox(value) {
        if (value == null || value == '') {
            return '';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);
        }

        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
    }

    function tshanchu(xx){
        $.ajax({
            url:'<%=request.getContextPath()%>/tsjy/delTsjy.do',
            data:{
                comid:xx,
            },
            type:"post",
            success:function(a){
                if(a>0){
                    alert("删除成功.");
                    $("#tsjy-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){
                $.messager.alert("警告","删除报错");
            }
        });

    }

</script>
</body>
</html>
