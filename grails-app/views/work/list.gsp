
<%@ page import="labmaster.task.Work" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
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
            <g:fieldFitler field="date" value="${['today','yesterday','thisWeek','lastWeek','thisMonth']}">
            <%
            def p = [:]+params+[date:'customize']
            p.remove('date.start')
            p.remove('date.end')
            p.remove('date.type')
            p.remove('date.before')
            p.remove('date.after')
            %>

            <%--
            <div style="margin-top:5px;width:500px;">
            <input type="text" id="datepicker1" size="12" value="${formatDate(date:new Date()-7)}" /> -
            <input type="text" id="datepicker2" size="12" value="${formatDate(date:new Date())}" /> 
            &nbsp; &nbsp; 
            <g:link url="javascript:void(0);" id="betweenDate">期间的工作</g:link>
            <script>
            $j(function(){
                $j("#datepicker1").datepicker({showOn: 'button', buttonImage: '${resource(dir:'images', file:'calendar.gif')}', buttonImageOnly: true,dateFormat:'yy-mm-dd'});
                $j("#datepicker2").datepicker({showOn: 'button', buttonImage: '${resource(dir:'images', file:'calendar.gif')}', buttonImageOnly: true,dateFormat:'yy-mm-dd'});
                $j('#betweenDate').click(function() {
                    window.location='${createLink(action:"list",params:p)}&date.start='+$j('#datepicker1').val()
                    +'&date.end='+$j('#datepicker2').val();
                });
            });
            </script>
            </div>
            <div style="margin-top:5px;width:500px;">
            <input type="text" id="datepicker" size="12" value="${formatDate(date:new Date())}" /> 
            &nbsp; &nbsp; 
            <g:link url="javascript:void(0);" id="beforeDate">之前的工作</g:link>
            <g:link url="javascript:void(0);" id="afterDate"> 之后的工作</g:link>
            <script>
            $j(function(){
                $j("#datepicker").datepicker({showOn: 'button', buttonImage: '${resource(dir:'images', file:'calendar.gif')}', buttonImageOnly: true,dateFormat:'yy-mm-dd'});
                $j('#beforeDate').click(function() {
                    window.location='${createLink(action:"list",params:p)}&date.type=before&date.before='
                    +$j('#datepicker').val();
                });
                $j('#afterDate').click(function() {
                    window.location='${createLink(action:"list",params:p)}&date.type=after&date.after='
                    +$j('#datepicker').val();
                });
            });
            </script>
            </div>
            --%>
            <g:oneDatePicker field="date" value="${['before','after']}" />
            <g:twoDatePicker field="date" value="${['between']}" />
            </g:fieldFitler>

            </g:showFilterBox>
            <%
            def date = ''
            if(params.'date.type'=='between') {
                date = "${params.'date.start'}到${params.'date.end'}期间"
            } else {
                date = "${params.'date.value'}" + message(code:"work.filter.date.${params.'date.type'}")
            }
            %>
            <g:filterTipBox customize="${[user:labmaster.auth.Member.read(params['user.id']), date:date]}">
            
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
<%--
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=gsp textwidth=1000
vim600: encoding=utf-8 commentstring=<%--\ %s\ --%>
--%>

