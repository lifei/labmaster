<head>
	<meta name="layout" content="main" />
	<title>修改密码</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">Member List</g:link></span>
	</div>

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
		<g:form action="updatePasswd">
			<div class="dialog">
				<table>
				<tbody>
<%-- {{{ UserName --%>
<tr class="prop">
        <td valign="top" class="name"><label for="username">Login Name:</label></td>
        <td valign="top" class="value ${hasErrors(bean:person,field:'username','errors')}">
                ${person.username?.encodeAsHTML()}
        </td>
</tr><%-- }}} --%>
<%-- {{{FullName --%>
<tr class="prop">
    <td valign="top" class="name"><label for="userRealName">Full Name:</label></td>
    <td valign="top" class="value ${hasErrors(bean:person,field:'userRealName','errors')}">
        ${person.userRealName?.encodeAsHTML()}
    </td>
</tr><%-- }}} --%>
<%-- {{{Old Password --%>
<tr class="prop">
    <td valign="top" class="name"><label for="oldPassword">Old Password:</label></td>
    <td valign="top" class="value ${hasErrors(bean:cmd,field:'oldPassword','errors')}">
        <input type="password" id="oldPassword" name="oldPassword" value=""/>
    </td>
</tr><%-- }}} --%>
<%-- {{{New Password --%>
<tr class="prop">
    <td valign="top" class="name"><label for="passwd">New Password:</label></td>
    <td valign="top" class="value ${hasErrors(bean:cmd,field:'passwd','errors')}">
        <input type="password" id="passwd" name="passwd" value=""/>
    </td>
</tr><%-- }}} --%>
<%-- {{{Confirm Password --%>
<tr class="prop">
    <td valign="top" class="name"><label for="passwordAgain">Confirm Password:</label></td>
    <td valign="top" class="value ${hasErrors(bean:cmd,field:'passwordAgain','errors')}">
        <input type="password" id="passwordAgain" name="passwordAgain" value=""/>
    </td>
</tr><%-- }}} --%>
            <tr class='prop'>
            <%-- {{{Captcha --%>
                <td valign='bottom' class='name'><label for='code'>Enter Code: </label></td>
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
				<span class="button"><input class="save" type="submit"
                value="Update" /></span>
			</div>

		</g:form>

	</div>
</body>
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp 
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>
