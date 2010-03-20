<head>
	<meta name="layout" content="main" />
	<title>修改密码</title>
</head>

<body>

    <g:render template="top" />

	<div class="body">
		<h1>修改密码</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors model="${[person:person,cmd:cmd]}">
		<div class="errors">
			<g:renderErrors model="${[person:person,cmd:cmd]}" as="list" />
		</div>
		</g:hasErrors>
		<g:form action="index">
			<div class="dialog">
				<table>
				<tbody>
<%-- {{{ UserName --%>
<tr class="prop">
        <td valign="top" class="name"><label for="username">您的用户名:</label></td>
        <td valign="top" class="value ${hasErrors(bean:person,field:'username','errors')}">
                ${person.username?.encodeAsHTML()}
        </td>
</tr><%-- }}} --%>
<%-- {{{FullName --%>
<tr class="prop">
    <td valign="top" class="name"><label for="userRealName">您的名字:</label></td>
    <td valign="top" class="value ${hasErrors(bean:person,field:'userRealName','errors')}">
        ${person.userRealName?.encodeAsHTML()}
    </td>
</tr><%-- }}} --%>
<%-- {{{Old Password --%>
<tr class="prop">
    <td valign="top" class="name"><label for="oldPassword">旧的密码:</label></td>
    <td valign="top" class="value ${hasErrors(bean:cmd,field:'oldPassword','errors')}">
        <input type="password" id="oldPassword" name="oldPassword" value=""/>
    </td>
</tr><%-- }}} --%>
<%-- {{{New Password --%>
<tr class="prop">
    <td valign="top" class="name"><label for="passwd">新的密码:</label></td>
    <td valign="top" class="value ${hasErrors(bean:cmd,field:'passwd','errors')}">
        <input type="password" id="passwd" name="passwd" value=""/>
    </td>
</tr><%-- }}} --%>
<%-- {{{Confirm Password --%>
<tr class="prop">
    <td valign="top" class="name"><label for="passwordAgain">新密码确认:</label></td>
    <td valign="top" class="value ${hasErrors(bean:cmd,field:'passwordAgain','errors')}">
        <input type="password" id="passwordAgain" name="passwordAgain" value=""/>
    </td>
</tr><%-- }}} --%>
            <tr class='prop'>
            <%-- {{{Captcha --%>
                <td valign='bottom' class='name'><label for='code'>验证码: </label></td>
                <td valign="top" class="value ${hasErrors(bean:cmd,field:'passwordAgain','errors')}">
                    <input type="text" name="captcha" size="8"/>
                    <img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
                </td>
            </tr><%-- }}} --%>

				</tbody>
				</table>
			</div>

			<div class="buttons">
            <g:hiddenField name='id' value="${person.id}" />
				<span class="button">
                    <input class="save" type="submit" name="_action_updatePasswd"
                value="修改" /></span>
                <span class="button"><input type="submit" name="_action_show"
                class="show" value="放弃" /></span>
			</div>

		</g:form>

	</div>
</body>
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp 
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>
