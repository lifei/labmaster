
<%@ page import="labmaster.book.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="top" />
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bookInstance}">
            <div class="errors">
                <g:renderErrors bean="${bookInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="book.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bookInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author"><g:message code="book.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'author', 'errors')}">
                                    <g:textField name="author" value="${bookInstance?.author}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="press"><g:message code="book.press.label" default="Press" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'press', 'errors')}">
                                    <g:textField name="press" value="${bookInstance?.press}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="book.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${Book.typeMap}" optionKey='key' value="${fieldValue(bean: bookInstance, field: 'type')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="book.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${Book.statusMap}" optionKey='key' optionText='value' value="${fieldValue(bean: bookInstance, field: 'status')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location"><g:message code="book.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'location', 'errors')}">
                                    <g:textField name="location" value="${bookInstance?.location}" />
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
