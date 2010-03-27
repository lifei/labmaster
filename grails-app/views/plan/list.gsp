
<%@ page import="labmaster.task.Plan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:set var="filterFields" value="${['user','complete','startDate','deadline','project']}" />
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
            <g:fieldFitler field="startDate" value="${['today','yesterday','thisWeek','lastWeek','thisMonth']}" />
            <g:fieldFitler field="deadline" value="${['today','nextWeek','thisWeek','lastWeek','thisMonth']}" />
            <g:fieldFitler field="complete" value="${['100','80','50']}" />
            <g:fieldFitler field="project" value="${['my','other','none']}" />
            </g:showFilterBox>
            <g:filterTipBox field="${filterFields}"
            customize="${[user:labmaster.auth.Member.read(params['user.id'])]}">
            
            </g:filterTipBox>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'plan.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'plan.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="complete" title="${message(code: 'plan.complete.label', default: 'Complete')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'plan.startDate.label', default: 'Start Date')}" />
                            <g:sortableColumn property="deadline" title="${message(code: 'plan.deadline.label', default: 'Deadline')}" />
                        
                            <th><g:message code="plan.project.label" default="Project" /></th>
                   	    
                            <th><g:message code="plan.user.label" default="User" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${planInstanceList}" status="i" var="planInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${planInstance.id}">${fieldValue(bean: planInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: planInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: planInstance, field: "complete")} %</td>
                        
                            <td>${formatDate(date: planInstance?.startDate)}</td>

                            <td>${formatDate(date: planInstance?.deadline)}</td>
                        
                            <td>${fieldValue(bean: planInstance, field: "project")}</td>
                            <td>
                            <g:safeOutput var="planInstance">
                                ${fieldValue(bean: planInstance, field: "user")}
                           </g:safeOutput>    
                           </td> 
                        </tr>
                    
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${planInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp 
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>

