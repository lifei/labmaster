<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">首页</a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    <g:ifAnyGranted role="ROLE_BOOKADMIN">
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
    </g:ifAnyGranted>
</div>

