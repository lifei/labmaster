
<%@ page import="labmaster.sample.Test" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'test.label', default: 'Test')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'test.id.label', default: 'Id')}" />
                        
                            <th><g:message code="test.user.label" default="User" /></th>
                   	    
                            <th><g:message code="test.type.label" default="Type" /></th>
                   	    
                            <g:sortableColumn property="dateCreated" title="${message(code: 'test.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="count" title="${message(code: 'test.count.label', default: 'Count')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${testInstanceList}" status="i" var="testInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${testInstance.id}">${fieldValue(bean: testInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: testInstance, field: "user")}</td>
                        
                            <td>${fieldValue(bean: testInstance, field: "type")}</td>
                        
                            <td><g:formatDate date="${testInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: testInstance, field: "count")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${testInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
