
<%@ page import="labmaster.item.StandardItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'standardItem.label', default: 'StandardItem')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <% flash.field = ['user', 'date'] %>
        <link  type="text/css"
        href="${resource(dir:'css/smoothness',file:'jquery-ui-1.7.2.custom.css')}" rel="stylesheet" />

        <g:filterCssAndJavascript />
        <g:javascript library="jquery/jquery-ui-1.7.2.custom.min" />
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
            <g:showFilterBox>
            <g:fieldFitler field="tags" value="${['glass','reagent', 'office', 'other', 'customize']}">
            <div style="width:120px;">
            <input  id="search-tags=text" size="10" type="text" /> &nbsp;
            <g:link url="javascript:void(0);">搜索</g:link>
            </div>
            </g:fieldFitler>

            <g:fieldFitler field="name" value="${['customize']}">
            <div style="width:200px;">
            <input id="search-name=text" size="20" type="text" /> &nbsp;
            <g:link url="javascript:void(0);">搜索</g:link>
            </div>
            </g:fieldFitler>
            </g:showFilterBox>
            <g:filterTipBox customize="${[user:labmaster.auth.Member.read(params['user.id']), date:date]}">
            
            </g:filterTipBox>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'standardItem.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'standardItem.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="note" title="${message(code: 'standardItem.note.label', default: 'Note')}" />
                        
                            <g:sortableColumn property="tags" title="${message(code: 'standardItem.tags.label', default: 'Tags')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'standardItem.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'standardItem.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${standardItemInstanceList}" status="i" var="standardItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${standardItemInstance.id}">${fieldValue(bean: standardItemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: standardItemInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: standardItemInstance, field: "note")}</td>
                        
                            <td>${fieldValue(bean: standardItemInstance, field: "tags")}</td>
                        
                            <td><g:formatDate date="${standardItemInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${standardItemInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${standardItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
