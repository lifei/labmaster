
<%@ page import="labmaster.task.Work" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:render template="top" />
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${workInstance}">
            <div class="errors">
                <g:renderErrors bean="${workInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="work.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'user', 'errors')}">
                                    ${user}
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="plan"><g:message code="work.plan.label" default="Plan" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'plan', 'errors')}">
                                    <g:select name="plan.id" from="${plans}" optionKey="id" value="${workInstance?.plan?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content"><g:message code="work.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'content', 'errors')}">
                                    <g:textField name="content" value="${workInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="note"><g:message code="work.note.label" default="Note" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'note', 'errors')}">
                                    <g:textArea name="note" cols="40" rows="5" value="${workInstance?.note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="work.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" precision="day" value="${workInstance?.date}"  />
                                </td>
                            </tr>
                        
<tr class="prop">
    <td valign="top" class="name">
        <label for="date"><g:message code="work.finishDate.label" default="Finish Date" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'finishDate', 'errors')}">
        <g:datePicker name="finishDate" precision="day" value="${workInstance?.finishDate}"  />
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="hour"><g:message code="work.hour.label" default="Hour" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'hour', 'errors')}">
        <g:select from="${1..100}" name="hour" value="${fieldValue(bean: workInstance, field: 'hour')}" />
    </td>
</tr>
                        
<tr class="prop">
    <td valign="top" class="name">
        <label for="progress"><g:message code="work.progress.label" default="Progress" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: workInstance, field: 'progress', 'errors')}">
        <g:if test="${workInstance.plan}">
            <g:select from="${workInstance.plan.complete..100}" name="progress" value="${fieldValue(bean: workInstance, field: 'progress')}" />%
            <b style="color:red;padding-left:20px;">应&gt;${workInstance.plan.complete}%</b>
        </g:if>
        <g:else>
            <g:select from="${1..100}" name="progress" value="${fieldValue(bean: workInstance, field: 'progress')}" />%
        </g:else>
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
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp textwidth=10000
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>

