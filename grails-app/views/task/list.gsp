
<%@ page import="labmaster.task.Task" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template='top' />
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'task.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'task.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="content" title="${message(code: 'task.content.label', default: 'Content')}" />
                        
                            <g:sortableColumn property="object" title="${message(code: 'task.object.label', default: 'Object')}" />
                        
                            <g:sortableColumn property="complete" title="${message(code: 'task.complete.label', default: 'Complete')}" />
                        
                            <th><g:message code="task.assignFrom.label" default="Assign From" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "content")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "object")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "complete")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "assignFrom")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${taskInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
