<%@page import="org.grails.rateable.Rateable"%>
<%@page import="labmaster.paper.Paper" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'paper.label', default: 'Paper')}" />
<title><g:message code="default.show.label" args="[entityName]" />
</title>
<g:javascript library="flexpaper/flexpaper_flash" />
<rateable:resources />
<gui:resources components="richEditor" />
<style>
* {
	line-height: 18px;
}
</style>
</head>
<body class="yui-skin-sam">
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
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<table>
			<tr>
				<td colspan="2" align="center">
					<h1>
						${paperInstance?.title }
					</h1>
					<p>
						${paperInstance?.author }
					</p>
					<p>
						Keywords: <span> ${paperInstance?.keywords } </span>
					</p>
					<p>
						Abstract: <span> ${paperInstance?.abstruct.encodeAsHTML() } </span>
					</p>
				</td>
			</tr>
			<tr>
				<td style="width: 700px;"><a id="viewerPlaceHolder"
					style="width: 100%; height: 600px; display: block"></a> <script>
                var fp = new FlexPaperViewer(   
                         '${resource(dir:'swf',file:'flexpaper/viewer')}',
                         'viewerPlaceHolder',
                         { 
                             config : {
                             SwfFile : '${createLink(action:'getswf', id:paperInstance.id)}',
                                       //'${resource(dir:'swf',file:'main.swf')}',
                             Scale : 1, 
                             ZoomTransition : 'easeOut',
                             ZoomTime : 0.5,
                             ZoomInterval : 0.2,
                             FitPageOnLoad : false,
                             FitWidthOnLoad : true,
                             PrintEnabled : true,
                             FullScreenAsMaxWindow : false,
                             ProgressiveLoading : false,
                             MinZoomSize : 0.2,
                             MaxZoomSize : 5,
                             SearchMatchAll : false,
                             InitViewMode : 'Portrait',
                             
                             ViewModeToolsVisible : true,
                             ZoomToolsVisible : true,
                             NavToolsVisible : true,
                             CursorToolsVisible : true,
                             SearchToolsVisible : true,
                            
                             localeChain: 'zh_CN'
                         }});
                    </script></td>
				<td>
				<div class="dialog">
					<table>
						<tbody>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.journal.label" default="Journal" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "journal")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.doi.label" default="Doi" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "doi")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.filename.label" default="Filename" /></td>

								<td valign="top" class="value"><g:link action="download"
										id="$paperInstance.id">
										${fieldValue(bean: paperInstance, field: "filename")}
									</g:link></td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.issn.label" default="Issn" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "issn")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.issue.label" default="Issue" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "issue")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.label.label" default="Label" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "label")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.notes.label" default="Notes" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "notes")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.pages.label" default="Pages" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "pages")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.url.label" default="Url" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "url")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.volume.label" default="Volume" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "volume")}
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name"><g:message
										code="paper.year.label" default="Year" /></td>

								<td valign="top" class="value">
									${fieldValue(bean: paperInstance, field: "year")}
								</td>

							</tr>

						</tbody>
					</table>
					</div>
					<div class="buttons">
						<g:form>
							<g:hiddenField name="id" value="${paperInstance?.id}" />
							<span class="button"><g:actionSubmit class="edit"
									action="edit"
									value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
							</span>
							<span class="button"><g:actionSubmit class="delete"
									action="delete"
									value="${message(code: 'default.button.delete.label', default: 'Delete')}"
									onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</span>
						</g:form>
					</div>
					
					<rateable:ratings bean='${paperInstance}' />
				</td>
			</tr>
			<tr><td colspan="2">
				<comments:render bean="${paperInstance}" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
