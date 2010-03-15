
<%@ page import="labmaster.book.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
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
                                    <g:select name="type" from="${0..5}" value="${fieldValue(bean: bookInstance, field: 'type')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="book.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${0..5}" value="${fieldValue(bean: bookInstance, field: 'status')}"  />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="book.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${labmaster.auth.Member.list()}" optionKey="id" value="${bookInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="book.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${bookInstance?.dateCreated}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated"><g:message code="book.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${bookInstance?.lastUpdated}" noSelection="['': '']" />
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
