
<head>
    <meta name="layout" content="main" />
    <title>Registration Success</title>
</head>

<body>

    <div class="nav">
        <span class="menuButton"><a class='home' href="${createLinkTo(dir:'')}">Home</a></span>
    </div>

    <div class="body">
        <h1>Registration Success</h1>
       <div class="dialog">
您已经成功地注册了账号:<br />
<br />
 ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}<br />
<br />
 下面是您的账号的信息:<br />
 -------------------------------------<br />
 用户名: ${person.username}<br />
 电子信息: ${person.email}<br />
 姓名: ${person.userRealName}<br />
 <h1 style='color:red;'>请注意，您的账号默认是未激活的，请联系管理员激活账号！</h1>
        </div>
    </div>
</body>
