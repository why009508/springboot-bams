<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <title>产品制作</title>
</head>

<body>
<!--内容部分-->
<div class="qb-content-wrapper">
    <div class="qb-content">
        <!--当前位置-->
        <div class="currentLocation clearfix">
            <span class="pull-left">产品管理 &gt; 产品制作</span>
            <div class="nav-btn pull-right">
                <input type="button" class="btn btn-info" value="桌面">
                <input type="button" class="btn btn-info returnBtn" value="返回">
            </div>
        </div>
        <!--主要内容-->
        <div class="container-fluid">
            <div class="row qb-content-wrapper qb-main-content">
                <div class="col-md-12 col-xs-12">
                    <ul class="nav nav-tabs tabs" role="tablist">
                        <li role="presentation" class="tab-list active">
                            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">信息检索
                                <i class="fa fa-remove tab-close"></i></a>
                        </li>
                        <li role="presentation" class="tab-list"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">产品制作
                            <i class="fa fa-remove tab-close"></i></a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <iframe class="iframe" src="informationRetrieval.html"></iframe>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <iframe class="iframe" src="productiframe.html"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script></script>
<script src="js/jquery-1.11.2-min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('.tab-close').on('click', function(ev) {
        var ev=window.event||ev;
        ev.stopPropagation();
        //先判断当前要关闭的tab选项卡有没有active类，如果有则给下一个选项卡以及内容添加active
        var gParent=$(this).parent().parent(),
            parent=$(this).parent();
        if(gParent.hasClass('active')){
            if(gParent.index()==gParent.length){
                gParent.prev().addClass('active');
                $(parent.attr('href')).prev().addClass('active');
            }else{
                gParent.next().addClass('active');
                $(parent.attr('href')).next().addClass('active');
            }
        }
        gParent.remove();
        $(parent.attr('href')).remove();
    });
</script>
</body>
</html>