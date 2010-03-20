<div class="nav">
    <span class="menuButton"><a class="home"
    href="${createLinkTo(dir:'')}">首页</a></span>
    <g:ifAnyGranted role='ROLE_ADMIN'>
    <span class="menuButton"><g:link class="list" action="list">成员列表</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New Member</g:link></span>
    </g:ifAnyGranted>
</div>

