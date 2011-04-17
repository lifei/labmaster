
<%@ page import="labmaster.book.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="top" />
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'book.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'book.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
                        
                            <g:sortableColumn property="press" title="${message(code: 'book.press.label', default: 'Press')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'book.type.label', default: 'Type')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'book.status.label', default: 'Status')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bookInstanceList}" status="i" var="bookInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "press")}</td>
                        
                            <td>${Book.typeMap.getAt(bookInstance.type)}</td>
                        
                            <td>${Book.statusMap.getAt(bookInstance.status)}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
