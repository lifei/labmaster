
<%@ page import="labmaster.device.Schedule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'schedule.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="beginTime" title="${message(code: 'schedule.beginTime.label', default: 'Begin Time')}" />
                        
                            <g:sortableColumn property="endTime" title="${message(code: 'schedule.endTime.label', default: 'End Time')}" />
                        
                            <g:sortableColumn property="date" title="${message(code: 'schedule.date.label', default: 'Date')}" />
                        
                            <g:sortableColumn property="createTime" title="${message(code: 'schedule.createTime.label', default: 'Create Time')}" />
                        
                            <th><g:message code="schedule.apparatus.label" default="Apparatus" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${scheduleInstanceList}" status="i" var="scheduleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${scheduleInstance.id}">${fieldValue(bean: scheduleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: scheduleInstance, field: "beginTime")}</td>
                        
                            <td>${fieldValue(bean: scheduleInstance, field: "endTime")}</td>
                        
                            <td><g:formatDate date="${scheduleInstance.date}" /></td>
                        
                            <td><g:formatDate date="${scheduleInstance.createTime}" /></td>
                        
                            <td>${fieldValue(bean: scheduleInstance, field: "apparatus")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${scheduleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
