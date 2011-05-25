

<%@ page import="labmaster.paper.PaperCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paperCategory.label', default: 'PaperCategory')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${paperCategoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${paperCategoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createtime"><g:message code="paperCategory.createtime.label" default="Createtime" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperCategoryInstance, field: 'createtime', 'errors')}">
                                    <g:datePicker name="createtime" precision="day" value="${paperCategoryInstance?.createtime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="paperCategory.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperCategoryInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${paperCategoryInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parentId"><g:message code="paperCategory.parentId.label" default="Parent Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperCategoryInstance, field: 'parentId', 'errors')}">
                                    <g:textField name="parentId" value="${fieldValue(bean: paperCategoryInstance, field: 'parentId')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="updatetime"><g:message code="paperCategory.updatetime.label" default="Updatetime" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperCategoryInstance, field: 'updatetime', 'errors')}">
                                    <g:datePicker name="updatetime" precision="day" value="${paperCategoryInstance?.updatetime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userId"><g:message code="paperCategory.userId.label" default="User Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paperCategoryInstance, field: 'userId', 'errors')}">
                                    <g:textField name="userId" value="${fieldValue(bean: paperCategoryInstance, field: 'userId')}" />
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
