<%@ page import="labmaster.paper.Paper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paper.label', default: 'Paper')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript" src="/js/swfupload/swfupload.js"></script>
        <script type="text/javascript" src="/js/swfupload/swfupload.swfobject.js"></script>
        <script type="text/javascript" src="/js/swfupload/fileprogress.js"></script>
        <script type="text/javascript" src="/js/swfupload/handlers.js"></script>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${paperInstance}">
            <div class="errors">
                <g:renderErrors bean="${paperInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abstruct"><g:message code="paper.abstruct.label" default="Abstruct" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'abstruct', 'errors')}">
                                    <g:textField name="abstruct" value="${paperInstance?.abstruct}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accessionNumber"><g:message code="paper.accessionNumber.label" default="Accession Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'accessionNumber', 'errors')}">
                                    <g:textField name="accessionNumber" value="${paperInstance?.accessionNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author"><g:message code="paper.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'author', 'errors')}">
                                    <g:textField name="author" value="${paperInstance?.author}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authorAddress"><g:message code="paper.authorAddress.label" default="Author Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'authorAddress', 'errors')}">
                                    <g:textField name="authorAddress" value="${paperInstance?.authorAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caption"><g:message code="paper.caption.label" default="Caption" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'caption', 'errors')}">
                                    <g:textField name="caption" value="${paperInstance?.caption}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="doi"><g:message code="paper.doi.label" default="Doi" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'doi', 'errors')}">
                                    <g:textField name="doi" value="${paperInstance?.doi}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="figure"><g:message code="paper.figure.label" default="Figure" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'figure', 'errors')}">
                                    <g:textField name="figure" value="${paperInstance?.figure}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="filename"><g:message code="paper.filename.label" default="Filename" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'filename', 'errors')}">
                                    <g:textField name="filename" value="${paperInstance?.filename}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="issn"><g:message code="paper.issn.label" default="Issn" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'issn', 'errors')}">
                                    <g:textField name="issn" value="${paperInstance?.issn}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="issue"><g:message code="paper.issue.label" default="Issue" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'issue', 'errors')}">
                                    <g:textField name="issue" value="${paperInstance?.issue}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="journal"><g:message code="paper.journal.label" default="Journal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'journal', 'errors')}">
                                    <g:textField name="journal" value="${paperInstance?.journal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="keywords"><g:message code="paper.keywords.label" default="Keywords" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'keywords', 'errors')}">
                                    <g:textField name="keywords" value="${paperInstance?.keywords}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="label"><g:message code="paper.label.label" default="Label" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'label', 'errors')}">
                                    <g:textField name="label" value="${paperInstance?.label}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes"><g:message code="paper.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'notes', 'errors')}">
                                    <g:textField name="notes" value="${paperInstance?.notes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="page"><g:message code="paper.page.label" default="Page" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'page', 'errors')}">
                                    <g:textField name="page" value="${paperInstance?.page}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pages"><g:message code="paper.pages.label" default="Pages" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'pages', 'errors')}">
                                    <g:textField name="pages" value="${paperInstance?.pages}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pubDate"><g:message code="paper.pubDate.label" default="Pub Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'pubDate', 'errors')}">
                                    <g:datePicker name="pubDate" precision="day" value="${paperInstance?.pubDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="researchNotes"><g:message code="paper.researchNotes.label" default="Research Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'researchNotes', 'errors')}">
                                    <g:textField name="researchNotes" value="${paperInstance?.researchNotes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startPage"><g:message code="paper.startPage.label" default="Start Page" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'startPage', 'errors')}">
                                    <g:textField name="startPage" value="${paperInstance?.startPage}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="paper.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${paperInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="translatedAuthor"><g:message code="paper.translatedAuthor.label" default="Translated Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'translatedAuthor', 'errors')}">
                                    <g:textField name="translatedAuthor" value="${paperInstance?.translatedAuthor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="translatedTitle"><g:message code="paper.translatedTitle.label" default="Translated Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'translatedTitle', 'errors')}">
                                    <g:textField name="translatedTitle" value="${paperInstance?.translatedTitle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="paper.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${paperInstance?.url}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="volume"><g:message code="paper.volume.label" default="Volume" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'volume', 'errors')}">
                                    <g:textField name="volume" value="${paperInstance?.volume}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="paper.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${fieldValue(bean: paperInstance, field: 'year')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
