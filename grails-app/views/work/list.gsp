
<%@ page import="labmaster.task.Work" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:set var="filterFields" value="${['user', 'date']}" />
        <g:filterCssAndJavascript field="${filterFields}" />
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
            <g:showFilterBox field="${filterFields}">
            <g:fieldFitler field="user" value="${['me','other', 'customize']}">
                <g:select style="width:120px;float:left;" name="user-id" from="${labmaster.auth.Member.list()}" optionKey="id" value="${workInstance?.assignTo?.id}" />
                <script>
                $j('#user-id').change(function() {
                    <%
                    def p = [:]+params+[user:'customize']
                    p.remove('user.id')
                    %>
                    window.location='${createLink(action:"list",params:p)}&user.id='+$j(this).val();
                });
                </script>
            </g:fieldFitler>
            <g:fieldFitler field="date" value="${['today','yesterday','thisWeek','lastWeek','thisMonth']}" />
            </g:showFilterBox>
            <g:filterTipBox field="${filterFields}"
            customize="${[user:labmaster.auth.Member.read(params['user.id'])]}">
            
            </g:filterTipBox>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'work.id.label', default: 'Id')}" />
                        
                            <th><g:message code="work.user.label" default="User" /></th>
                   	    
                            <th><g:message code="work.plan.label" default="Plan" /></th>
                   	    
                            <g:sortableColumn property="content" title="${message(code: 'work.content.label', default: 'Content')}" />
                        
                            <g:sortableColumn property="note" title="${message(code: 'work.note.label', default: 'Note')}" />
                        
                            <g:sortableColumn property="date" title="${message(code: 'work.date.label', default: 'Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${workInstanceList}" status="i" var="workInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${workInstance.id}">${fieldValue(bean: workInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: workInstance, field: "user")}</td>
                        
                            <td>${fieldValue(bean: workInstance, field: "plan")}</td>
                        
                            <td>${fieldValue(bean: workInstance, field: "content")}</td>
                        
                            <td>${fieldValue(bean: workInstance, field: "note")}</td>
                        
                            <td><g:formatDate date="${workInstance.date}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${workInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
