<html>
    <head>
        <title>刘双喜教授课题组图书管理系统</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

            h2 {
                margin-top:15px;
                margin-bottom:15px;
                font-size:1.2em;
            }
            #pageBody {
                margin-left:280px;
                margin-right:20px;
            }
        </style>
    </head>
    <body>
        <div id="pageBody">
            <h1>欢迎来到图书管理系统</h1>
            <div id="controllerList" class="dialog">
                <h2>操作:</h2>
                <li><g:link controller="book" action="create">创建新的书籍 <b
                style="color:rgb(255,0,0)">(需要图书管理员权限)</b></g:link> </li>
                <li><g:link controller="book">查看所有图书</g:link> </li>
                <li><g:link controller="logout">退出登录</g:link> </li>
                <li><g:link controller="member">成员管理<b
                style="color:rgb(255,0,0);">(需要管理员权限)</b></g:link> </li>
            </div>

        </div>
    </body>
</html>
