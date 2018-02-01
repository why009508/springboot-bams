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
    <%--<jsp:include page="/inc.jsp"></jsp:include>--%>
</head>
<body>




<center>
    ${loginuser.username}
    <br><br>
    <form class="form-inline" role="form">
        <div class="form-group">
            <label class="sr-only" for="name">名称</label>
            <input type="text" class="form-control" id="name" placeholder="请输入名称或编号" style="width: 250px">
        </div>
        <button type="button" class="btn btn-default" onclick="giftSearch()">搜索</button>
        <button type="button" class="btn btn-default" onclick="addGift()">新增</button>
    </form>
</center>
<div>
    <table id="gift-table" ></table>
</div>

<script type="text/javascript">

    function giftSearch(){
        $("#gift-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        /*queryType();*/
        $("[name='datet']").datetimepicker({
            format: 'yyyy-mm-dd'
        });

        $("#gift-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/Gift/queryGift",
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
            pageSize:15,//每页条数
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

                    /*searchval:$("#searchval").val(),
                    bookname:$("#bookname").val(),
                    bookwriter:$("#bookwriter").val(),
                    booktype:$("#booktype").val(),*/
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
                    },
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'giftid',
                    title: '礼品编号',
                    width: 20,
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'giftname',
                    title: '礼品名称',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'giftprice',
                    title: '礼品需要积分',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'adimg',
                    title: '礼品图片',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        return "<img src=\""+row.giftimg+"\" width=\"100px\" height=\"50px\">"
                    },
                },{
                    field: 'giftfailtime',
                    title: '礼品失效时间',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                },{
                    field: 'giftstatus',
                    title: '礼品状态',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        if(row.giftstatus==1){
                            return "<input type='button' value='礼品有效' onclick='setGiftDown(\""+row.giftid+"\")'/>";
                        }else{
                            return "<input type='button' value='礼品已失效' onclick='setGiftUp(\""+row.giftid+"\")'/>"
                        }

                    },

                }, {
                    field:'adid',
                    title: '操作',
                    width: 100,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        return actionFormatter(row.giftid);
                    },

                }, ]
        })
    })

    function actionFormatter(value, row, index) {
        var id = value;
        var result = "";
        result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"ViewGiftById('" + id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>&nbsp&nbsp&nbsp";
        result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"deleteGift('" + id + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";

        return result;
    }

    function deleteGift(id){
        var r=confirm("确定要删除id为"+id+"的礼品吗？");
        if(r==true){
            $.ajax({
                url:"<%=basePath%>/Gift/deleteGift",
                type : "post",
                data:{"giftid":id},
                success : function(data) {
                    alert("删除成功");
                    giftSearch();
                }
            })
        }

    }

    //修改
    function ViewGiftById(id){
        BootstrapDialog.show({
            title: '修改',
            message: $('<div style="height: 600px"></div>').load('<%=request.getContextPath()%>/Gift/toEditGift?giftid='+id),
            buttons: [{
                label: '修改',
                action: function(dialog) {

                    $.ajax({
                        url:'<%=request.getContextPath()%>/Gift/updateGift',
                        type:"post",
                        data:$("#update-gift-form").serialize(),
                        dataType:"json",
                        success:function(){
                            alert("修改成功");
                            giftSearch();
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

    function addGift(){

        BootstrapDialog.show({
            title: '新增礼物',
            message: $('<div style="height: 600px"></div>').load('<%=request.getContextPath()%>/Gift/toAddGift'),
            buttons: [{
                label: '新增',
                action: function(dialog) {

                    $.ajax({
                        url:'<%=request.getContextPath()%>/Gift/addGift',
                        type:"post",
                        data:$("#add-gift-form").serialize(),
                        dataType:"json",
                        success:function(){
                            alert("新增成功");
                            $("#gift-table").bootstrapTable("refresh");
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

    function setGiftDown(id){
        var r=confirm("确定要将id为"+id+"的礼品下架？");
        if(r==true){
            $.ajax({
                url:"<%=basePath%>/Gift/setGiftDown",
                type : "post",
                data:{"giftid":id},
                success : function(data) {
                    giftSearch();
                }
            })
        }
    }

    function setGiftUp(id){
        var r=confirm("确定要将id为"+id+"的礼品上架？");
        if(r==true){
            $.ajax({
                url:"<%=basePath%>/Gift/setGiftUp",
                type : "post",
                data:{"giftid":id},
                success : function(data) {
                    giftSearch();
                }
            })
        }
    }
</script>
</body>
</html>