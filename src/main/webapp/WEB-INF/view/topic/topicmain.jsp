<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/25/025
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootbox/bootbox.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/common/mystyle.jsp"></script>
    <%--专题列表管理--%>
</head>
<body>
<%--修改，删除按钮区--%>
<div class="panel-body">
    <div id="tabToolBarN">
        <div class="btn-group">

            <button type="button" class="btn btn-default" onclick="topicUpdate()">
                <span class="glyphicon glyphicon-wrench">修改</span>
            </button>
            <button id="removeButtonN" type="button" class="btn btn-error">
                <span class="glyphicon glyphicon-scissors" onclick="topicDel()">删除</span>
            </button>

        </div>

    </div>
    <%--展示内容依托的table标签--%>
    <table id="topicTable"></table>
</div>

<script type="text/javascript">
    /*分页回显内容*/
    $(function (){
        $("#topicTable").bootstrapTable({
            url:"<%=request.getContextPath()%>/topic/queryTopic.do",
            method:"post",
            striped: true,  	// 斑马线效果     默认false
            //只允许选中一行
            singleSelect:true,
            //选中行是不选中复选框或者单选按钮
            clickToSelect:true,
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false, 					//是否显示详细视图
            // 自定义的主键ID
            uniqueId: "picid",                 //每一行的唯一标识，一般为主键列
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
                        return  "<input type='checkbox' value='"+row.picid+"' name='chk'/>";
                    }
                },
                {field:'picid',title:'编号',width:100},
                {field:'pictitle',title:'标题',width:100},
                {field:'piccontent',title:'对应图片',width:100,
                    formatter:function(value,row,index){//value 当前字段值  row当前行的数据  index当前行
                        return "<img  class='img-responsive img-round'   width='100' heigth='100' src='<%=request.getContextPath()%>/"+value+"'/>";
                    }
                },
                {field:'starttime',title:'开始时间',width:100},
                {field:'endtime',title:'结束时间',width:100},
                {field:'statue',title:'话题状态',width:100,
                    formatter:function(value,row,index){//value 当前字段值  row当前行的数据  index当前行
                        if(value==0){
                            return "未启用";
                        }else if(value==1){
                            return "启用中";
                        }else if(value==2){
                            return "已过期";
                        }else if(value==3){
                            return "未到话题开始时间";
                        }else{
                            return "bug";
                        }

                    }
                },
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

    /*//   -------    批量删除   ------
    function deleteAll(){
        var length=$("[name='chk']:checked").length;

        if(length<=0){
            bootbox.alert("请谨慎选择");
            return;
        }
        var ids="";
        $("[name='chk']:checked").each(function(){
            //当该方法用于返回属性值时，则返回第一个匹配元素的值。
            // 当该方法用于设置属性值时，则为匹配元素集合设置一个或多个属性/值对。
            ids+=","+$(this).prop("value");
        })
        alert(ids);
        // 确认删除
        var flag= confirm("确认删除"+length+"条信息吗?");

        if(flag){
            var ids=ids.substr(1);
            alert(ids);
            $.ajax({
                url:'%=request.getContextPath()%>/Essay/deleteAll',
                type:'post',
                data:{"ids":ids},//不能用ids+= ids的形式（那个是在.do后拼接时用的）
                success:function(data){
                    bootbox.alert("删除成功");
                    $("#essayTable").bootstrapTable('refresh');
                },
                error:function(){
                    alert(404);
                }
            });
        }
    }
    //模态修改的关联代码1
    //=======================================锁住页面================================================
    function getJspHtml(urlStr){
        var  jspHtml = "";

        //async  (默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。
        //注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
        $.ajax({
            url:urlStr,
            type:'post',

            //同步的ajax
            async:false,
            success:function(data){
                //alert(data);//展示下看看
                //data--addGame.jsp页面内容
                jspHtml = data;
            },
            error:function(){
                bootbox.alert("ajax失败");
            }
        });
        return jspHtml;
    }
    //模态修改的关联代码2
    //=======================================分装模态窗口====================================================
    function dialog(HTMLurl,submitUrl,title){
        var  dialog = bootbox.dialog({
            title: title,
            message: getJspHtml(HTMLurl),   //调用方法
            buttons:{
                "save":{
                    label: '保存修改',
                    //自定义样式
                    className: "btn-success",
                    callback: function() {
                        $.ajax({
                            url:submitUrl,
                            type:'post',
                            data:$("#EssayForm").serialize(),
                            success:function(aaa){

                                bootbox.alert("保存成功");

                                $("#essayTable").bootstrapTable('refresh');

                                search();

                            },
                            error:function(){
                                bootbox.alert("ajax失败");
                            }
                        });
                    }
                },
                "unSave":{
                    label: '取消',
                    //自定义样式
                    className: "btn-info",
                    callback: function() {
                        // return false;  //dialog不关闭
                    }
                }
            }
        });
    }

    //==========================================模态修改==================================================
    function essayUpdate(){

        if($("[name='chk']:checked").length==1){
            var id=$("[name='chk']:checked")[0].value;
            //参数1：创建模态框。参数2：修改
            dialog("/Essay/creatDialog.do?esid="+id,"%=request.getContextPath()%>Essay/AllSubmit.do","修改征文信息");

        }else{
            bootbox.alert("只能修改一个");
        }

    }*/

    /* function essayUpdate() {
         var id=$("[name='chk']:checked")[0].value;
         BootstrapDialog.show({

             title: "驳回详情",
             message: $('<div></div>').load('%=request.getContextPath()%>/Essay/creatDialog.do?esid=' + id),
             buttons: [{
                 label: '保存',
                 cssClass: 'btn-primary',
                 action: function (dialogItself) {
                     $.ajax({
                         url: "%=request.getContextPath()%>/Essay/AllSubmit.do",
                         data: $("#EssayForm").serialize(),
                         dataType: "text",
                         type: "post",
                         success: function (data) {
                             dialogItself.close();
                             $('#essayTable').bootstrapTable("refresh");
                         },
                         error: function () {
                             BootstrapDialog.show({
                                 message: '操作有误'
                             });
                         }

                     })
                 }
             }, {
                 label: '取消',
                 cssClass: 'btn-warning ',
                 action: function (dialogItself) {
                     dialogItself.close();

                 }
             }]
         });
     }
*/

</script>
</body>
</html>
