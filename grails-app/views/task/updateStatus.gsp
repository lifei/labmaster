<%@ page import="labmaster.task.Task" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template='top' />
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${taskInstance?.id}" />
                <g:hiddenField name="version" value="${taskInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
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
                            <td valign="top" class="name"><g:message code="task.assignFrom.label" default="Assign From" /></td>
                            
                            <td valign="top" class="value"><g:link controller="member" action="show" id="${taskInstance?.assignFrom?.id}">${taskInstance?.assignFrom?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.assignTo.label" default="Assign To" /></td>
                            
                            <td valign="top" class="value"><g:link controller="member" action="show" id="${taskInstance?.assignTo?.id}">${taskInstance?.assignTo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="complete"><g:message code="task.complete.label" default="Complete" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'complete', 'errors')}">
                                    <g:select name="complete" from="${0..100}" value="${fieldValue(bean: taskInstance, field: 'complete')}"  /> 
                                    %
                                </td>
                            </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taskInstance?.startDate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="task.deadline.label" default="Deadline" /></td>
                            <td valign="top" class="value">
                            <b style="color:red;">
                            <g:formatDate date="${taskInstance?.deadline}" />
                            </b></td>
                            
                        </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endDate"><g:message code="task.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${taskInstance?.endDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="task.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taskInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${taskInstance?.status}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
