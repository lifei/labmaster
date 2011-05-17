<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link href="http://img.huoche.kuxun.cn/admin/common.css" rel="stylesheet" type="text/css" /> 
<title>${this.grailsApplication}</title> 
<link href="/common.css" rel="stylesheet" type="text/css" /> 
<style> 
    body{background:#E5ECF9; padding:0px;} 
</style> 
</head> 
<body> 
    <div style="padding:5px 0 5px 5px; width:120px;"> 
        <strong>时刻表v2.0-管理后台</strong> 
        <br />--${loggedInUserInfo(field:'username')}--
        <g:link controller="logout" target="_parent">[退]</g:link> -- 
        <a href="javascript:window.location.reload();">[刷]</a><br /><br /> 
        <div> 
            <div class="tree-tl">系统操作</div> 
            <ul class="tree"> 
                <li><a target="subframe-1" href="/index.php?action=operatorMgr&method=modifypwd">修改密码</a></li> 
                <li><g:link target="subframe-1" controller="member"
                        action="show" id="${loggedInUserInfo(field:'id')}">个人中心</g:link> </li>
                <li><g:link controller="logout" target="_parent">退出登录</g:link> </li>
            </ul> 
        </div> 
        <div> 
            <div class="tree-tl">任务</div>
            <ul class="tree"> 
                <li><g:link target="subframe-1" controller="project" action="create">创建课题</g:link> </li>
                <li><g:link target="subframe-1" controller="project"                >查看课题</g:link> </li>
                <li><g:link target="subframe-1" controller="plan" action="create">创建计划</g:link> </li>
                <li><g:link target="subframe-1" controller="plan">查看计划</g:link> </li>
                <li><g:link target="subframe-1" controller="work" action="create">工作记录</g:link> </li>
                <li><g:link target="subframe-1" controller="work">查看工作</g:link> </li>
                <li><g:link target="subframe-1" controller="task" action="create">指派任务</g:link> </li>
                <li><g:link target="subframe-1" controller="task">查看任务</g:link> </li>
            </ul> 
            <div class="tree-tl">图书</div>
            <ul class="tree"> 
                <g:ifAnyGranted role='ROLE_BOOKADMIN'>
                <li><g:link target="subframe-1" controller="book" action="create">创建新的书籍 <b
                style="color:rgb(255,0,0)">(*)</b></g:link> </li>
                </g:ifAnyGranted>
                <li><g:link target="subframe-1" controller="book">查看所有图书</g:link> </li>
            </ul> 
            <div class="tree-tl">测样</div>
            <ul class="tree"> 
                <li><g:link target="subframe-1" controller="test" action="create">测样登记 </g:link> </li>
                <li><g:link target="subframe-1" controller="test"            >测样浏览</g:link> </li>
            </ul> 
            <div class="tree-tl">仪器设备</div>
            <ul class="tree"> 
                <li><g:link target="subframe-1" controller="device" action="create">仪器设备登记 </g:link> </li>
                <li><g:link target="subframe-1" controller="device"            >仪器设备列表</g:link> </li>
            </ul> 
            <div class="tree-tl">采购</div>
            <ul class="tree"> 
                <li><g:link target="subframe-1" controller="finance" action="create">采购登记 </g:link> </li>
                <li><g:link target="subframe-1" controller="finance"            >采购历史</g:link> </li>
            </ul> 
            <div class="tree-tl">财务</div>
            <ul class="tree"> 
                <li><g:link target="subframe-1" controller="reimbursement" action="create">指派报账
                <strong>(*)</strong>
                </g:link> </li>
                <li><g:link target="subframe-1" controller="reimbursement"            >报账列表</g:link> </li>
                <li><g:link target="subframe-1" controller="reimbursement" action="create">新建发票
                <strong>(*)</strong>
                </g:link> </li>
                <li><g:link target="subframe-1" controller="reimbursement"            >发票列表</g:link> </li>
            </ul> 
            <div class="tree-tl">物品</div>
            <ul class="tree"> 
                <li><g:link target="subframe-1" controller="standardItem" action="create">新物品信息
                    <strong>(*)</strong></g:link> </li>
                <li><g:link target="subframe-1" controller="standardItem"            >浏览物品库</g:link> </li>
            </ul> 
            <div class="tree-tl">${message(code:'paper.label')}</div>
            <ul class="tree"> 
                <li><g:link target="subframe-1" controller="paper" action="upload">
                        ${message(code:'default.create.label', args:[message(code:'paper.label')])}
                </g:link> </li>
                <li><g:link target="subframe-1" controller="paper">
                        ${message(code:'default.list.label', args:[message(code:'paper.label')])}
                </g:link> </li>
            </ul> 
        </div> 

        <script src="http://jp1.kximg.cn/js/opt/jquery.js?a47dd98575ac6d4e9c7b52023d0b4cde"></script>
        <script>
        $(document).ready(function() {
            $("a").click(function() {
                top.document.title = $(this).text() + " - 管理后台 v2.0";
            });
        });
        </script>
       </body> 
</html> 
