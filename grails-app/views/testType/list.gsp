
<%@ page import="labmaster.sample.TestType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'testType.label', default: 'TestType')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'testType.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'testType.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'testType.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="note" title="${message(code: 'testType.note.label', default: 'Note')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'testType.price.label', default: 'Price')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'testType.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${testTypeInstanceList}" status="i" var="testTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${testTypeInstance.id}">${fieldValue(bean: testTypeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: testTypeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: testTypeInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: testTypeInstance, field: "note")}</td>
                        
                            <td>${fieldValue(bean: testTypeInstance, field: "price")}</td>
                        
                            <td><g:formatDate date="${testTypeInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${testTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
