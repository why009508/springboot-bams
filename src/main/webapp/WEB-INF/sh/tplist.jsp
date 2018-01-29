<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/1/25
  Time: 9:59
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
    <title>图片列表</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>

<table class="table" id="tupian-table" border="1"></table>
aaa
<script type="text/javascript">

    function search(){
        $("#tupian-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        $("#tupian-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/phtot/queryTupian.do",
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
                    field: 'phoid',
                    title: '主键',
                    idField:true,
                    width: 20
                },{
                    field: 'phourl',
                    title: '图片',
                    idField:true,
                    width: 100,
                    formatter:function(value,row,index){
                        if(row.phourl=="1"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/1.jpg" width="100" height="50">';
                        }else if(row.phourl=="2"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/2.gif" width="100" height="50">';
                        }else if(row.phourl=="3"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/3.gif" width="100" height="50">';
                        }else if(row.phourl=="4"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/4.gif" width="100" height="50">';
                        }else if(row.phourl=="5"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/5.jpg" width="100" height="50">';
                        }else if(row.phourl=="6"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/6.jpg" width="100" height="50">';
                        }else if(row.phourl=="7"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/7.jpg" width="100" height="50">';
                        }else if(row.phourl=="8"){
                            return '<img alt="没有图片" src="<%=path %>/phonos/8.jpg" width="100" height="50">';
                        }else if(row.phourl=="9"){
                            return  '<img alt="没有图片" src="<%=path %>/phonos/9.jpg" width="100" height="50">';
                        }else{
                            return  '<img alt="没有图片" src="<%=path %>/phonos/9.jpg" width="100" height="50">';
                        }
                    }
                },{
                    field: 'phoname',
                    title: '图片内容',
                    idField:true,
                    width: 150,
                },{
                    field: 'photime',
                    title: '上传时间',
                    idField:true,
                    width: 100,
                    formatter: formatDatebox,
                },{
                    field: 'pbeii',
                    title: '审核',
                    idField:true,
                    width: 100,
                    formatter:function(value,row,index){
                        // alert(row.ebeii);
                        if(row.pbeii==0){
                            return "<font color='green'>未批准</font>";
                        }else if(row.pbeii==1){
                            return "<font color='green'>已批准</font>";
                        }else{
                            return "<font color='red'>已作废</font>";
                        }
                    }
                },{
                    field:'pbeii',
                    title: '操作',
                    width: 120,
                    align: 'center',
                    idField:true,
                    formatter:function(value,row,index){
                        if(row.pbeii==0){
                            return "<input type='button' value='批准' onclick='ppizhun("+row.phoid+")'> <input type='button' value='不批准' onclick='pbupi("+row.phoid+")'>";
                        }else{
                            return "";
                        }

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

    function ppizhun(xx){
        //alert(xx);
        $.ajax({
            url:'<%=request.getContextPath()%>/phtot/updPizhunp.do',
            data:{
                phoid:xx,
            },
            type:"post",
            success:function(a){

                if(a>0){
                    $("#tupian-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){
                alert("警告","审批报错");
            }
        });

    }

    function pbupi(xxx){
        //alert(xxx);
        $.ajax({
            url:'<%=request.getContextPath()%>/phtot/updnoPizhunp.do',
            data:{
                phoid:xxx,
            },
            type:"post",
            success:function(a){

                if(a>0){
                    $("#tupian-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){
                alert("警告","审批报错");
            }
        });
    }
    </script>
</body>
</html>