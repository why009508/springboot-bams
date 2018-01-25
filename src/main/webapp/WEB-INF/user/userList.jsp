<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>

<html>
<head>
    <title>网站用户管理</title>
    <jsp:include page="/inc.jsp"></jsp:include>
</head>
<body>
<div style="padding: 100px 100px 10px;">
        <div class="input-group">
            <span class="input-group-addon">@</span>
            <input type="text" class="form-control" id="fname" placeholder="请输入昵称">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">@</span>
            <input type="text" class="form-control" id="uname" placeholder="请输入账号">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">@</span>
            <input type="text" class="form-control" id="jobname" placeholder="请输入行业">
        </div>
</div>
<center>
    <a href="javaScript:search()" class="button button-raised button-pill button-inverse">搜索</a>
</center>
<table class="table" id="user-table" border="1"></table>
<script type="text/javascript">
    function search(){
        $("#user-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){

        $("[name='datet']").datetimepicker({
            format: 'yyyy-mm-dd'
        });

        $("#user-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/user/queryUserPage.do",
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
                    fname:$("#fname").val(),
                    uname:$("#uname").val(),
//                    cotype:$("[name='cotype'] option:selected").val(),
                    joname:$("#jobname").val(),
//                    starttime:$("#uname").val(),
//                    endtime:$("#endtime").val(),
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'userinfoid',
                    title: '用户编号',
                    idField:true,
                    width: 100
                },{
                    field: 'fname',
                    title: '用户昵称',
                    idField:true,
                    width: 100
                },{
                    field: 'uname',
                    title: '用户账号',
                    width: 100

                },{
                    field: 'usergraph',
                    title: '用户签名',
                    width: 100

                },{
                    field: 'usersex',
                    title: '用户性别',
                    width: 100,
                    formatter:function(value,row,index){
                        if(row.usersex=="1"){
                            return "男"
                        }else if(row.usersex=="2"){
                            return "女"
                        }
                    }

                },{
                    field: 'userinformation',
                    title: '基本信息',
                    width: 100

                },{
                    field: 'userbirdaty',
                    title: '用户生日',
                    width: 100

                },{
                    field: 'userlove',
                    title: '恋爱状态',
                    width: 100,
                    formatter:function(value,row,index){
                        if(row.userlove=="1"){
                            return "单身"
                        }else if(row.userlove=="2"){
                            return "恋爱"
                        }else if(row.userlove=="3"){
                            return "热恋"
                        }else if(row.userlove=="4"){
                            return "已婚"
                        }
                    }

                },{
                    field: 'useremail',
                    title: '邮箱',
                    width: 100

                },{
                    field: 'userphone',
                    title: '手机号码',
                    width: 100

                },{
                    field: 'userqq',
                    title: 'QQ',
                    width: 100

                },{
                    field: 'userwei',
                    title: '微信',
                    width: 100

                },{
                    field: 'joname',
                    title: '行业',
                    width: 100

                },{
                    field: 'jifen',
                    title: '积分',
                    width: 100

                },{
                    field: 'money',
                    title: '余额',
                    width: 100

                },{
                    field: 'etitle',
                    title: '征文标题',
                    width: 100

                },{
                    field: 'etime',
                    title: '提交时间',
                    width: 100

                }, {
                    field: 'pname',
                    title: '提现账号',
                    width: 100

                },{
                    field: 'pmoney',
                    title: '提现金额',
                    width: 100

                },{
                    field: 'ptime',
                    title: '提现时间',
                    width: 100

                },{
                    field: 'winmoney',
                    title: '获奖金额',
                    width: 100

                },{
                    field: 'wintime',
                    title: '获奖时间',
                    width: 100

                },{
                    field: 'winreason',
                    title: '获奖原因',
                    width: 100

                },{
                    field: 's',
                    title: '操作',
                    width: 100,
                    formatter:function(value,row,index){
                        return "<button type='button' class='btn btn-default' onClick='del("+row.userinfoid+")'>删除</button>";
                    }
                },]
        })
    })
    function toupauto1(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/user/updateAuto1.do",
            type:"post",
            data:{"coid":id},
            dataType:"json",
            success:function(commodity){
                if(commodity=="1"){
                    $("#co-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){

            }
        })
    }
    function toupauto2(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/com/updateAuto2.do",
            type:"post",
            data:{"coid":id},
            dataType:"json",
            success:function(commodity){
                if(commodity=="1"){
                    $("#user-table").bootstrapTable("refresh",{'pageNumber':1});
                }
            },
            error:function(){

            }
        })
    }

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
