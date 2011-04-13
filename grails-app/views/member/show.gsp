<head>
	<meta name="layout" content="main" />
	<title>Show Member</title>
</head>

<body>

    <g:render template="top" />

	<div class="body">
		<h1>Show Member</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<tbody>

				<tr class="prop">
					<td valign="top" class="name">ID:</td>
					<td valign="top" class="value">${person.id}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Login Name:</td>
					<td valign="top" class="value">${person.username?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Full Name:</td>
					<td valign="top" class="value">${person.userRealName?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Enabled:</td>
					<td valign="top" class="value">${person.enabled}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Description:</td>
					<td valign="top" class="value">${person.description?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Email:</td>
					<td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Show Email:</td>
					<td valign="top" class="value">${person.emailShow}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Roles:</td>
					<td valign="top" class="value">
						<ul>
						<g:each in="${roleNames}" var='name'>
							<li>${name}</li>
						</g:each>
						</ul>
					</td>
				</tr>

			</tbody>
			</table>
		</div>

<div class="buttons"><%-- {{{ --%>
        <g:form>
                <input type="hidden" name="id" value="${person.id}" />
                <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                <g:ifAnyGranted role='ROLE_ADMIN'>
                <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:ifAnyGranted>
                <g:if test="${params.int('id')==user.id}">
                <span class="button"><input type='submit' name='_action_password'
                class="edit" value="修改密码" /></span>
                </g:if>
        </g:form>
</div><%-- }}} --%>

	</div>
</body>
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp 
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>
