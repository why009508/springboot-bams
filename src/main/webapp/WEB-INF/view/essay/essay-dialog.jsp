<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/24/024
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/my97/WdatePicker.js"></script>
</head>
<body>
    <form id="EssayForm">
        <%--隐藏id--%>
        <input type="hidden"   name="esid"  value="${essay.esid}">

        <div class="form-group">
            <label for=estitle>标题</label>
            <input type="text" class="form-control" value="${essay.estitle}"  name="estitle"  id="estitle" placeholder="标题">
        </div>
         <div class="form-group">
                <label for=estitle>作者</label>
                <input type="hidden" value="${essay.esuid}" name="esuid"  id="esuid" >
                <input type="text" class="form-control" value="${essay.fullname}"  name="fullname"  id="fullname" placeholder="作者" readonly>
         </div>
        <div class="form-group">
            <label for=escontent>内容简介</label>
            &lt;%&ndash;说明：textarea，要回显内容时，需要放到开始结束标签中间，value的值是不予以展示的&ndash;%&gt;
            <textarea class="form-control" value="${essay.escontent}"  name="escontent"  id="escontent" placeholder="内容" cols="30" rows="10">
                ${essay.escontent}
            </textarea>
        </div>
       <%--<div class="form-group">
            &lt;%&ndash;图片的回显与修改 如何修改存疑问&ndash;%&gt;
            <label for="escontent">书籍图片</label>
            <img  class='img-responsive img-circle'   width='100' heigth='100' src='<%=request.getContextPath()%>/${essay.esimg  }'/>
            <input class="form-control" id="hero_Img" name="esimg"  type="file" />


        </div>--%>
       <div>
            <label for=estitle>所属话题</label>
            <input type="hidden" value="${essay.pid}" name="pid"  id="pid">
            <input type="text" class="form-control" value="${essay.pictitle}"    id="pictitle" placeholder="话题">
        </div>


       <%--<div class="form-grou">
            <label for=estitle>文章状态</label>

            <input type="text" class="form-control" value="${essay.statue eq 1?'已审核':'未审核'}"  name="statue"  id="statue" placeholder="状态">
        </div>--%>

        <%-- my97的时间展示， bootStrap的时间样式自己不会
        <div class="form-group">
            <label for="estime">创建时间</label>
            <input  class="Wdate" name="estime" type="text" name="estime" value="${essay.estime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">

        </div>--%>

    </form>

    <script type="text/javascript">


    </script>
</body>
</html>
