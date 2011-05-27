<%@ page import="labmaster.paper.Paper"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'paper.label', default: 'Paper')}" />
<title><g:message code="default.edit.label" args="[entityName]" />
</title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" />
		</a>
		</span> <span class="menuButton"><g:link class="list" action="list">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link>
		</span> <span class="menuButton"><g:link class="create"
				action="create">
				<g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</span>
	</div>
	<div class="body">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${cmd}">
			<div class="errors">
				<g:renderErrors bean="${cmd}" as="list" />
			</div>
		</g:hasErrors>
		<g:form method="post">
			<g:hiddenField name="id" value="${paperInstance?.id}" />
			<g:hiddenField name="version" value="${paperInstance?.version}" />
			<div class="dialog">
				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><label for="title"><g:message
										code="paper.title.label" default="Title" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'title', 'errors')}">
								<g:textField name="title" value="${paperInstance?.title}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="keywords"><g:message
										code="paper.keywords.label" default="Keywords" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'keywords', 'errors')}">
								<g:textField name="keywords" value="${paperInstance?.keywords}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="abstruct">
									<g:message code="paper.abstruct.label" default="Abstruct" /> (<g:message
										code="paper.abstruct.help.label" default="Abstruct" />) </label></td>
							<td valign="top"
								class="value ${
        hasErrors(bean: cmd, field: 'abstruct', 'errors')}">
								<g:textArea name="abstruct" value="${paperInstance?.abstruct}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="journal"><g:message
										code="paper.journal.label" default="Journal" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'journal', 'errors')}">
								<g:textField name="journal" value="${paperInstance?.journal}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="year"><g:message
										code="paper.year.label" default="Year" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'year', 'errors')}">
								<g:textField name="year"
									value="${fieldValue(bean: paperInstance, field: 'year')}" /></td>
						</tr>
						
						<tr class="prop">
							<td valign="top" class="name"><label for="volume"><g:message
										code="paper.volume.label" default="Volume" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'volume', 'errors')}">
								<g:textField name="volume" value="${paperInstance?.volume}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="author"> <g:message
										code="paper.author.label" default="Author" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'author', 'errors')}">
								<g:textField name="author" value="${paperInstance?.author}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="affiliation"><g:message
										code="paper.affiliation.label" default="Author Address" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'affiliation', 'errors')}">
								<g:textField name="affiliation"
									value="${paperInstance?.affiliation}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="doi"><g:message
										code="paper.doi.label" default="Doi" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'doi', 'errors')}">
								<g:textField name="doi" value="${paperInstance?.doi}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="filename"><g:message
										code="paper.filename.label" default="Filename" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'filename', 'errors')}">
								<g:textField name="filename" value="${paperInstance?.filename}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="issn"><g:message
										code="paper.issn.label" default="Issn" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'issn', 'errors')}">
								<g:textField name="issn" value="${paperInstance?.issn}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="issue"><g:message
										code="paper.issue.label" default="Issue" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'issue', 'errors')}">
								<g:textField name="issue" value="${paperInstance?.issue}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="label"><g:message
										code="paper.label.label" default="Label" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'label', 'errors')}">
								<g:textField name="label" value="${paperInstance?.label}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="notes"><g:message
										code="paper.notes.label" default="Notes" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'notes', 'errors')}">
								<g:textField name="notes" value="${paperInstance?.notes}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="pages"><g:message
										code="paper.pages.label" default="Pages" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'pages', 'errors')}">
								<g:textField name="pages" value="${paperInstance?.pages}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="url"><g:message
										code="paper.url.label" default="Url" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: cmd, field: 'url', 'errors')}">
								<g:textField name="url" value="${paperInstance?.url}" /></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:actionSubmit class="save"
						action="addinfopost"
						value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</span> <span class="button"><g:actionSubmit class="delete"
						action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</span>
			</div>
		</g:form>
	</div>
</body>
</html>
