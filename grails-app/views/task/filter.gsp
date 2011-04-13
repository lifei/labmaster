
<%@ page import="labmaster.task.Task" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript library="jquery/jquery-1.3.2.min" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'task.filter.css')}" />
        <g:if test="${params.filter||(!params.assign||params.assign=='disable')||(!params.complete||params.complete=='disable')||(!params.deadline||params.deadline=='disable')}">
        <script>
        var fold = 'open';
        </script>
        </g:if>
        <g:javascript library="labmaster/task/filter" />
    </head>
    <body>
    <g:render template='top' />
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div id="filter" class="filter"
                    <g:if test="${(params.assign&&params.assign!='disable')&&(params.complete&&params.complete!='disable')&&(params.deadline&&params.deadline!='disable')}">
                    style="display:none;"
                    </g:if>
            
            >
                <div class="filter-title">
                    筛选 
                    <a id="fold" href="javascript:void(0);">[展开]</a>
                    <a id="filter-help-button" href="javascript:void(0);"
                    onmouseover="javascript:$j('#filter-help').show();"
                    onmouseout ="javascript:$j('#filter-help').hide();"
                    >[?]</a>
                    <div id="filter-help" class="filter-help">
                        <ul>
                            <li>鼠标点击<g:radio />后，再点击
                            <g:submitButton name="fr" value="过滤" />
                            </li>
                            <li>鼠标点击<g:radio />
                            <strong>后面的文字</strong>直接过滤。</li>
                            <li>多项条件过滤只需重复多次过滤过程。</li>
                            <li>选好3个<g:radio />后可以点击
                            <g:submitButton name="fr" value="过滤" />
一次完成。</li>
                        </ul>
                    </div>
                </div>
                <g:form action="filter" method="get">
                    <g:if test="${!params.assign||params.assign=='disable'}">
                    <div class="findByHint">按指派人:</div>
                    <div class="subCategoryBox">
                        <div class="radioBox">
                            <g:radio name="assign" value="from" checked="true"/>
                            <g:link params="${([:]+params)+[assign:'from']}" action="filter">由我指派</g:link>
                        </div>
                        <div class="radioBox">
                            <g:radio name="assign" value="to" />
                            <g:link params="${([:]+params)+[assign:'to']}" action="filter">指派给我</g:link>
                        </div>
                        <g:ifAnyGranted role="ROLE_TEACHER">
                        <div class="radioBox" style="width:150px;">
                            <g:radio name="assign" value="none" />
                            <g:link params="${([:]+params)+[assign:'none']}" action="filter">
                                与我无关<b style="color:red;">(管理员)</b></g:link>
                        </div>
                        </g:ifAnyGranted>
                        <div class="radioBox">
                            <g:radio name="assign" value="disable" />
                            <label> 都行 </label>
                        </div>
                    </div>
                    </g:if>
                    <g:if test="${!params.complete||params.complete=='disable'}">
                    <div class="findByHint">按完成度:</div>
                    <div class="subCategoryBox">
                        <div class="radioBox">
                            <g:radio name="complete" value="no" checked="true" />
                            <g:link params="${([:]+params)+[complete:'no']}" action="filter">未完成</g:link>
                        </div>
                        <div class="radioBox">
                            <g:radio name="complete" value="yes"/>
                            <g:link params="${([:]+params)+[complete:'yes']}" action="filter">已完成</g:link>
                        </div>
                        <div class="radioBox">
                            <g:radio name="complete" value="almost" />
                            <g:link params="${([:]+params)+[complete:'almost']}" action="filter">将要完成</g:link>
                        </div>
                        <div class="radioBox">
                            <g:radio name="complete" value="disable" />
                            <label> 都行 </label>
                        </div>
                    </div>
                    </g:if>
                    <g:if test="${!params.deadline||params.deadline=='disable'}">
                    <g:set var="tmpparams" value="${params}" />
                    <div class="findByHint">按期限:</div>
                    <div class="subCategoryBox">
                        <div class="radioBox">
                            <g:radio name="deadline" value="no" checked="true" />
                            <g:link params="${([:]+params)+[deadline:'no']}" action="filter">未超期</g:link>
                        </div>
                        <div class="radioBox">
                            <g:radio name="deadline" value="yes"/>
                            <g:link params="${([:]+params)+[deadline:'yes']}" action="filter">超期</g:link>
                        </div>
                        <div class="radioBox">
                            <g:radio name="deadline" value="disable" />
                            <label> 都行 </label>
                        </div>
                    </div>
                    </g:if>
                    <p align="center">
                        <g:submitButton id='filter-button' name="filter" value="过滤" />
                    </p>
                </g:form>
            </div>
            <%-- {{{ filter-tip --%>
            <g:if test="${(params.assign&&params.assign!='disable')|| (params.complete&&params.complete!='disable')|| (params.deadline&&params.deadline!='disable')}">
            <div id="filter-tip" class="filter" style="float:left;">
                <div class="filter-title">
                    筛选条件
                    <g:link action="filter">[清空所有条件]</g:link>
                    <a id="filter-result-help-button" href="javascript:void(0);"
                    onmouseover="javascript:$j('#filter-resutl-help').show();"
                    onmouseout ="javascript:$j('#filter-resutl-help').hide();"
                    >[?]</a>
                    <div id="filter-resutl-help" class="filter-help">
                        <ul>
                            <li>鼠标点击蓝框内链接移除对该项过滤。</li>
                        </ul>
                    </div>
                </div>
                <center>
                <g:if test="${message(code:'task.filter.assign.'+params.assign,default:'')!=''}">
                <g:link params="${([:]+params)+[assign:'disable']}" action="filter">
                <g:message code="task.filter.assign.${params.assign}" default="" />
                </g:link>
                </g:if>
                <g:if test="${message(code:'task.filter.complete.'+params.complete,default:'')!=''}">
                <g:link params="${([:]+params)+[complete:'disable']}" action="filter">
                <g:message code="task.filter.complete.${params.complete}" default="" />
                </g:link>
                </g:if>
                <g:if test="${message(code:'task.filter.deadline.'+params.deadline,default:'')!=''}">
                <g:link params="${([:]+params)+[deadline:'disable']}" action="filter">
                <g:message code="task.filter.deadline.${params.deadline}" default="" />
                </g:link>
                </g:if>
                </center>
            </div>
            </g:if><%-- }}} --%>
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
                    <tr>
                        <td class="paginateButtons" colspan="5">
                            <g:paginate params="${params}" total="${taskInstanceTotal}" />
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp textwidth=1000
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>

