
<%@ page import="labmaster.paper.PaperCategory" %>
<%@ page import="labmaster.paper.Paper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'paperCategory.label', default: 'PaperCategory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css/papercategory',file:'index.css')}" />
    </head>
    <body>
        <div id="wrapper">
            <div id="main" class="main">
					<g:each in="${paperCategoryInstanceList}" status="i"
							var="paperCategoryInstance">
						<div class="cat bai">
							<div class="rc1 rgg_1"></div>
							<div class="rc2 rgg_2"></div>
							<div class="rc3 rgg_3"></div>
							<div class="rc rgg">
								<h2>
								<g:link action="show" id="${paperCategoryInstance.id}">
									${fieldValue(bean: paperCategoryInstance, field: "name")}
								</g:link>
							</h2>
							<div class="bc0">
								<table id="classList" cellpadding="0" cellspacing="0"
									width="100%">
									<tbody>
										<tr>
											<% def j = 0 %>
											<g:showSubCategory id="${paperCategoryInstance.id}">
												<td width="33%"><g:link action="show"
														id="${category.id}">
														${fieldValue(bean: category, field: "name")}
													</g:link></td>
												<% if(++j % 3 == 0) print '</tr><tr>' %>
											</g:showSubCategory>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</g:each>
        </div>
		<div id="aside" class="aside">
			<div class="upbox">
				<div class="content">
					<div class="upload" id="upload"></div>
				</div>
			</div>
			<div class="bbox box">
				<div class="content">
					<h2>
						<span class="icon daren_icon"></span>
						<a target="_top">评分最高的文献</a>
					</h2>
					<table class="reward" id="classDaren" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<th width="20"></th>
								<th width="124">标题</th>
								<th class="c">人数</th>
								<th class="c">平均</th>
							</tr>
							<%
							Paper.listOrderByAverageRating([max:10]).each { Paper paper-> %>
								<tr>
								<td width="20"><span class="icon num1"></span>
								</td>
								<td class="un" nowrap="nowrap" width="100">
									<g:link class="Author" target="_top" action="show" controller="paper">${paper.title}</g:link>
								</td>
								<td class="score c" width="60">${paper.totalRatings}</td>
								<td class="score c" width="60">${paper.averageRating}</td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div> <!-- end of bbox box -->
			<div class="bbox box">
				<div class="content">
					<h2>
						<span class="icon mingren_icon"></span> 
						<a  target="_top">阅读文献最多的人</a>
					</h2>
					<table class="reward" id="classMingren" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<th width="20"></th>
								<th width="124">用户名</th>
								<th class="c">文档数</th>
							</tr>
							<tr>
								<td width="20"><span class="icon num1"></span>
								</td>
								<td class="un" nowrap="nowrap" width="100"><div>
										<a
											href="http://passport.baidu.com/?business&amp;aid=6&amp;un=%D6%D0%B9%CB%B7%A8%C2%C9%CD%F8%B9%CB%CE%CA#7"
											class="Author" target="_top">中顾法律网顾问</a>
									</div>
								</td>
								<td class="score c" width="60">31060</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div> <!-- end of bbox box -->
		</div> <!-- end of aside -->
		</div>
	</body>
</html>
