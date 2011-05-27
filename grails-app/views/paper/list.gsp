
<%@ page import="labmaster.paper.Paper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paper.label', default: 'Paper')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'paper.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="abstruct" title="${message(code: 'paper.abstruct.label', default: 'Abstruct')}" />
                        
                            <g:sortableColumn property="accessionNumber" title="${message(code: 'paper.accessionNumber.label', default: 'Accession Number')}" />
                        
                            <g:sortableColumn property="author" title="${message(code: 'paper.author.label', default: 'Author')}" />
                        
                            <g:sortableColumn property="authorAddress" title="${message(code: 'paper.authorAddress.label', default: 'Author Address')}" />
                        
                            <g:sortableColumn property="caption" title="${message(code: 'paper.caption.label', default: 'Caption')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paperInstanceList}" status="i" var="paperInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paperInstance.id}">${fieldValue(bean: paperInstance, field: "title")}</g:link></td>
                        
                            <td>${fieldValue(bean: paperInstance, field: "abstruct")}</td>
                        
                            <td>${fieldValue(bean: paperInstance, field: "keywords")}</td>
                        
                            <td>${fieldValue(bean: paperInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: paperInstance, field: "notes")}</td>
                        
                            <td>${fieldValue(bean: paperInstance, field: "url")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paperInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
