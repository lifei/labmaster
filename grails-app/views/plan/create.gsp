
<%@ page import="labmaster.task.Plan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
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
            <g:hasErrors bean="${planInstance}">
            <div class="errors">
                <g:renderErrors bean="${planInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
<tr class="prop">
    <td valign="top" class="name">
        <label for="name"><g:message code="plan.name.label" default="Name" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: planInstance, field: 'name', 'errors')}">
        <g:textField name="name" value="${planInstance?.name}" />
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="content"><g:message code="plan.content.label" default="Content" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: planInstance, field: 'content', 'errors')}">
        <g:textArea name="content" cols="40" rows="5" value="${planInstance?.content}" />
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="object"><g:message code="plan.object.label" default="Object" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: planInstance, field: 'object', 'errors')}">
        <g:textArea name="object" cols="40" rows="5" value="${planInstance?.object}" />
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="project"><g:message code="plan.project.label" default="Project" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: planInstance, field: 'project', 'errors')}">
        <g:select name="project.id" from="${projects}" optionKey="id" value="${planInstance?.project?.id}"  />
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="user"><g:message code="plan.user.label" default="User" /></label>
    </td>
    <td valign="top" class="value">
        ${user}
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="complete"><g:message code="plan.complete.label" default="Complete" /></label>
    </td>
    <td valign="top" class="value">
        0%
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="dateCreated"><g:message code="plan.dateCreated.label" default="Date Created" /></label>
    </td>
    <td valign="top" class="value">
       ${new Date()}
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="startDate"><g:message code="plan.startDate.label" default="Start Date" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: planInstance, field: 'startDate', 'errors')}">
        <g:datePicker name="startDate" precision="day" value="${planInstance?.startDate}"  />
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="deadline"><g:message code="plan.deadline.label" default="Deadline" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: planInstance, field: 'deadline', 'errors')}">
        <g:datePicker name="deadline" precision="day" value="${planInstance?.deadline}"  />
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
