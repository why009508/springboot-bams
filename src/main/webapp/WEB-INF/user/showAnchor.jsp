    <%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/19
  Time: 20:55
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
    <title>主播管理</title>


</head>
<body>
<input type="button" value="新增" onclick="toAddAnchor()">
<input type="button" value="批量修改密码" onclick="plUpdateAnchor()">
<table class="table" id="anchor-table" border="1"></table>

<script>

    $(function(){
        $("#anchor-table").bootstrapTable({
            url:"anchor/queryAnchorByPage.do",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            search:true,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:3,//每页条数
            pageList:[3,6,9],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
              //定义一个搜索框中传的是班级名字
                var str = params.search;
                return {
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'anname',
                    title: '名称',
                    idField:true,
                    width: 100
                },{
                    field: 'annum',
                    title: '身份证',
                    width: 100
                },{
                    field: 'anusername',
                    title: '账号',
                    width: 100

                },{
                    field: 'anpass',
                    title: '密码',
                    width: 100

                },{
                    field: 'm',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' value='修改' class=\"btn btn-primary\"  onClick='updateAnchor("+rowdata.anid+")'/>"+
                            "&nbsp&nbsp<input type='button' value='删除' class=\"btn btn-danger\"  onClick='deleteAnchor("+rowdata.anid+")'/>";
                    }

                }
            ]
        })

    })


//删除
    function deleteAnchor(cid){
        $.ajax({
            url:"anchor/deleteAnchor.do",

            type:"post",

            data:{"anid":cid},

            dataType:"text",
            async:false,
            success:function (){
                $("#anchor-table").bootstrapTable("refresh",{'pageNumber':1});
            },
            error:function (){
                alert("删除出错，请检查程序");
            }
        })
    }

    //修改密码
    function updateAnchor(ids){
        BootstrapDialog.show({

            title: '修改主播信息',
            message: $('<div></div>').load('anchor/toUpShow.do?anid='+ids),

            buttons: [{
                label: '修改',
                action: function(dialog) {

                    $.ajax({
                        url:"anchor/updateAnchor.do",

                        type:"post",

                        data:$("#up-form").serialize(),

                        dataType:"text",
                        async:false,
                        success:function (data){
                            if(data>0){
                                alert("修改成功");
                                dialog.close();
                                $("#anchor-table").bootstrapTable("refresh",{'pageNumber':1});
                            }
                        },
                        error:function (){
                            alert("修改出错，请检查程序");
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


    //批量修改
    function  plUpdateAnchor(){
        //获取所有被选中的记录
        var rows = $("#anchor-table").bootstrapTable('getSelections');

        if (rows.length== 0) {
            alert("请先选择要修改的记录!");
            return;
        }else{
            var plids = '';
            for (var i = 0; i < rows.length; i++) {
                plids += rows[i]['anid'] + ",";
            }
            plids = plids.substring(0, plids.length - 1);
            alert(plids);
            var msg = "您真的确定要修改吗？";
            if (confirm(msg) == true) {

                BootstrapDialog.show({

                    title: '批量修改主播密码',
                    message: $('<div></div>').load('anchor/plShowUp.do?plids='+plids),

                    buttons: [{
                        label: '修改',
                        action: function(dialog) {

                            $.ajax({
                                url:"anchor/updatePlAnchor.do?plids="+plids,

                                type:"post",

                                data:$("#plup-form").serialize(),

                                dataType:"text",
                                async:false,
                                success:function (data){
                                    if(data>0){
                                        alert("修改成功");
                                        dialog.close();
                                        $("#anchor-table").bootstrapTable('refresh');
                                    }
                                },
                                error:function (){
                                    alert("修改出错，请检查程序");
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
        }


    }

    //新增主播信息
    function toAddAnchor() {
        BootstrapDialog.show({
            title: '新增主播信息',
            message: $('<div></div>').load('anchor/toAddShow.do'),

            buttons: [{
                label: '新增',
                action: function(dialog) {

                    $.ajax({
                        url:"anchor/addAnchor.do",

                        type:"post",

                        data:$("#addAnchor-form").serialize(),

                        dataType:"text",
                        async:false,
                        success:function (data){
                            if(data>0){
                                alert("新增成功");
                                dialog.close();
                                $("#anchor-table").bootstrapTable("refresh",{'pageNumber':1});
                            }
                        },
                        error:function (){
                            alert("新增出错，请检查程序");
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

</script>

</body>
</html>
