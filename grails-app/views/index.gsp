<html>
    <head>
        <title>刘双喜教授课题组图书管理系统</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

            #nav {
                margin-top:20px;
                margin-left:30px;
                width:228px;
                float:left;

            }
            .homePagePanel * {
                margin:0px;
            }
            .homePagePanel .panelBody ul {
                list-style-type:none;
                margin-bottom:10px;
            }
            .homePagePanel .panelBody h1 {
                text-transform:uppercase;
                font-size:1.1em;
                margin-bottom:10px;
            }
            .homePagePanel .panelBody {
                background: url(images/leftnav_midstretch.png) repeat-y top;
                margin:0px;
                padding:15px;
            }
            .homePagePanel .panelBtm {
                background: url(images/leftnav_btm.png) no-repeat top;
                height:20px;
                margin:0px;
            }

            .homePagePanel .panelTop {
                background: url(images/leftnav_top.png) no-repeat top;
                height:11px;
                margin:0px;
            }
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
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop">

                </div>
                <div class="panelBody">
                    <h1>系统信息</h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>可用组件</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>
                <div class="panelBtm">
                </div>
            </div>


        </div>
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
