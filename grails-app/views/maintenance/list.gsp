
<%@ page import="labmaster.device.Maintenance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'maintenance.label', default: 'Maintenance')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'maintenance.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'maintenance.description.label', default: 'Description')}" />
                        
                            <th><g:message code="maintenance.apparatus.label" default="Apparatus" /></th>
                   	    
                            <g:sortableColumn property="modifyDate" title="${message(code: 'maintenance.modifyDate.label', default: 'Modify Date')}" />
                        
                            <g:sortableColumn property="createDate" title="${message(code: 'maintenance.createDate.label', default: 'Create Date')}" />
                        
                            <th><g:message code="maintenance.user.label" default="User" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${maintenanceInstanceList}" status="i" var="maintenanceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${maintenanceInstance.id}">${fieldValue(bean: maintenanceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: maintenanceInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: maintenanceInstance, field: "apparatus")}</td>
                        
                            <td><g:formatDate date="${maintenanceInstance.modifyDate}" /></td>
                        
                            <td><g:formatDate date="${maintenanceInstance.createDate}" /></td>
                        
                            <td>${fieldValue(bean: maintenanceInstance, field: "user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${maintenanceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
