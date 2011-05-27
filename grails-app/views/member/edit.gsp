<head>
	<meta name="layout" content="main" />
	<title>Edit Member</title>
</head>

<body>

    <g:render template="top" />

	<div class="body">
		<h1>Edit Member</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>

		<div class="prop">
			<span class="name">ID:</span>
			<span class="value">${person.id}</span>
		</div>

		<g:form><%-- {{{ --%>
			<input type="hidden" name="id" value="${person.id}" />
			<input type="hidden" name="version" value="${person.version}" />
			<div class="dialog"><%-- {{{ --%>
				<table>
				<tbody>

<tr class="prop"><%-- {{{ UserName --%>
    <td valign="top" class="name"><label for="username">Login Name:</label></td>
    <td valign="top" class="value ${hasErrors(bean:person,field:'username','errors')}">
        ${person.username?.encodeAsHTML()}
    </td>
</tr><%-- }}} --%>

<tr class="prop"><%-- {{{FullName --%>
    <td valign="top" class="name"><label for="userRealName">Full Name:</label></td>
    <td valign="top" class="value ${hasErrors(bean:person,field:'userRealName','errors')}">
        <input type="text" id="userRealName" name="userRealName" value="${person.userRealName?.encodeAsHTML()}"/>
    </td>
</tr><%-- }}} --%>

<%-- {{{Enabled --%>
<g:ifAnyGranted role='ROLE_ADMIN'>
<tr class="prop">
    <td valign="top" class="name"><label for="enabled">Enabled:</label></td>
    <td valign="top" class="value ${hasErrors(bean:person,field:'enabled','errors')}">
        <g:checkBox name="enabled" value="${person.enabled}"/>
    </td>
</tr>
</g:ifAnyGranted>
<%-- }}} --%>

					<tr class="prop"><%-- {{{ --%>
						<td valign="top" class="name"><label for="description">Description:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'description','errors')}">
							<input type="text" id="description" name="description" value="${person.description?.encodeAsHTML()}"/>
						</td>
					</tr><%-- }}} --%>

					<tr class="prop"><%-- {{{ --%>
						<td valign="top" class="name"><label for="email">Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
							<input type="text" id="email" name="email" value="${person?.email?.encodeAsHTML()}"/>
						</td>
					</tr><%-- }}} --%>

					<tr class="prop"><%-- {{{ --%>
						<td valign="top" class="name"><label for="emailShow">Show Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'emailShow','errors')}">
							<g:checkBox name="emailShow" value="${person.emailShow}"/>
						</td>
					</tr><%-- }}} --%>

<tr class="prop"><%-- {{{ --%>
        <td valign="top" class="name"><label for="authorities">Roles:</label></td>
        <g:ifAnyGranted role='ROLE_ADMIN'>
        <td valign="top" class="value ${hasErrors(bean:person,field:'authorities','errors')}">
                <ul>
                <g:each var="entry" in="${roleMap}">
                        <li>
                        <g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
                        ${entry.key.description.encodeAsHTML()}
                        </li>
                </g:each>
                </ul>
        </td>
        </g:ifAnyGranted>
        <g:ifNotGranted role='ROLE_ADMIN'>
        <td valign="top" class="value">
            <ul>
            <g:each in="${person?.authorities}" var='entry'>
                <li>
                    ${entry.description.encodeAsHTML()}
                </li>
            </g:each>
            </ul>
        </td>
        </g:ifNotGranted>
</tr><%-- }}} --%>

				</tbody>
				</table>
			</div><%-- }}} --%>
			<div class="buttons"><%-- {{{ --%>
				<span class="button"><g:actionSubmit class="save" value="Update" /></span>
                <g:ifAnyGranted role="ROLE_ADMIN">
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:ifAnyGranted>
			</div><%-- }}} --%>
		</g:form><%-- }}} --%>

	</div>
</body>

<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp 
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
