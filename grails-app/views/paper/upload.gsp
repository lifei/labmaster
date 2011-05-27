<%@ page import="labmaster.paper.Paper"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<g:set var="entityName"
		value="${message(code: 'paper.label', default: 'Paper')}" />
	<title><g:message code="default.create.label"
			args="[entityName]" />
	</title>
	<sfu:generateConfiguration fileSize="30" cssClass="filename"
		form="bookForm" buttonImageFile="default_button.png" fileTypes="*.pdf"
		buttonWidth="60" buttonHeight="22" />
	<style>
	.filename {
		border: 2px solid #CC0000;
		height:14px;
		width:200px;
	}
	</style>
</head>
<body>
	<div class="nav">
		<span class="menuButton">
			<a class="home"	href="${createLink(uri: '/')}">
				<g:message code="default.home.label" />
			</a>
		</span> 
		<span class="menuButton">
			<g:link class="list" action="list">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link>
		</span>
	</div>
	<div class="body">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${paperInstance}">
			<div class="errors">
				<g:renderErrors bean="${paperInstance}" as="list" />
			</div>
		</g:hasErrors>
		<form id="bookForm" name="bookForm"
			action="${createLink(action:'uploadpost')}"
			onsubmit="$('#filename').val($('#swfupload_text').val());return sfuSubmitForm(this);">
			<sfu:fileUploadControl />
			<sfu:fileUploadProgressBar />
			<input type="hidden" name="filename" id="filename" />
			<input type="hidden" name="id" id="id" value="${params.id }" /> <input
				type="submit" value="Save">
		</form>
	</div>
</body>
</html>
