<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/10
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%--
 Created by IntelliJ IDEA.
 User: Administrator
 Date: 2019/3/29
 Time: 15:21
 To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@include file="../Background/info.jsp"%>
<html>
<head>
    <title>Title</title>

</head>
<body>
<div class="layui-container" style="padding: 20px">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="hidden" name="reportId" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">书名：</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格：</label>
            <div class="layui-input-inline">
                <input  name="price" lay-verify="required" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">日期：</label>
            <div class="layui-input-inline">
                <input type="text" name="publishDate" lay-verify="required" id="test1"  autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitSave">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script>
    //Demo
    layui.use(['laydate','form'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        //监听提交
        form.on('submit(submitSave)', function(data){
            layer.msg(JSON.stringify(data.field));
            var bId = data.field.bId;
            var name = data.field.name;
            var price = data.field.price;
            var publishDate = data.field.publishDate;

            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/BookServlet",
                data:{
                    "action": "add",
                    "bId": bId,
                    "name": name,
                    "price": price,
                    "publishDate": publishDate,

                },
                success:function(msgdata){
                    layer.msg("添加成功",{icon:1,time:2000});
                    setTimeout("location.reload()",3000)
                }
            })
            return false;
        });
        laydate.render({
            elem: '#test1', //指定元素
            type:'datetime'
        });
    });
</script>
</body>
</html>



