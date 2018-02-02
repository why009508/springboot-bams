<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <%--<!-- bootstrap 3.0.2 -->
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />--%>
    <!-- Bootstrap 插件 css -->
    <link href="<%=basePath%>/js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Bootstrap 核心css -->
    <link href="<%=basePath%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap TreeView css -->
    <link href="<%=basePath%>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">
    <!-- Bootstrap addTabs css -->
    <link href="<%=basePath%>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
    <!-- Bootstrap table css -->
    <link href="<%=basePath%>/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker css -->
    <link href="<%=basePath%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- bootstrap-dialog css -->
    <link href="<%=basePath%>/js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">



    <!-- font Awesome -->
    <link href="<%=basePath%>/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="<%=basePath%>/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="<%=basePath%>/css/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="<%=basePath%>/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />


    <!-- fullCalendar -->
    <link href="<%=basePath%>/css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />


    <!-- Daterange picker -->
    <link href="<%=basePath%>/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="<%=basePath%>/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="<%=basePath%>/css/AdminLTE.css" rel="stylesheet" type="text/css" />
</head>

<body>





<!-- jQuery 2.0.2 -->
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <!-- jQuery UI 1.10.3 -->
    <script src="<%=basePath%>/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="<%=basePath%>/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- My97 -->
    <script type="<%=basePath%>/text/javascript" src="<%=path%>/My97/My97DatePicker/WdatePicker.js"></script>

    <!-- bootStrap TreeView -->
    <script src="<%=basePath%>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
    <!-- bootStrap addTabs -->
    <script src="<%=basePath%>/js/bootStrap-addTabs/bootstrap.addtabs.js"></script>
    <!-- bootStrap table -->
    <script src="<%=basePath%>/js/bootstrap-table/dist/bootstrap-table.js"></script>
    <!-- bootstrap-datetimepicker -->
    <script src="<%=basePath%>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="<%=basePath%>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <!-- bootstrap-dialog -->
    <script src="<%=basePath%>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
    <!-- bootStrap table 语言包中文-->
    <script src="<%=basePath%>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>


    <!-- Morris.js charts -->
    <script src="<%=basePath%>/js/raphael-min.js"></script>
    <script src="<%=basePath%>/js/plugins/morris/morris.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="<%=basePath%>/js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="<%=basePath%>/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>

    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

    <!-- fullCalendar -->
    <script src="<%=basePath%>/js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>


    <!-- jQuery Knob Chart -->
    <script src="<%=basePath%>/js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="<%=basePath%>/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="<%=basePath%>/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="<%=basePath%>/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>


    <!-- AdminLTE App -->
    <script src="<%=basePath%>/js/AdminLTE/app.js" type="text/javascript"></script>
</body>
</html>
