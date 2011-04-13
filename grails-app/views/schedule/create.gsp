
<%@ page import="labmaster.device.Schedule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${scheduleInstance}">
            <div class="errors">
                <g:renderErrors bean="${scheduleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                                    <label for="dateCreated"><g:message code="schedule.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${scheduleInstance?.dateCreated}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated"><g:message code="schedule.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scheduleInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${scheduleInstance?.lastUpdated}" noSelection="['': '']" />
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
