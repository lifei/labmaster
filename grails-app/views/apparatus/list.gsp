
<%@ page import="labmaster.device.Apparatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'apparatus.label', default: 'Apparatus')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'apparatus.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'apparatus.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'apparatus.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="factory" title="${message(code: 'apparatus.factory.label', default: 'Factory')}" />
                        
                            <g:sortableColumn property="buyDate" title="${message(code: 'apparatus.buyDate.label', default: 'Buy Date')}" />
                        
                            <g:sortableColumn property="createDate" title="${message(code: 'apparatus.createDate.label', default: 'Create Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${apparatusInstanceList}" status="i" var="apparatusInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${apparatusInstance.id}">${fieldValue(bean: apparatusInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: apparatusInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: apparatusInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: apparatusInstance, field: "factory")}</td>
                        
                            <td><g:formatDate date="${apparatusInstance.buyDate}" /></td>
                        
                            <td><g:formatDate date="${apparatusInstance.createDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${apparatusInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
