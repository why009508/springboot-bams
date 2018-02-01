<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/1/23
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>笑话列表</title>
    <jsp:include page="/inc.jsp"></jsp:include>

</head>
<body>
<form class="form-inline" role="form">
    <div class="form-group">
        <label class="sr-only" for="name">名称</label>
        <input type="text" class="form-control" id="name" placeholder="请输入标题或主键" style="width: 250px">
    </div>
    <button type="button" class="btn btn-default" onclick="search()">搜索</button>
    <button type="button" class="btn btn-default" onclick="addXhua()">新增</button>
</form>

<table class="table" id="xiao-table" border="1"></table>

<script type="text/javascript">

    function addXhua(){
        BootstrapDialog.show({
            title: '添加笑话',
            message: $('<div></div>').load('<%=request.getContextPath()%>/xhc/toAddXhua'),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    $.ajax({
                        url:'<%=request.getContextPath()%>/xhc/addXhua.do',
                        type:"get",
                        data:$("#addXiaoh").serialize(),
                        dataType:"json",
                        success:function(){
                            //alert("成功");
                            $("#xiao-table").bootstrapTable("refresh",{'pageNumber':1});
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

    function search(){
        $("#xiao-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        $("#xiao-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/xhc/queryXh.do",
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
                    jotitle:$("#name").val(),
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
              /*  {
                    field: '',
                    title: "<input type='button' onclick='deleteLoans()' value='批量删除'/>",
                    width: 10
                },*/{//列
                    checkbox: true,

                },
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
                    width: 100,
                    formatter: formatDatebox,
                },{
                    field: 'jocontent',
                    title: '内容',
                    idField:true,
                    width: 100
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
                    field:'joid',
                    title: '操作',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        return "<input type='button' value='修改' onclick='cxiugai("+row.joid+")'>  <input type='button' value='删除' onclick='cshanchu("+row.joid+")'>";

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

    function cxiugai(xx){
      //  alert(xx);
        BootstrapDialog.show({
            title: '修改笑话',
            message: $('<div></div>').load('<%=request.getContextPath()%>/xhc/toUpdXhua?joid='+xx),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    $.ajax({
                        url:'<%=request.getContextPath()%>/xhc/updXhua.do',
                        type:"get",
                        data:$("#updXiaoh").serialize(),
                        dataType:"json",
                        success:function(){
                            //alert("成功");
                            $("#xiao-table").bootstrapTable("refresh",{'pageNumber':1});
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
    function cshanchu(oo){
        $.ajax({
            url:'<%=request.getContextPath()%>/xhc/delXiaoh.do',
            data:{
                joid:oo,
            },
            type:"post",
            success:function(a){
                if(a>0){
                    alert("删除成功.");
                    $("#xiao-table").bootstrapTable("refresh",{'pageNumber':1});
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
