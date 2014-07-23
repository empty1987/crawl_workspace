<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Crawl</title>

<%--	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=PT+Sans:regular,bold&amp;v1" />--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ui/macStyle/example/css/example.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ui/macStyle/source/dock.css" />

	
	<script type="text/javascript">
		function showMail(){
			window.parent.indexFrame.location="${pageContext.request.contextPath}/thread/actions/threads!list.action";
		}
		function showTask(){
			window.parent.indexFrame.location="${pageContext.request.contextPath}/sys/actions/sys-users!taskList.action";
		}
	</script>
</head>
<body>
	<div class="wrapper">
		<div >
			<!-- Begin: CSS Dock Code -->
			<div class="dock">
				<ul>
					<li id="mail">
						<a href="#mail" onclick="showMail();">
							<em><span>帖子列表</span></em>
							<img src="${pageContext.request.contextPath}/ui/macStyle/example/images/icon-mail.png" alt="Mail" />
						</a>
					</li>
					<li id="ical">
						<a href="#ical">
							<em><span>iCal</span></em>
							<img src="${pageContext.request.contextPath}/ui/macStyle/example/images/icon-ical.png" alt="iCal" />
						</a>
					</li>
					<li id="addressbook">
						<a href="#addressbook">
							<em><span>Address Book</span></em>
							<img src="${pageContext.request.contextPath}/ui/macStyle/example/images/icon-addressbook.png" alt="Address Book" />
						</a>
					</li>
					<li id="iphoto">
						<a href="#iphoto">
							<em><span>iPhoto</span></em>
							<img src="${pageContext.request.contextPath}/ui/macStyle/example/images/icon-iphoto.png" alt="iPhoto" />
						</a>
					</li>
					<li id="idisk">
						<a href="#idisk" onclick="showTask();">
							<em><span>任务管理</span></em>
							<img src="${pageContext.request.contextPath}/ui/macStyle/example/images/icon-idisk.png" alt="iDisk" />
						</a>
					</li>
				</ul>
			</div>
			<!-- End: CSS Dock Code -->
		</div>
	</div>
</body>
</html>