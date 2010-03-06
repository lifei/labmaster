
<%@ page import="labmaster.device.Schedule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="schedule.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scheduleInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="schedule.beginTime.label" default="Begin Time" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scheduleInstance, field: "beginTime")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="schedule.endTime.label" default="End Time" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scheduleInstance, field: "endTime")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="schedule.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${scheduleInstance?.date}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="schedule.createTime.label" default="Create Time" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${scheduleInstance?.createTime}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="schedule.apparatus.label" default="Apparatus" /></td>
                            
                            <td valign="top" class="value"><g:link controller="apparatus" action="show" id="${scheduleInstance?.apparatus?.id}">${scheduleInstance?.apparatus?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="schedule.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="member" action="show" id="${scheduleInstance?.user?.id}">${scheduleInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${scheduleInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
