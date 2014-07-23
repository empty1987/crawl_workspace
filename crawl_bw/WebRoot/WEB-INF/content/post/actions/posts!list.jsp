
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fn.tld" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk"></meta>
		<title>Crawl</title>
		<link href="${pageContext.request.contextPath}/css/post/default.css"
			rel="stylesheet" />
			<link href="${pageContext.request.contextPath}/css/index/list.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/examples/shared/styles/examples.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.common.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.default.css"
			rel="stylesheet" />
		<!-- Page styles -->
		<link type='text/css'
			href='${pageContext.request.contextPath}/ui/simplemodal/basic/css/demo.css'
			rel='stylesheet' media='screen' />

		<!-- Contact Form CSS files -->
		<link type='text/css'
			href='${pageContext.request.contextPath}/ui/simplemodal/basic/css/basic.css'
			rel='stylesheet' media='screen' />
	<script type="text/javascript">
		function  back(){
			window.location.href="${pageContext.request.contextPath}/thread/actions/threads!list.action";
		}
	</script>
	</head>
	<body>



	<div><a href="#" onclick="back();">《《返回</a></div>
		<div class="container">
			<c:forEach items="${page.result}" var="temp">
				<div class="navigation"
					style="background: url('${pageContext.request.contextPath}/images/post/holder.png') no-repeat;">
					<div class="title">
						<h1>
							${temp.username}
						</h1>
						- ${fn:substring(temp.dateline, 0, 16)} -
					</div>
					<a href="${temp.purl }" title="查看原网页">原网页</a>
					<div class="clearer">
						<span></span>
					</div>

				</div>
				<div class="holder_top"
					style="background: url('${pageContext.request.contextPath}/images/post/holder.png') no-repeat;">
				</div>

				<div class="holder"
					style="background: url('${pageContext.request.contextPath}/images/post/bgholder.jpg') repeat-y;padding: 0 32px;">
					<font size="4"> ${temp.messagenotag} </font>

				</div>

				<div class="footer"
					style="background: url(${pageContext.request.contextPath}/images/post/holder.png) no-repeat;background-position: left bottom;">
					<div class="left">
						&nbsp;
					</div>

					<div class="right">
						&nbsp;
					</div>
					<div class="clearer">
						&nbsp;
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="float: right;">
			${pageUrl}
		</div>
	</body>

</html>
