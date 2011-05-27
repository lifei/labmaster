<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Insert title here</title>
<sfu:generateConfiguration fileSize="30" form="bibtex"
	cssClass="filename" buttonImageFile="default_button.png"  fileTypes="*.bib"
	buttonWidth="80" buttonHeight="22" />
<style>
.filename {
	border: 2px solid #CC0000;
	height:14px;
}
</style>
</head>
<body>
	<div class="body">
		<form id="bibtex" name="bibtex"
			action="${createLink(action:'uploadbibtexpost')}"
			onsubmit="$('#filename').val($('#swfupload_text').val());return sfuSubmitForm(this);">
			<sfu:fileUploadControl />
			<sfu:fileUploadProgressBar />
			<input type="hidden" name="filename" id="filename" /> <input
				type="hidden" name="id" value="${params.id}" /> <input
				type="submit" value="Save">
		</form>
	</div>
</body>
</html>