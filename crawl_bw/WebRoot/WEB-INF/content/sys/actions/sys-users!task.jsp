<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fn.tld" prefix="fn"%>
<!doctype html>
<html>
	<head>
		<title>Crawl</title>
		<link type='text/css'
			href="${pageContext.request.contextPath}/ui/kendoui/examples/shared/styles/examples.css"
			rel="stylesheet" />
		<link type='text/css'
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.common.css"
			rel="stylesheet" />
		<link type='text/css'
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.default.css"
			rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/css/index/list.css"	rel="stylesheet" type='text/css' />
			
			
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/jquery.min.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.core.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.data.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.grid.js">
</script>
		<script language="javascript"
			src="${pageContext.request.contextPath}/ui/My97DatePicker/WdatePicker.js">
</script>


		<!-- Load jQuery, SimpleModal and Basic JS files -->
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/ui/simplemodal/basic/js/jquery.simplemodal.js'>
</script>
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/ui/simplemodal/basic/js/basic.js'>
</script>
		<!-- Page styles -->
		<link type='text/css'
			href='${pageContext.request.contextPath}/ui/simplemodal/basic/css/demo.css'
			rel='stylesheet' media='screen' />

		<!-- Contact Form CSS files -->
		<link type='text/css'
			href='${pageContext.request.contextPath}/ui/simplemodal/basic/css/basic.css'
			rel='stylesheet' media='screen' />


		<style type="text/css">
#site_content_kendoui {
	width: 95%;
	overflow: hidden;
	margin: 0 auto 0 auto;
	padding: 0 20px 20px 40px;
	background: #FFF;
	border-left: 1px solid #ECECE0;
	border-right: 1px solid #ECECE0;
}

#content_kendoui {
	text-align: left;
	padding: 0;
}

body {
	font: normal .80em 'trebuchet ms', arial, sans-serif;
	background: #F4F4EE;
	color: #5D5D5D;
}

.logininput {
	height: 15px;
	width: 100px;
	_width: 237px;
	margin-bottom: 15px;
	padding: 3px;
	font: 16px 'Lucida Grande', arial, sans-serif;
}
</style>
	</head>
	<body style="font-size: 1em;">
		<br />

		<div id="site_content_kendoui">
			<h1 id="exampleTitle" class="k-content">
				<span class="exampleIcon gridIcon"></span> 系统任务设置
			</h1>
			<div id="content_kendoui">
				<div id="example" class="k-content">
					<div>

						<table>
							<tbody>
								<tr>
									<td>
										<label class="loginlabel" for="user_name">
											网站名称:
										</label>
										<input class="logininput" name="tname" id="tname" type="text"
											value="${task.tname}" />

									</td>
									<td align="center">
										&nbsp;&nbsp;&nbsp;
										<label class="loginlabel" for="user_name">
											添加时间:
										</label>
										<input name="addtime_start" type="text" readonly="readonly"
											id="addtime_start" size="20" style="width: 160px;"
											class="logininput"
											onfocus="WdatePicker({isShowWeek:true , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
											value="${task.addtime_start}">
										--
										<input name="addtime_end" type="text" readonly="readonly"
											id="addtime_end" size="20" class="logininput"
											style="width: 160px;"
											onfocus="WdatePicker({isShowWeek:true , dateFmt:'yyyy-MM-dd HH:mm:ss'});"
											value="${task.addtime_end}">
									</td>
									<td style="padding-bottom: 10px;">
										<button class="k-button" onclick="sbt();"
											style="padding: 5px;">
											查询
										</button>
										<button class="k-button" onclick="add();"
											style="padding: 5px;">
											新增
										</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br />
					<table id="grid">
						<thead>

							<tr>
								<th data-field="rank">
									<font size="2">网站名称</font>
								</th>
								<th data-field="rating">
									<font size="2">URL</font>
								</th>
								<th data-field="title">
									<font size="2">网站类型</font>
								</th>
								<th data-field="title">
									<font size="2">添加时间</font>
								</th>
								<th data-field="year">
									<font size="2">操作</font>
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.result}" var="temp">
								<tr>
									<td>
										<font size="2">${temp.tname }</font>
									</td>
									<td>
										<font size="2">${temp.url }</font>
									</td>
									<td>
										<font size="2">${temp.webtype}</font>
									</td>
									<td>
										<font size="2">${fn:substring(temp.addtime, 0, 19)}</font>
									</td>
									<td>
										<font size="2"> <a href="#"
											onclick="deleteTask(${temp.id});"> 删除 </a> | <a href="#"
											onclick="editTask(${temp.id});"> 修改 </a> | <a href="#"
											onclick="viewTask(${temp.id});"> 查看 </a> </font>
									</td>
								</tr>


							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
			<div style="float: right;">
				${pageUrl}
			</div>
			<div id="basic-modal-content" style="display: none;">

				<p>
					新增任务
				</p>
				<hr>
				<p>
					<label class="loginlabel" for="user_name">
						网站名称:
					</label>
					<input class="logininput" name="tnameSave" id="tnameSave"
						type="text" width="260px;" />

				</p>
				<p>
					<label class="loginlabel" for="user_name">
						网站地址:
					</label>
					<input class="logininput" name="urlSave" id="urlSave" type="text"
						width="260px;" />
				</p>
				<p>
					<label class="loginlabel" for="user_name">
						cookies:
					</label>
					<textarea rows="3" cols="40" id="ucookiesSave">${task.ucookies}</textarea>
				</p>
				<p>
					<label class="required">
						网站类型
					</label>
					<select name="webtype" id="webtypeSave"
						style="width: 100px; height: 20px">
						<option value="1">
							论坛
						</option>
						<option value="2">
							人才网
						</option>
					</select>
				</p>

				<p align="center">
					<button class="k-button" onclick="save();" style="padding: 7px;">
						保存
					</button>
					<button class="k-button" onclick="back();" style="padding: 7px;">
						返回
					</button>
				</p>
			</div>
			<!-- preload the images -->
			<div style='display: none'>
				<img src='img/basic/x.png' alt='' />
			</div>
		</div>
		<script>
