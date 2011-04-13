<head>
<meta name='layout' content='main' />
<title>Login 呵呵</title>
<style type='text/css' media='screen'><%-- {{{ --%>
#login {
    margin:15px 0px; padding:0px;
    text-align:center;
}
#login .inner {
    width:260px;
    margin:0px auto;
    text-align:left;
    padding:10px;
    border-top:1px dashed #499ede;
    border-bottom:1px dashed #499ede;
    background-color:#EEF;
}
#login .inner .fheader {
    padding:4px;margin:3px 0px 3px 0;color:#2e3741;font-size:14px;font-weight:bold;
}
#login .inner .cssform p {
    clear: left;
    margin: 0;
    padding: 5px 0 8px 0;
    padding-left: 105px;
    border-top: 1px dashed gray;
    margin-bottom: 10px;
    height: 1%;
}
#login .inner .cssform input[type='text'] {
    width: 120px;
}
#login .inner .cssform label {
    font-weight: bold;
    float: left;
    margin-left: -105px;
    width: 100px;
}
#login .inner .login_message {color:red;}
#login .inner .text_ {width:120px;}
#login .inner .chk {height:12px;}

.errors {border:1px solid red;}
</style><%-- }}} --%>
</head>

<body>
    <div id='login'>
        <div class='inner'>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors model="${[cmd:cmd]}">
		<div class="errors">
			<g:renderErrors model="${[cmd:cmd]}" as="list" />
		</div>
		</g:hasErrors>
            <div class='fheader'>Please Login..</div>
            <form action='${postUrl}' method='POST' id='loginForm' class='cssform'>
                <p>
                    <label for='j_username'>Login ID</label>
                    <input type='text' name='j_username' id='j_username'
                    value='${cmd?cmd.username:''}'
                    class='text_ ${hasErrors(bean:cmd,field:'username','errors')}'   
                    />
                </p>
                <p>
                    <label for='j_password'>Password</label>
                    <input type='password' name='j_password' id='j_password'
                    class='text_ ${hasErrors(bean:cmd,field:'password','errors')}'   
                    />
                </p>
                <p>
                    <label for='captcha'>Enter Code</label>
                    <input type='text' size='8' style='width:60px;' name='captcha' id='captcha' value=''
                    class='${hasErrors(bean:cmd,field:'captcha','errors')}'   
                        />
                    <img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
                </p>
                <p>
                    <label for='remember_me'>Remember me</label>
                    <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
                    <g:if test='${hasCookie}'>checked='checked'</g:if> />
                </p>
                <p>
                    <input type='submit' value='Login' />
                    <br />
                    <g:link controller="register">没有帐号？点此注册</g:link>
                </p>
                <p>
                </p>
            </form>
        </div>
    </div>
<script type='text/javascript'>
<!--
(function(){
    document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp 
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>
