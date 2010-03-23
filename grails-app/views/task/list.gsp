
<%@ page import="labmaster.task.Task" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript library="jquery/jquery-1.4.1.min" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'task.filter.css')}" />
        <g:javascript library="labmaster/task/filter" />
    </head>
    <body>
    <g:render template='top' />
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div id="filter" class="filter">
                <div class="filter-title">
                    筛选 
                    <a id="fold" href="javascript:void(0);">[展开]</a>
                    <script>
                    </script>
                </div>
                <g:form action="filter" method="get">
                    <div class="findByHint">按指派人:</div>
                    <div class="subCategoryBox">
                        <div class="radioBox">
                            <g:radio name="assign" value="from" checked="true"/>
                            <label> 我指派的 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="assign" value="to" />
                            <label> 指派给我 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="assign" value="none" />
                            <label> 与我无关 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="assign" value="disable" />
                            <label> 都行 </label>
                        </div>
                    </div>
                    <div class="findByHint">按完成度:</div>
                    <div class="subCategoryBox">
                        <div class="radioBox">
                            <g:radio name="complete" value="no" checked="true" />
                            <label> 未完成 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="complete" value="yes"/>
                            <label> 已完成 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="complete" value="almost" />
                            <label> 将要完成 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="complete" value="disable" />
                            <label> 都行 </label>
                        </div>
                    </div>
                    <div class="findByHint">按期限:</div>
                    <div class="subCategoryBox">
                        <div class="radioBox">
                            <g:radio name="deadline" value="yes"/>
                            <label> 超期 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="deadline" value="no" checked="true" />
                            <label> 未超期 </label>
                        </div>
                        <div class="radioBox">
                            <g:radio name="deadline" value="disable" />
                            <label> 都行 </label>
                        </div>
                    </div>
                    <p align="center">
                        <g:submitButton id='filter-button' name="filter" value="过滤" />
                    </p>
                </g:form>
            </div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="${message(code: 'task.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="complete" title="${message(code: 'task.complete.label', default: 'Complete')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'task.startDate.label', default: '日期')}" />
                        
                            <th><g:message code="task.assignFrom.label" default="Assign From" /></th>
                            <th><g:message code="task.assignTo.label" default="Assign To" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show"
                            id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "name")}</g:link></td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "complete")}</td>
                        
                            <td><g:formatDate date="${fieldValue(bean: taskInstance, field: "startDate")}" /></td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "assignFrom")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "assignTo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${taskInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp textwidth=1000
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>

