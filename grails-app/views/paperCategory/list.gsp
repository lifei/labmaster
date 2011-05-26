
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
            <g:each in="${paperCategoryInstanceList}" status="i" var="paperCategoryInstance">
            <div>
            <h1>
            <g:link action="show" id="${paperCategoryInstance.id}">${fieldValue(bean: paperCategoryInstance, field: "name")}</g:link>
            </h1>
            <div>
            <g:showSubCategory id="${paperCategoryInstance.id}">
            <g:link action="show" id="${category.id}">${fieldValue(bean: category, field: "name")}</g:link>
            </g:showSubCategory>
            </div>
            </div>
            </g:each>
            </div>
        </div>
    </body>
</html>
