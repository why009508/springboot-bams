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
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="<%=request.getContextPath()%>/Book/toBookList.do">首页</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li >
                <a>HELLO!</a>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.get('loginuser').username}<input type="hidden" value="${sessionScope.get('loginuser').userbirth}" id="userbirth"/></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=basePath%>/Book/toPersonalCenter.do">个人中心</a>
                    </li>

                    <li class="divider">
                    </li>

                    <li>
                        <a href="#">距生日特权还有3天！</a>
                    </li>

                    <li class="divider">
                    </li>

                    <li>
                        <a href="<%=basePath%>/login.jsp">退出</a>
                    </li>
                </ul>
            </li>
            <li>
                <a >图书馆长</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="<%=basePath%>/Book/toMyBookList.do">我的书架</a>
            </li>
            <li>
                <a href="javascript:addDialog()">添加新书</a>
            </li>
        </ul>
    </div>

</nav>

<br><br><br>
<center>
    ${loginuser.username}

    <select id="sel" onchange="selchange()">
        <option value="1">所有类别</option>
        <option value="2">书名</option>
        <option value="3">作者</option>
        <option value="4">类型</option>
    </select>&nbsp&nbsp
    <!-- <input style="width:400px"/> -->
    <span id="changspan"><input style="width:400px" id="searchval" /></span>&nbsp&nbsp&nbsp&nbsp
    <input type="button" value="全站搜索" onclick="search()"/>


    <table class="table" id="stu-table" border="1"></table>

</center>










<%--<!--jQuery核心js  -->
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<!-- bootstrap 核心js文件 -->
<script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- bootStrap TreeView -->
<script src="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>

<!-- bootStrap addTabs -->
<script src="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.js"></script>

<!-- bootStrap table -->
<script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.js"></script>
<!-- bootStrap table 语言包中文-->
<script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>

<!-- bootstrap-datetimepicker -->
<script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<!-- bootstrap-dialog -->
<script src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<!-- bootstrap-fileinput -->
<script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>--%>
<script type="text/javascript">
    /*function addDialog(){
        BootstrapDialog.show({
            title: '添加新书',
            message: $('<div></div>').load('<%=request.getContextPath()%>/Book/toAddBook.do'),
            buttons: [{
                label: '保存',
                action: function(dialog) {

                    $.ajax({
                        url:'<%=request.getContextPath()%>/Book/addBook.do',
                        type:"post",
                        data:$("#add-form").serialize(),
                        dataType:"json",
                        success:function(){
                            alert("成功");
                            $("#stu-table").bootstrapTable("refresh",{'pageNumber':1});
                            $("#my-stu-table").bootstrapTable("refresh",{'pageNumber':1});
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
    }*/

    function search(){
        $("#stu-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    /*var str="<select id='booktype' style='width:400px'>";
    function queryType(){
        $.ajax({
            url:'<%=request.getContextPath()%>/Book/queryType.do',
            type:"post",
            dataType:"json",
            success:function(data){
                for (var i = 0; i < data.length; i++) {
                    str+="<option value='"+data[i].typeid+"'>"+data[i].typename+"</option>"
                }
                str+="</select>"

            }

        })
    }*/

    $(function(){
        queryType();
        $("[name='datet']").datetimepicker({
            format: 'yyyy-mm-dd'
        });

        $("#stu-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/Book/queryBookPage.do",
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
            pageSize:5,//每页条数
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

                    searchval:$("#searchval").val(),
                    bookname:$("#bookname").val(),
                    bookwriter:$("#bookwriter").val(),
                    booktype:$("#booktype").val(),
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
                    }
                },{
                    title: '封面',
                    width: 20,
                    formatter:function(value,row,index){
                        return "<img src='<%=basePath%>"+row.bookimg+"' width='50px' height='50px' />";
                    }
                },{
                    field: 'bookname',
                    title: '书名',
                    width: 100
                },{
                    field: 'bookwriter',
                    title: '作者',
                    width: 100
                },{
                    field: 'booktype',
                    title: '类型',
                    width: 100,

                },{
                    field: 'bookprice',
                    title: '价格',
                    width: 100,

                },{
                    field: '',
                    title: '简介',
                    width: 100,
                    formatter:function(value,row,index){
                        if(row.bookintro.length>15){
                            return row.bookintro.substring(0,15)+"...";
                        }else{
                            return row.bookintro;
                        }

                    }

                },{
                    field: '',
                    title: '操作',
                    width: 100,
                    formatter:function(value,row,index){
                        return "<input type='button' value='修改' onclick='updateBook(\""+row.bookid+"\")' />";
                    }

                }]
        })
    })

    /*function selchange(){
        if($("#sel").val()=="1"){
            $("#changspan").html("<input style='width:400px' id='searchval' placeholder=''/>")
        }else if($("#sel").val()=="2"){
            $("#changspan").html("<input style='width:400px' id='bookname' placeholder='书名'/>")
        }else if($("#sel").val()=="3"){
            $("#changspan").html("<input style='width:400px' id='bookwriter' placeholder='作者'/>")
        }else if($("#sel").val()=="4"){
            $("#changspan").html(str)
        }
    }*/
    //修改
    /*function updateBook(id){
        alert(id);
        BootstrapDialog.show({
            title: '修改',
            message: $('<div></div>').load('<%=request.getContextPath()%>/Book/toUpdateBook.do?bookid='+id),
            buttons: [{
                label: '修改',
                action: function(dialog) {

                    $.ajax({
                        url:'<%=request.getContextPath()%>/Book/updateBook.do',
                        type:"post",
                        data:$("#update-form").serialize(),
                        dataType:"json",
                        success:function(){
                            alert("成功");
                            $("#stu-table").bootstrapTable("refresh",{'pageNumber':1});
                            $("#my-stu-table").bootstrapTable("refresh",{'pageNumber':1});
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
    }*/

</script>
</body>
</html>