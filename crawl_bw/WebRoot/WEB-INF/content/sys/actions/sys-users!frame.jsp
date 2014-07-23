<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Crawl</title>
	</head>




	<frameset id="xxframe" rows="*,150" cols="*" frameborder="NO" border="0"
		framespacing="0">
		<frame
			src="${pageContext.request.contextPath}/sys/actions/sys-users!index.action"
			name="indexFrame"  style="scrolling-x:NO;scrolling-y:YES"  noresize framespacing="0"
			frameborder="0" marginheight="0" marginwidth="0"/>
		<frame
			src="${pageContext.request.contextPath}/sys/actions/sys-users!foot.action"
			name="footFrame" scrolling="NO" noresize frameborder="0"
			marginheight="0" marginwidth="0"/>
	</frameset>
</html>
