
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fn.tld" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk"></meta>
		<title>Crawl</title>

		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/forum/style_7_common.css"></link>
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/forum/style_7_forum_forumdisplay.css"></link>
		<%--		<script src="">--%>
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
		<%--</script>--%>

	</head>
	<body id="nv_forum" style="width: 100%">
		<div class="tl bm bmw">
			<div class="th">
				<table cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<th colspan="2">
								标题
							</th>
							<td class="by">
								作者
							</td>
							<td class="num">
								回复/查看
							</td>
							<td class="by">
								最后发表时间
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<div id="forumnew" style="display: none"></div>
				<form method="post" name="moderate" id="moderate"
					action="forum.php?mod=topicadmin&amp;action=moderate&amp;fid=2&amp;infloat=yes&amp;nopost=yes">
					<table summary="forum_2" cellpadding="0" cellspacing="0">
						<c:forEach items="${page.result}" var="temp">
							<tbody id="normalthread_${temp.id}">
								<tr>
									<td class="icn">
										<img
											src="${pageContext.request.contextPath}/images/folder_common.gif">
										</img>
									</td>
									<th class="common">
										<a href="#" onclick="showDetail(${temp.tid});" title="查看详细">${temp.title}</a>
									</th>
									<td class="by">
										<cite> <a
											href="${temp.url }">${temp.username}</a>
										</cite>
										<em><span class="xi1">${fn:substring(temp.dateline,
												0, 10)}</span> </em>
									</td>
									<td class="num">
										${temp.replies}
										<em>${temp.views}</em>
									</td>
									<td class="by">
										<em>${fn:substring(temp.lastpost, 0, 9)}</em>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</form>
			</div>

		</div>
		<div style="float: right;">
			${pageUrl}
		</div>
		<script type="text/javascript">
			function showDetail(tid){
				window.location.href="${pageContext.request.contextPath}/post/actions/posts!list.action?tid="+tid;
			}
		</script>
	</body>


</html>
