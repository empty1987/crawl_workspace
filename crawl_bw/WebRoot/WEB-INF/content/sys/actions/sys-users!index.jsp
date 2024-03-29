<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<link
			href="${pageContext.request.contextPath}/ui/ligerUI/lib/ligerUI/skins/Aqua/css/ligerui-all.css"
			rel="stylesheet" type="text/css" />
		<script
			src="${pageContext.request.contextPath}/ui/ligerUI/lib/jquery/jquery-1.3.2.min.js"
			type="text/javascript">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/ligerUI/lib/ligerUI/js/core/base.js"
			type="text/javascript">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/ligerUI/lib/ligerUI/js/plugins/ligerDrag.js"
			type="text/javascript">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/ligerUI/lib/ligerUI/js/plugins/ligerDialog.js"
			type="text/javascript">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/ligerUI/lib/ligerUI/js/plugins/ligerResizable.js"
			type="text/javascript">
</script>
		<style type="text/css">
.l-case-title {
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 20px;
}

body,html {
	width: 100%;
	height: 100%;
}

* {
	margin: 0;
	padding: 0;
}

#winlinks {
	position: absolute;
	left: 20px;
	top: 20px;
	width: 100%;
}

#winlinks ul {
	position: relative;
}

#winlinks li {
	width: 70px;
	cursor: pointer;
	height: 80px;
	position: absolute;
	z-index: 101;
	list-style: none;
	text-align: center;
}

#winlinks li img {
	width: 36px;
	height: 36px;
}

#winlinks li span {
	background: none repeat scroll 0 0 rgba(0, 0, 0, 0.3);
	border-radius: 10px 10px 10px 10px;
	display: block;
	font-size: 12px;
	margin-top: 1px;
	color: White;
	line-height: 18px;
	text-align: center;
}

#winlinks li.l-over div.bg {
	display: block;
}

#winlinks li div.bg {
	display: none;
	position: absolute;
	top: -2px;
	left: -2px;
	z-index: 0;
	width: 75px;
	height: 64px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background: #000;
	opacity: 0.1;
	filter: alpha(opacity =   10);
}

.l-taskbar-task-icon {
	top: 3px;
	left: 6px;
	background-image: none;
}

.l-taskbar-task-content {
	margin-left: 30px;
}

.l-taskbar-task-icon img {
	width: 22px;
	height: 22px;
}
</style>
	</head>
	<body
		style="overflow: hidden; background: url(${pageContext.request.contextPath}/ui/ligerUI/images/applebg.jpg) no-repeat  center center;">
		<div id="winlinks">
			<ul>
			</ul>
		</div>
	</body>
	<script type="text/javascript">
var LINKWIDTH = 90, LINKHEIGHT = 90, TASKBARHEIGHT = 43;
var winlinksul = $("#winlinks ul");
function f_open(url, title, icon) {
	var win = $.ligerDialog.open( {
		height : $(window).height() - TASKBARHEIGHT ,
		url : url,
		width : document.body.clientWidth,
		showMax : true,
		showToggle : true,
		showMin : true,
		isResize : true,
		modal : false,
		title : title,
		slide : false
	});
	var task = jQuery.ligerui.win.tasks[win.id];
	if (task) {
		$(".l-taskbar-task-icon:first", task)
				.html('<img src="' + icon + '" />');
	}
	return win;
}
var links = [
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/3DSMAX.png',
			title : '用户管理',
			url : '${pageContext.request.contextPath}/sys/actions/sys-users!list.action'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/3DSMAX.png',
			title : '任务管理',
			url : '${pageContext.request.contextPath}/sys/actions/sys-users!taskList.action'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/macStyle/example/images/icon-mail.png',
			title : '帖子列表',
			url : '${pageContext.request.contextPath}/thread/actions/threads!list.action'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Program Files Folder.png',
			title : '固定列',
			url : '../grid/frozen/frozengrid.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Program Files Folder.png',
			title : '可拖动',
			url : '../base/drag.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Alien Folder.png',
			title : '树',
			url : '../tree/draggable.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Xp-G5 006.png',
			title : '下拉框',
			url : '../comboBox/comboBoxGrid.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Xp-G5 006.png',
			title : '下拉框',
			url : '../comboBox/comboBoxGrid.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Alien Folder.png',
			title : 'layout',
			url : '../layout/layoutFullHeight.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Alien Folder.png',
			title : 'menu',
			url : '../menu/menubar.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/Xp-G5 006.png',
			title : 'tab',
			url : '../tab/tabHtml.htm'
		},
		{
			icon : '${pageContext.request.contextPath}/ui/ligerUI/images/3DSMAX.png',
			title : '分组',
			url : '../grid/groupable/checkbox.htm'
		} ];

function onResize() {
	var linksHeight = $(window).height() - TASKBARHEIGHT;
	var winlinks = $("#winlinks");
	winlinks.height(linksHeight);
	var colMaxNumber = parseInt(linksHeight / LINKHEIGHT);//一列最多显示几个快捷方式
	for ( var i = 0, l = links.length; i < l; i++) {
		var link = links[i];
		var jlink = $("li[linkindex=" + i + "]", winlinks);
		var top = (i % colMaxNumber) * LINKHEIGHT, left = parseInt(i
				/ colMaxNumber)
				* LINKWIDTH;
		if (isNaN(top) || isNaN(left))
			continue;
		jlink.css( {
			top : top,
			left : left
		});
	}

}
function linksInit() {
	for ( var i = 0, l = links.length; i < l; i++) {
		var link = links[i];
		var jlink;
		var jlink = $("<li></li>");
		jlink.attr("linkindex", i);
		jlink.append("<img src='" + link.icon + "' />");
		jlink.append("<span>" + link.title + "</span>");
		jlink.append("<div class='bg'></div>");
		jlink.hover(function() {
			$(this).addClass("l-over");
		}, function() {
			$(this).removeClass("l-over");
		}).click(function() {
			var linkindex = $(this).attr("linkindex");
			var link = links[linkindex];
			f_open(link.url, link.title, link.icon);
		});
		jlink.appendTo(winlinksul);
	}

}
$(window).resize(onResize);
$.ligerui.win.removeTaskbar = function() {
}; //不允许移除
$.ligerui.win.createTaskbar(); //页面加载时创建任务栏
linksInit();
onResize();
</script>
</html>
