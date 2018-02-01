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
    <title>文章列表</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<input type="hidden" id="username" name="username" value="${userName}">
<input type="hidden" id="userjs" name="userjs" value="${userjs}">
<table class="table" id="wenz-table" border="1"></table>

<script type="text/javascript">

    function search(){
        $("#wenz-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        $("#wenz-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/milu/queryWenz.do",
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
                    field: 'esid',
                    title: '主键',
                    idField:true,
                    width: 20
                },{
                    field: 'estitle',
                    title: '标题',
                    idField:true,
                    width: 100
                },{
                    field: 'esuid',
                    title: '用户',
                    idField:true,
                    width: 100,
                    formatter:function(value,row,index){
                        var ddd = $("#username").val();
                        return ddd;
                    }
                },{
                    field: 'escontent',
                    title: '内容',
                    idField:true,
                    width: 150,
                },{
                    field: 'estime',
                    title: '上传时间',
                    idField:true,
                    width: 100,
                    formatter: formatDatebox,
                },{
                    field: 'pid',
                    title: '话题表id',
                    idField:true,
                    width: 100,
                },{
                    field: 'ebeii',
                    title: '审核',
                    idField:true,
                    width: 100,
                    formatter:function(value,row,index){
                       // alert(row.ebeii);
                        if(row.ebeii==0){
                            return "<font color='green'>未批准</font>";
                        }else if(row.ebeii==1){
                            return "<font color='green'>已批准1</font>";
                        }else if(row.ebeii==2){
                            return "<font color='green'>已批准2</font>";
                        }else{
                            return "<font color='red'>已作废</font>";
                        }

                    }
                },{
                    field:'ebeii',
                    title: '操作',
                    width: 120,
                    align: 'center',
                    idField:true,
                    formatter:function(value,row,index){
                        var bbb = $("#userjs").val();
                        // alert(bbb);
                        if(bbb==0 && row.ebeii ==1){
                            return "<input type='button' value='批准2' onclick='ppizhun2("+row.esid+")'> <input type='button' value='不批准' onclick='pbupi("+row.esid+")'>";
                        }else if(bbb==0 && row.ebeii ==2){
                            return " <input type='button' value='不批准' onclick='pbupi("+row.esid+")'>";
                        }else if(bbb==1 && row.ebeii ==0){
                            return "<input type='button' value='批准1' onclick='ppizhun("+row.esid+")'>";
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
            url:'<%=request.getContextPath()%>/milu/updPizhun.do',
            data:{
                esid:xx,
            },
            type:"post",
            success:function(a){

                if(a>0){
                    $("#wenz-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){
               alert("警告","审批报错");
            }
        });

    }

    function ppizhun2(xx){
        //alert(xx);
        $.ajax({
            url:'<%=request.getContextPath()%>/milu/updPizhun2.do',
            data:{
                esid:xx,
            },
            type:"post",
            success:function(a){

                if(a>0){
                    $("#wenz-table").bootstrapTable("refresh",{'pageNumber':1});
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
            url:'<%=request.getContextPath()%>/milu/updnoPizhun.do',
            data:{
                esid:xxx,
            },
            type:"post",
            success:function(a){

                if(a>0){
                    $("#wenz-table").bootstrapTable("refresh",{'pageNumber':1});
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
