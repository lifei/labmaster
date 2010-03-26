
<%@ page import="labmaster.task.Plan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.id.label" default="Id" /></td>
    
    <td valign="top" class="value">${fieldValue(bean: planInstance, field: "id")}</td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.name.label" default="Name" /></td>
    
    <td valign="top" class="value">${fieldValue(bean: planInstance, field: "name")}</td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.content.label" default="Content" /></td>
    
    <td valign="top" class="value">${fieldValue(bean: planInstance, field: "content")}</td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.object.label" default="Object" /></td>
    
    <td valign="top" class="value">${fieldValue(bean: planInstance, field: "object")}</td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.project.label" default="Project" /></td>
    
    <td valign="top" class="value"><g:link controller="project" action="show" id="${planInstance?.project?.id}">${planInstance?.project?.encodeAsHTML()}</g:link></td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.user.label" default="User" /></td>
    
    <td valign="top" class="value"><g:link controller="member" action="show" id="${planInstance?.user?.id}">${planInstance?.user?.encodeAsHTML()}</g:link></td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.complete.label" default="Complete" /></td>
    
    <td valign="top" class="value">${fieldValue(bean: planInstance, field: "complete")}%</td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.lastUpdated.label" default="Last Updated" /></td>
    
    <td valign="top" class="value"><g:formatDate date="${planInstance?.lastUpdated}" /></td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.dateCreated.label" default="Date Created" /></td>
    
    <td valign="top" class="value"><g:formatDate date="${planInstance?.dateCreated}" /></td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.startDate.label" default="Start Date" /></td>
    
    <td valign="top" class="value"><g:formatDate date="${planInstance?.startDate}" /></td>
    
</tr>

<g:if test="${planInstance.complete==100}">
<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.endDate.label" default="End Date" /></td>
    
    <td valign="top" class="value"><g:formatDate date="${planInstance?.endDate}" /></td>
    
</tr>
</g:if>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.deadline.label" default="Deadline" /></td>
    
    <td valign="top" class="value"><b style="color:red;text-weight:bold;">
        <g:formatDate date="${planInstance?.deadline}" /></b></td>
    
</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="plan.works.label" default="Works" /></td>
    
    <td valign="top" style="text-align: left;" class="value">
        <g:link controller="work" action="create" params="['plan.id': planInstance?.id]">
        ★${message(code: 'default.add.label', args: [message(code: 'work.label', default: 'Work')])}</g:link>
    </td>
    
</tr>

<tr>
    <td colspan="2">
        <ul>
        <g:each in="${works}" var="w">
            <li>
            [<g:formatDate date="${w?.date}" />] 
            <g:link controller="work" action="show" id="${w.id}">
            ${w?.content?.encodeAsHTML()}
            </g:link><br />
            工作内容：${w?.note.encodeAsHTML()}<br />
            工作时间: ${w?.hour}小时<br />
            已完成进度: ${w?.progress}%<br />
            预计完成时间: <g:formatDate date="${w?.finishDate}" />
            </li>
        </g:each>
        </ul>
            <div class="paginateButtons">
                <g:paginate total="${planInstance.works.size()}"
                id="${planInstance.id}" />
            </div>
    </td>
</tr>

                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${planInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
