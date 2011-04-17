
<%@ page import="labmaster.task.Task" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
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
                            <td valign="top" class="name"><g:message code="task.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taskInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taskInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.content.label" default="Content" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taskInstance, field: "content")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.object.label" default="Object" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taskInstance, field: "object")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.complete.label" default="Complete" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taskInstance, field: "complete")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.assignFrom.label" default="Assign From" /></td>
                            
                            <td valign="top" class="value"><g:link controller="member" action="show" id="${taskInstance?.assignFrom?.id}">${taskInstance?.assignFrom?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.assignTo.label" default="Assign To" /></td>
                            
                            <td valign="top" class="value"><g:link controller="member" action="show" id="${taskInstance?.assignTo?.id}">${taskInstance?.assignTo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taskInstance?.startDate}" /></td>
                            
                        </tr>
                    
                        <g:if test="${taskInstance?.complete==100}">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taskInstance?.endDate}" /></td>
                            
                        </tr>
                        </g:if>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.deadline.label" default="Deadline" /></td>
                            
                            <td valign="top" class="value">
                            <b style="color:red;"><g:formatDate date="${taskInstance?.deadline}" /></b></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taskInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taskInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taskInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${taskInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="edit" action="updateStatus" value="${message(code: 'default.button.updateStatus.label', default: 'Update Status')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
