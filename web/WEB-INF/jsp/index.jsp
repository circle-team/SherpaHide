<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>集成SpringMVC+Spring+Hibernate</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="${pageContext.request.contextPath}/">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <div class="container text-center">

            <h1 class="text-center text-primary padding10">集成SpringMVC+Spring+Hibernate</h1>
            <hr>
            <br>

            <form action="students/findStudents" class="form-inline">
                <select name="batchName" class="form-control">
                    <option >请选择班级</option>
                    <option value="all">所有班级学生</option>
                    <option value="17软件J04">17软件J04</option>
                    <option value="17软件J06">17软件J06</option>
                </select>  
                &nbsp;
                <button class="btn btn-sm btn-primary">查询</button>
            </form>

        </div>

    </body>
</html>