$(document).ready(function() {
	$("#grid").kendoGrid();
});
function deleteTask(id) {
	if (!confirm("确定删除此项？")) {
		return false;
	}
	url = "${pageContext.request.contextPath}/sys/actions/sys-users!deleteTask.action";
	param = "id=" + id;
	$.getJSON(url, param, function(json) {
		var tips = "success";
		if (tips == json.tips) {
			alert("删除成功！！！");
		}
		;
	});
	window.location.reload();
}
function editTask(id) {
	window.location.href = "${pageContext.request.contextPath}/sys/actions/sys-users!editTask.action?id="
			+ id;
};
function viewTask(id) {
	window.location.href = "${pageContext.request.contextPath}/sys/actions/sys-users!showTask.action?id="
			+ id;
}

function sbt() {

	var addtime_start = $("#addtime_start").val();
	var addtime_end = $("#addtime_end").val();
	if (addtime_end < addtime_start) {
		alert("时间段选择错误,请重新选择！");
		$("#addtime_end").val("");
	}
	var tname = encodeURI($("#tname").val());
	var url = "${pageContext.request.contextPath}/sys/actions/sys-users!taskList.action?tname="
			+ tname
			+ "&addtime_start="
			+ addtime_start
			+ "&addtime_end="
			+ addtime_end;
	window.location = url;

}
function add() {
	$('#basic-modal-content').modal();
}
function back() {
	$.modal.close();
}
function save() {
	var tname = encodeURI($("#tnameSave").val());
	var urlSave = encodeURI($("#urlSave").val());
	var ucookiesSave = encodeURI($("#ucookiesSave").val());
	var webtypeSave = $("#webtypeSave").val();
	var data = "tname=" + tname + "&url=" + urlSave + "&webtype=" + webtypeSave
			+ "&ucookies=" + ucookiesSave;
	var url = "${pageContext.request.contextPath}/sys/actions/sys-users!addTask.action";
	$
			.getJSON(
					url,
					data,
					function(result) {
						alert("添加成功！");
						$.modal.close();
						window.location = "${pageContext.request.contextPath}/sys/actions/sys-users!taskList.action";
					});

}
</script>
	</body>
</html>


