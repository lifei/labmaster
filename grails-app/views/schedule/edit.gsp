
<%@ page import="labmaster.device.Schedule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${scheduleInstance}">
            <div class="errors">
                <g:renderErrors bean="${scheduleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${scheduleInstance?.id}" />
                <g:hiddenField name="version" value="${scheduleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="beginTime"><g:message code="schedule.beginTime.label" default="Begin Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'beginTime', 'errors')}">
                                    <g:select name="beginTime" from="${0..24}" value="${fieldValue(bean: scheduleInstance, field: 'beginTime')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endTime"><g:message code="schedule.endTime.label" default="End Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'endTime', 'errors')}">
                                    <g:select name="endTime" from="${0..24}" value="${fieldValue(bean: scheduleInstance, field: 'endTime')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="schedule.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" precision="day" value="${scheduleInstance?.date}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="createTime"><g:message code="schedule.createTime.label" default="Create Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'createTime', 'errors')}">
                                    <g:datePicker name="createTime" precision="day" value="${scheduleInstance?.createTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="apparatus"><g:message code="schedule.apparatus.label" default="Apparatus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'apparatus', 'errors')}">
                                    <g:select name="apparatus.id" from="${labmaster.device.Apparatus.list()}" optionKey="id" value="${scheduleInstance?.apparatus?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="schedule.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${labmaster.auth.Member.list()}" optionKey="id" value="${scheduleInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
