<div id="leftMenu">
    <h1>欢迎来到图书管理系统</h1>
    <div id="mainMenu">
        <h2>会员:${loggedInUserInfo(field:'username')}</h2>
        <div style="display:block;">
            <g:ifAnyGranted role="ROLE_ADMIN">
            <li><g:link controller="member" action="list">成员管理<b 
            style="color:rgb(255,0,0)">(需要管理员权限)</b></g:link> </li>
            </g:ifAnyGranted>
            <li><g:link controller="member" action="show" 
                id="${loggedInUserInfo(field:'id')}">个人中心</g:link> </li>
            <li><g:link controller="logout">退出登录</g:link> </li>
        </div>
        <h2>任务</h2>
        <div <g:if test="${['plan','project','work','task'].contains(controllerName)}">style="display:block;"</g:if>>
            <li><g:link controller="project" action="create">创建课题</g:link> </li>
            <li><g:link controller="project"                >查看课题</g:link> </li>
            <li><g:link controller="plan" action="create">创建计划</g:link> </li>
            <li><g:link controller="plan">查看计划</g:link> </li>
            <li><g:link controller="work" action="create">工作记录</g:link> </li>
            <li><g:link controller="work">查看工作</g:link> </li>
            <li><g:link controller="task" action="create">指派任务</g:link> </li>
            <li><g:link controller="task">查看任务</g:link> </li>
        </div>
        <h2>图书</h2>
        <div <g:if test="${controllerName=='book'}">style="display:block;"</g:if>>
            <g:ifAnyGranted role='ROLE_BOOKADMIN'>
            <li><g:link controller="book" action="create">创建新的书籍 <b
            style="color:rgb(255,0,0)">(需要图书管理员权限)</b></g:link> </li>
            </g:ifAnyGranted>
            <li><g:link controller="book">查看所有图书</g:link> </li>
        </div>
        <h2>测样</h2>
        <div <g:if test="${controllerName=='test'}">style="display:block;"</g:if>>
            <li><g:link controller="test" action="create">测样登记 </g:link> </li>
            <li><g:link controller="test"            >测样浏览</g:link> </li>
        </div>
        <h2>仪器设备</h2>
        <div <g:if test="${['device'].contains(controllerName)}">style="display:block;"</g:if>>
            <li><g:link controller="device" action="create">仪器设备登记 </g:link> </li>
            <li><g:link controller="device"            >仪器设备列表</g:link> </li>
        </div>
        <h2>采购</h2>
        <div <g:if test="${['finance'].contains(controllerName)}">style="display:block;"</g:if>>
            <li><g:link controller="finance" action="create">采购登记 </g:link> </li>
            <li><g:link controller="finance"            >采购历史</g:link> </li>
        </div>
        <h2>财务</h2>
        <div <g:if test="${['reimbursement'].contains(controllerName)}">style="display:block;"</g:if>>
            <li><g:link controller="reimbursement" action="create">指派报账
            <strong>(需要财务管理员)</strong>
            </g:link> </li>
            <li><g:link controller="reimbursement"            >报账列表</g:link> </li>
            <li><g:link controller="reimbursement" action="create">新建发票
            <strong>(需要财务管理员)</strong>
            </g:link> </li>
            <li><g:link controller="reimbursement"            >发票列表</g:link> </li>
        </div>
        <h2>物品</h2>
        <div <g:if test="${['standardItem','reagent'].contains(controllerName)}">style="display:block;"</g:if>>
            <li><g:link controller="standardItem" action="create">新物品信息
                <strong>(需要物品管理员权限)</strong></g:link> </li>
            <li><g:link controller="standardItem"            >浏览物品库</g:link> </li>
        </div>
        <h2>文献</h2>
        <div <g:if test="${['standardItem','reagent'].contains(controllerName)}">style="display:block;"</g:if>>
            <li><g:link controller="standardItem" action="create">新阅读文献 </g:link> </li>
            <li><g:link controller="standardItem"            >文献库</g:link> </li>
        </div>
    </div>
</div>
<script>
var $j = jQuery.noConflict();
$j(function() {
$j('h2', $j('#mainMenu')).click(function() {
    var a = $j(this).next('div:visable');
    var b = $j(this).next('div:hidden');
    a.hide();
    b.show();
        });
});
</script>
