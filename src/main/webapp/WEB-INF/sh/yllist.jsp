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
    <title>娱乐列表</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<input type="hidden" id="userjs" name="userjs" value="${loginuser.ustatic}">
<table class="table" id="xiao2-table" border="1"></table>

<script type="text/javascript">

    function search(){
        $("#xiao2-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        $("#xiao2-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/ylc/yllist.do",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 数据条数选择框
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            //      search:true,//是否显示搜索框
            //searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
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
                    field: 'joid',
                    title: '主键',
                    idField:true,
                    width: 20,
                },{
                    field: 'jotitle',
                    title: '笑话标题',
                    idField:true,
                    width: 100
                },{
                    field: 'jotime',
                    title: '上传时间',
                    idField:true,
                    width: 180,
                    formatter: formatDatebox,
                },{
                    field: 'jocontent',
                    title: '内容',
                    idField:true,
                    width: 180
                },{
                    field: 'jotype',
                    title: '类型',
                    idField:true,
                    width: 100,
                },{
                    field: 'juid',
                    title: '发布人id',
                    idField:true,
                    width: 100
                },{
                    field: 'beii',
                    title: '审核',
                    idField:true,
                    width: 100,
                    formatter:function(value,row,index){
                        // alert(row.ebeii);
                        if(row.beii==0){
                            return "<font color='green'>未批准</font>";
                        }else if(row.beii==1){
                            return "<font color='green'>已批准1</font>";
                        }else if(row.beii==2){
                            return "<font color='green'>已批准2</font>";
                        }else{
                            return "<font color='red'>已作废</font>";
                        }
                    }
                },{
                    field:'beii',
                    title: '操作',
                    width: 150,
                    idField:true,
                    align: 'center',
                    formatter:function(value,row,index){
                        var bbb = $("#userjs").val();
                        // alert(bbb);
                        if(bbb==0 && row.beii ==1){
                            return "<input type='button' class=\"btn btn-success\" value='批准2' onclick='ypizhun2("+row.joid+")'> <input type='button' value='不批准' onclick='ybupi("+row.joid+")'>";
                        }else if(bbb==0 && row.beii ==2){
                            return " <input type='button' class=\"btn btn-warning\" value='不批准' onclick='ybupi("+row.joid+")'>";
                        }else if(bbb==1 && row.beii ==0){
                            return "<input type='button' class=\"btn btn-success\" value='批准1' onclick='ypizhun("+row.joid+")'>";
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

    function ypizhun(xx){
        //alert(xx);
        $.ajax({
            url:'<%=request.getContextPath()%>/ylc/updPiyule.do',
            data:{
                joid:xx,
            },
            type:"get",
            success:function(a){

                if(a>0){
                    $("#xiao2-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){
                alert("警告","审批报错");
            }
        });

    }

    function ypizhun2(xx){
        //alert(xx);
        $.ajax({
            url:'<%=request.getContextPath()%>/ylc/updPiyule2.do',
            data:{
                joid:xx,
            },
            type:"get",
            success:function(a){

                if(a>0){
                    $("#xiao2-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){
                alert("警告","审批报错");
            }
        });

    }

    function ybupi(xxx){
        //alert(xxx);
        $.ajax({
            url:'<%=request.getContextPath()%>/ylc/updbuPiyule.do',
            data:{
                joid:xxx,
            },
            type:"get",
            success:function(a){

                if(a>0){
                    $("#xiao2-table").bootstrapTable("refresh",{'pageNumber':1});
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
