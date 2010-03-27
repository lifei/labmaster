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
            <div class="dialog">
                <h2>会员:${loggedInUserInfo(field:'username')}</h2>
                <g:ifAnyGranted role="ROLE_ADMIN">
                <li><g:link controller="member" action="list">成员管理<b 
                style="color:rgb(255,0,0)">(需要管理员权限)</b></g:link> </li>
                </g:ifAnyGranted>
                <li><g:link controller="member" action="show" 
                    id="${loggedInUserInfo(field:'id')}">个人中心</g:link> </li>
                <li><g:link controller="logout">退出登录</g:link> </li>
            </div>
            <div class="dialog">
                <h2>图书:</h2>
                <g:ifAnyGranted role='ROLE_BOOKADMIN'>
                <li><g:link controller="book" action="create">创建新的书籍 <b
                style="color:rgb(255,0,0)">(需要图书管理员权限)</b></g:link> </li>
                </g:ifAnyGranted>
                <li><g:link controller="book">查看所有图书</g:link> </li>
            </div>
            <div class="dialog">
                <h2>任务:</h2>
                <li><g:link controller="project" action="create">创建课题</g:link> </li>
                <li><g:link controller="project"                >查看课题</g:link> </li>
                <li><g:link controller="plan" action="create">创建计划</g:link> </li>
                <li><g:link controller="plan">查看计划</g:link> </li>
                <li><g:link controller="work" action="create">工作记录</g:link> </li>
                <li><g:link controller="work">查看工作</g:link> </li>
                <li><g:link controller="task" action="create">指派任务</g:link> </li>
                <li><g:link controller="task">查看任务</g:link> </li>
            </div>
        </div>
    </body>
</html>
