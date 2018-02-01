<%--
  Created by IntelliJ IDEA.
  User: 梦浮生
  Date: 2018/1/18
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Login Form Styling</title>
    <jsp:include page="/inc.jsp"></jsp:include>
    <meta name="description" content="Custom Login Form Styling with CSS3" />
    <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
    <meta name="author" content="Codrops" />
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/modernizr.custom.63321.js"></script>
    <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    <style>
        @import url(http://fonts.googleapis.com/css?family=Raleway:400,700);
        body {
            background: #7f9b4e url(images/bg2.jpg) no-repeat center top;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
        }
        .container > header h1,
        .container > header h2 {
            color: #fff;
            text-shadow: 0 1px 1px rgba(0,0,0,0.7);
        }
    </style>
</head>
<body>
<div class="container">

    <!-- Codrops top bar -->
    <div class="codrops-top">
        <a href="http://tympanus.net/Tutorials/RealtimeGeolocationNode/">
            <strong>&laquo; Previous Demo: </strong>Real-Time Geolocation Service with Node.js
        </a>
        <span class="right">
                	<a href="http://www.flickr.com/photos/12943476@N04/4017721337/in/photostream">Background by Robert Hamilton</a>
                    <a href="http://tympanus.net/codrops/?p=11372">
                        <strong>Back to the Codrops Article</strong>
                    </a>
                </span>
    </div><!--/ Codrops top bar -->

    <header>

        <h1>与世无争 <strong>随俗浮沉</strong> 知足常乐</h1>
        <h1>青春总需要一些疼痛让我们刻骨铭心，总需要一些伤疤证明我们曾经年少过。</h1>
        <div class="support-note">
            <span class="note-ie">Sorry, only modern browsers.</span>
        </div>

    </header>

    <section class="main">
        <form id="loginForm" class="form-4">
            <h1>享笑网内部管理系统</h1>
            <p>
                <label for="login">Username or email</label>
                <input type="text" name="uname" placeholder="请输入用户名" required id="exampleInputEmail1s" onblur="uname()">
            </p>
            <p>
                <label for="password">Password</label>
                <input type="password" name='upass' placeholder="请输入密码" required id="exampleInputPassword1" onblur="upass()">
            </p>

            <p>

                <button type="button" class="btn btn-success" onClick="logins()" style="width:280px">L&nbspo&nbspg&nbspi&nbspn</button>
            </p>
        </form>​
    </section>

</div>
<script type="text/javascript">
    function uname(){
        if($("#exampleInputEmail1s").val()==""){
            alert("用户名不能为空");
        }
    }
    function upass(){

        if($("#exampleInputPassword1").val()==""){
            alert("密码不能为空");
        }
    }
    function logins(){
        alert("1")
        $.ajax({
            url:"<%=request.getContextPath()%>/login",
            type:"post",
            data:$("#loginForm").serialize(),
            dataType:"text",
            success:function(loginFlag){
                if(loginFlag=="nameno"){
                    alert("用户名不存在","赶紧去看");
                }else if(loginFlag=="passno"){
                    alert("密码错误");
                }else if(loginFlag=="yes"){
                    alert("登录成功");
                    location.href="toIndex"
                }
            }
        })
    }
</script>
</body>
</html>
