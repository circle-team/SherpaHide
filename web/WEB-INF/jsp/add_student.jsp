<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加新学生</title>
        <base href="${pageContext.request.contextPath}/">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <div class="container text-center">
            <br>
            <h2 class="text-success bg-success padding10">添加新学生</h2>
            <hr>
            <br>
            <form action="students/add_student" class="form-inline" method="post">
                <span>学号：</span><input type="text" name="srollno" class="form-control" placeholder="在此输入学号">
                <br><br>
                <span>姓名：</span><input type="text" name="sname" class="form-control" placeholder="在此输入姓名">
                <br><br>
                <span>密码：</span><input type="text" name="spassword" class="form-control" placeholder="在此输入密码">
                <br><br>
                <span>性别：</span>
                <select name="sgender" class="form-control fixedWidth">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <br><br>
                <span>班级：</span>
                <select name="sbatch" class="form-control fixedWidth">
                    <option >请选择班级</option>
                    <option value="17软件J04">17软件J04</option>
                    <option value="17软件J06">17软件J06</option>
                </select>  
                <br><br>
                <input type="submit" value="添 加" class="btn btn-sm btn-primary">
            </form>
            <br>
            <a href="index">返回首页</a>
        </div>
    </body>
</html>
