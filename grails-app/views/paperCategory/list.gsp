
<%@ page import="labmaster.paper.PaperCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paperCategory.label', default: 'PaperCategory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'paperCategory.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="createtime" title="${message(code: 'paperCategory.createtime.label', default: 'Createtime')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'paperCategory.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="parentId" title="${message(code: 'paperCategory.parentId.label', default: 'Parent Id')}" />
                        
                            <g:sortableColumn property="updatetime" title="${message(code: 'paperCategory.updatetime.label', default: 'Updatetime')}" />
                        
                            <g:sortableColumn property="userId" title="${message(code: 'paperCategory.userId.label', default: 'User Id')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paperCategoryInstanceList}" status="i" var="paperCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paperCategoryInstance.id}">${fieldValue(bean: paperCategoryInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${paperCategoryInstance.createtime}" /></td>
                        
                            <td>${fieldValue(bean: paperCategoryInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: paperCategoryInstance, field: "parentId")}</td>
                        
                            <td><g:formatDate date="${paperCategoryInstance.updatetime}" /></td>
                        
                            <td>${fieldValue(bean: paperCategoryInstance, field: "userId")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paperCategoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
