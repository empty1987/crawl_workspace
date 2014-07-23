<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fn.tld" prefix="fn"%>
<!doctype html>
<html>
	<head>
		<title>Crawl</title>
		<%@ include file="/common2.jsp"%>
		<style type="text/css">
<
style scoped>#basic-modal-content {
	width: 510px;
	height: 323px;
	margin: 30px auto;
	padding: 10px 20px 20px 170px;
	background:
		url('${pageContext.request.contextPath}/ui/kendoui/examples/web/content/validator/ticketsOnline.png')
		transparent no-repeat 0 0;
}

#basic-modal-content h3 {
	font-weight: normal;
	font-size: 1.4em;
	border-bottom: 1px solid #ccc;
}

#basic-modal-content ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#basic-modal-content li {
	margin: 10px 0 0 0;
}

label {
	display: inline-block;
	width: 90px;
	text-align: right;
}

.required {
	font-weight: bold;
}

.accept,.status {
	padding-left: 90px;
}

.valid {
	color: green;
}

.invalid {
	color: red;
}
</style>
		</style>
	</head>
	<body style="font-size: 1em;">
		<form
			action=" ${pageContext.request.contextPath}/sys/actions/sys-users!list.action "
			method="post" name="form1" id="form1">
			<div id="site_content_kendoui">
				<h1 id="exampleTitle" class="k-content">
					<span class="exampleIcon gridIcon"></span> 用户管理
				</h1>
				<div id="content_kendoui">
					<div id="example" class="k-content">
						<div>
							<table>
								<tbody>
									<tr>
										<td>
											<label class="loginlabel" for="user_name">
												用戶名称:
											</label>
											<input class="logininput" name="username" type="text"
												value="${sysUsers.username}" />

										</td>
										<td align="center">
											&nbsp;&nbsp;&nbsp;
											<label class="loginlabel" for="user_name">
												添加时间:
											</label>
											<input name="addtime_start" type="text" readonly="readonly"
												size="20" style="width: 160px;" class="logininput"
												onfocus="WdatePicker({isShowWeek:true , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												value="${sysUsers.addtime_start}">
											--
											<input name="addtime_end" type="text" readonly="readonly"
												size="20" class="logininput" style="width: 160px;"
												onfocus="WdatePicker({isShowWeek:true , dateFmt:'yyyy-MM-dd HH:mm:ss'});"
												value="${sysUsers.addtime_end}">
										</td>
										<td style="padding-bottom: 10px;">
											<input type="button" class="k-button" onclick="sbt();"
												style="padding: 5px;" value="查 询" />

											<input type="button" class="k-button" onclick="add();"
												style="padding: 5px;" value="新 增" />
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
										<font size="2">用户名称</font>
									</th>
									<th data-field="rating">
										<font size="2">角色</font>
									</th>
									<th data-field="title1">
										<font size="2">状态</font>
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
											<font size="2">${temp.username }</font>
										</td>
										<td>
											${temp.role}
											<c:if test="${temp.role eq '1'}">
											管理员
										</c:if>
											<c:if test="${temp.role eq '2'}">
											普通用户
										</c:if>
										</td>
										<td>
											<c:if test="${temp.flag eq '1'}">
												有效
											</c:if>
											<c:if test="${temp.flag eq '2'}">
												失效
										 	</c:if>
										</td>
										<td>
											<font size="2">${fn:substring(temp.addtime, 0, 19)}</font>
										</td>
										<td>
											<font size="2"> <img alt="删除用户"
													src="${pageContext.request.contextPath}/ui/button/images/icons/delete.gif"
													onclick="deleteUser(${temp.id})" title="删除用户"
													style="cursor: hand;"> <img alt="修改用户"
													src="${pageContext.request.contextPath}/ui/button/images/icons/edit.png"
													onclick="editeUser(${temp.id})" title="修改用户"
													style="cursor: hand;">
										</td>
									</tr>


								</c:forEach>

							</tbody>
						</table>

					</div>
				</div>
		</form>
		<div style="float: right;">
			${pageUrl}
		</div>
		<div id="basic-modal-content" style="display: none;">
			<form id="form2" method="post" action="">
				<input type="hidden" name="id" id="id" value="">
				<h3 id="title">
					新增用户
				</h3>
				<ul>
					<li>
						<label class="loginlabel" for="user_name">
							用户名
						</label>
						<input class="logininput" name="username" id="username"
							type="text" style="width: 120px; height: 20px" dataType="Require"
							msg="请填写用户名" />
						&nbsp;
						<font color="red">*</font>
					</li>

					<li id="passwordli">
						<label class="loginlabel" for="user_name">
							密码
						</label>
						<input type="password" name="password" value="" id="password"
							style="width: 120px; height: 20px" dataType="Require" msg="请填写密码" />
						&nbsp;
						<font color="red">*</font>
					</li>
					<li id="tpasswordli">
						<label class="loginlabel" for="user_name">
							确认密码
						</label>
						<input type="password" name="repitpassword" id="repitpassword"
							value="" style="width: 120px; height: 20px" dataType="Repeat"
							to="password" msg="密码输入不一致" />
						&nbsp;
						<font color="red">*</font>
					</li>
					<li>
						<label class="loginlabel">
							角色
						</label>
						<select name="role" id="role" style="width: 120px;">
							<option value="1">
								管理员
							</option>
							<option value="2">
								普通用户
							</option>
						</select>
					</li>
					<li>
						<label class="loginlabel">
							状态
						</label>
						<select name="flag" id="flag" style="width: 120px;">
							<option value="1">
								有效
							</option>
							<option value="2">
								失效
							</option>
						</select>
					</li>
					<li class="accept">

						<input type="button" value="保 存" class="k-button" id="save"
							onclick="submitForm('/sys/actions/sys-users!addUsers.action','form2');"
							style="padding: 7px; display: none;" />
						<input type="button" value="修 改" class="k-button" id="edite"
							onclick="submitForm('/sys/actions/sys-users!editeUsers.action','form2');"
							style="padding: 7px; display: none;" />
						<input type="button" value="返 回" class="k-button"
							onclick="back();" style="padding: 7px;" />
					</li>
				</ul>

			</form>
		</div>
		<div style='display: none'>
			<img src='img/basic/x.png' alt='' />
		</div>
		</div>
		<script>
$(document).ready(function() {
	$("#grid").kendoGrid();
});
function sbt() {
	form1.submit();
}

function add() {
	$("#save").show();
	$("#edite").hide();
	$("#passwordli").show();
	$("#tpasswordli").show();
	$('#basic-modal-content').modal();
}
function deleteUser(id) {
	if (!window.confirm("确定要删除该用户？"))
		return;
	url = "${pageContext.request.contextPath}/sys/actions/sys-users!deleteUsers.action";
	var params = "id=" + id;
	$.getJSON(url, params, function(result) {
		window.location.reload();
	});
}
function editeUser(id) {
	$("#save").hide();
	$("#edite").show();
	$("#title").html("修改用户");
	$('#basic-modal-content').modal();
	url = "${pageContext.request.contextPath}/sys/actions/sys-users!getUsers.action";
	var params = "id=" + id;
	$.getJSON(url, params, function(result) {
		var model = result.model;
		$("#username").val(model.username);
		$("#role").val(model.role);
		$("#flag").val(model.role);
		$("#id").val(model.id);
		$("#password").val("1");
		$("#repitpassword").val("1");
		$("#passwordli").hide();
		$("#tpasswordli").hide();
	});
}
function back() {
	$.modal.close();
}
</script>
	</body>
</html>


