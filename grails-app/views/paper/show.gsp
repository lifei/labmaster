
<%@ page import="labmaster.paper.Paper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paper.label', default: 'Paper')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <g:javascript library="flexpaper/flexpaper_flash_debug" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <div>
                <a id="viewerPlaceHolder" style="width:660px;height:480px;display:block"></a>
                <script>
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
                    </script>
                </div>
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.abstruct.label" default="Abstruct" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "abstruct")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.accessionNumber.label" default="Accession Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "accessionNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.author.label" default="Author" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "author")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.authorAddress.label" default="Author Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "authorAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.caption.label" default="Caption" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "caption")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.doi.label" default="Doi" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "doi")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.figure.label" default="Figure" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "figure")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.filename.label" default="Filename" /></td>
                            
                            <td valign="top" class="value">
                            <g:link action="download" id="$paperInstance.id">${fieldValue(bean: paperInstance, field: "filename")}
                            </g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.issn.label" default="Issn" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "issn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.issue.label" default="Issue" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "issue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.journal.label" default="Journal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "journal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.keywords.label" default="Keywords" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "keywords")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.label.label" default="Label" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "label")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.notes.label" default="Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "notes")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.page.label" default="Page" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "page")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.pages.label" default="Pages" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "pages")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.pubDate.label" default="Pub Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${paperInstance?.pubDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.researchNotes.label" default="Research Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "researchNotes")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.startPage.label" default="Start Page" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "startPage")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.translatedAuthor.label" default="Translated Author" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "translatedAuthor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.translatedTitle.label" default="Translated Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "translatedTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.url.label" default="Url" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "url")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.volume.label" default="Volume" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "volume")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paper.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: paperInstance, field: "year")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${paperInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
