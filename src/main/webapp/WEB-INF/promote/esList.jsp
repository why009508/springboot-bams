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

    <br><br>
    <form class="form-inline" role="form">
        <div class="form-group">
            <label class="sr-only" for="name">名称</label>
            <input type="text" class="form-control" id="name" placeholder="请输入名称或编号" style="width: 250px">
        </div>
        <button type="button" class="btn btn-default" onclick="search()">搜索</button>
    </form>
</center>
<div>
    <table id="essay-table" ></table>
</div>

<script type="text/javascript">

    function search(){
        $("#essay-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        /*queryType();*/
        $("[name='datet']").datetimepicker({
            format: 'yyyy-mm-dd'
        });

        $("#essay-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/Essay/queryEssay",
            method:"post",
            striped: true,  	// 斑马线效果     默认false
            //只允许选中一行
            singleSelect:true,
            //选中行是不选中复选框或者单选按钮
            clickToSelect:true,
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false, 					//是否显示详细视图
            // 自定义的主键ID
            uniqueId: "esid",                 //每一行的唯一标识，一般为主键列
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,     //  最少留两列
            detailView: false,                  //是否显示父子表
            //发送到服务器的数据编码类型
            contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
            toolbar:'#tabToolBar',   //  工具定义位置
            columns:[
                {field:'chk',title:'选项框',width:50,
                    formatter:function(value,row,index){   //  格式化  当前单元格内容
                        //注意value='"+row.esid+"'
                        return  "<input type='checkbox' value='"+row.esid+"' name='chk'/>";
                    }
                },
                {field:'esid',title:'编号',width:100},
                {field:'estitle',title:'标题',width:100},
                {field:'fullname',title:'作者',width:100},
                {field:'escontent',title:'内容',width:100},
                {field:'esimg',title:'对应图片',width:100,
                    formatter:function(value,row,index){//value 当前字段值  row当前行的数据  index当前行
                        return "<img  class='img-responsive img-round'   width='100' heigth='100' src='<%=request.getContextPath()%>/"+value+"'/>";
                    }
                },
                {field:'estime',title:'提交时间',width:100},
                {field:'pictitle',title:'所属话题',width:100},
                {field:'statue',title:'文章状态',width:100,
                    formatter:function(value,row,index){//value 当前字段值  row当前行的数据  index当前行
                        if(value==0){
                            return "未审核";
                        }else if(value==1){
                            return "已审核";
                        }else{
                            return "bug";
                        }

                    }
                }, {
                    field:'promote',
                    title: '是否推广',
                    width: 60,
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                        console.info(row)
                        var name = row.estitle;
                        if(row.promote==1){
                            return "<input type='button' value='推广' onclick='proEssay("+row.esid+",&quot"+name+"&quot)'/>";
                        }else if(row.promote==2){
                            return "<input type='button' value='取消推广' onclick='cancelPromote("+row.esid+",&quot"+name+"&quot)'/>";
                        }
                        return "";
                    },

                }

            ],
            //传递参数（*）
            queryParams: function(params) {
                // 获取当前页和每页条数
                dataSize = params.limit;
                dataStart = params.offset+1;
                var whereParams = {
                    /*
                        分页  自定义的参数         默认传 limit（展示几条）    offset（从第几条开始    起始条数）
                    */
                    "pageSize":params.limit,
                    "start":params.offset,
                    /*"clearName":$("#proName").val(),
                    "clearName":params.search,//精确搜索产品名称*/
                }
                return whereParams;
            },
            //前台--排序字段
            //sortName:'proPrice',
            //sortOrder:'desc',
            //前台--搜索框
            search:true,
            //启动回车键做搜索功能
            searchOnEnterKey:true,
            //分页方式   后台请求的分页方式
            sidePagination:'server',
            pagination: true,                   //是否显示分页（*）
            pageNum: 1,                       //每页的记录行数（*）
            pageSize: 3,                       //每页的记录行数（*）
            pageList: [3, 6, 9,12],        //可供选择的每页的行数（*）
        });
    })



    function proEssay(id,name){
        var r=confirm("确定要推广id为"+id+",标题为"+name+"的文章吗？");
        if(r==true){
            $.ajax({
                url:"<%=basePath%>/Promote/proEssay",
                type : "post",
                data:{"esid":id},
                success : function(data) {
                    alert("推广成功");
                    search();
                }
            })
        }

    }

    function cancelPromote(id,name){
        var r=confirm("确定要取消id为"+id+",标题为"+name+"的文章的推广吗？");
        if(r==true){
            $.ajax({
                url:"<%=basePath%>/Promote/cancelPromote",
                type : "post",
                data:{"esid":id},
                success : function(data) {
                    alert("取消成功");
                    search();
                }
            })
        }

    }

</script>
</body>
</html>