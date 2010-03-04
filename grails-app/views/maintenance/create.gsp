
<%@ page import="labmaster.device.Maintenance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'maintenance.label', default: 'Maintenance')}" />
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
            <g:hasErrors bean="${maintenanceInstance}">
            <div class="errors">
                <g:renderErrors bean="${maintenanceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="maintenance.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: maintenanceInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${maintenanceInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apparatus"><g:message code="maintenance.apparatus.label" default="Apparatus" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: maintenanceInstance, field: 'apparatus', 'errors')}">
                                    <g:select name="apparatus.id" from="${labmaster.device.Apparatus.list()}" optionKey="id" value="${maintenanceInstance?.apparatus?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="modifyDate"><g:message code="maintenance.modifyDate.label" default="Modify Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: maintenanceInstance, field: 'modifyDate', 'errors')}">
                                    <g:datePicker name="modifyDate" precision="day" value="${maintenanceInstance?.modifyDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createDate"><g:message code="maintenance.createDate.label" default="Create Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: maintenanceInstance, field: 'createDate', 'errors')}">
                                    <g:datePicker name="createDate" precision="day" value="${maintenanceInstance?.createDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="maintenance.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: maintenanceInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${labmaster.acl.User.list()}" optionKey="id" value="${maintenanceInstance?.user?.id}"  />
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
