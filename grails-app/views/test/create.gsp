
<%@ page import="labmaster.sample.Test" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'test.label', default: 'Test')}" />
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
            <g:hasErrors bean="${testInstance}">
            <div class="errors">
                <g:renderErrors bean="${testInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="test.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: testInstance, field: 'user', 'errors')}">
                                    <g:hiddenField name="user.id" value="${testInstance?.user?.id}"  />
                                    ${testInstance?.user}
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="test.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: testInstance, field: 'type', 'errors')}">
                                    <g:select name="type.id" from="${labmaster.sample.TestType.list()}" optionKey="id" value="${testInstance?.type?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="test.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: testInstance, field: 'dateCreated', 'errors')}">
                                ${new Date()}
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="count"><g:message code="test.count.label" default="Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: testInstance, field: 'count', 'errors')}">
                                    <g:select name="count" from="${1..100}" value="${fieldValue(bean: testInstance, field: 'count')}"  />
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
