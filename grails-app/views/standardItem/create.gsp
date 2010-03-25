
<%@ page import="labmaster.item.StandardItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'standardItem.label', default: 'StandardItem')}" />
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
            <g:hasErrors bean="${standardItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${standardItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="standardItem.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: standardItemInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="128" value="${standardItemInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="note"><g:message code="standardItem.note.label" default="Note" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: standardItemInstance, field: 'note', 'errors')}">
                                    <g:textArea name="note" cols="40" rows="5" value="${standardItemInstance?.note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags"><g:message code="standardItem.tags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: standardItemInstance, field: 'tags', 'errors')}">
                                    <g:textField name="tags" maxlength="128" value="${standardItemInstance?.tags}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pic"><g:message code="standardItem.pic.label" default="Pic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: standardItemInstance, field: 'pic', 'errors')}">
                                    <g:textField name="pic" value="${standardItemInstance?.pic}" />
                                    <img src="../${standardItemInstance?.pic}" style="width:150px;" />
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
