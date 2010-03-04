
<%@ page import="labmaster.device.Apparatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'apparatus.label', default: 'Apparatus')}" />
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
            <g:hasErrors bean="${apparatusInstance}">
            <div class="errors">
                <g:renderErrors bean="${apparatusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="apparatus.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apparatusInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${apparatusInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="apparatus.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apparatusInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${apparatusInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="factory"><g:message code="apparatus.factory.label" default="Factory" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apparatusInstance, field: 'factory', 'errors')}">
                                    <g:textField name="factory" value="${apparatusInstance?.factory}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="buyDate"><g:message code="apparatus.buyDate.label" default="Buy Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apparatusInstance, field: 'buyDate', 'errors')}">
                                    <g:datePicker name="buyDate" precision="day" value="${apparatusInstance?.buyDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createDate"><g:message code="apparatus.createDate.label" default="Create Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apparatusInstance, field: 'createDate', 'errors')}">
                                    <g:datePicker name="createDate" precision="day" value="${apparatusInstance?.createDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serial"><g:message code="apparatus.serial.label" default="Serial" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: apparatusInstance, field: 'serial', 'errors')}">
                                    <g:textField name="serial" value="${apparatusInstance?.serial}" />
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
