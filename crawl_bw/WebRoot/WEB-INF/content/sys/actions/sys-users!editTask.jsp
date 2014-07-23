<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<!doctype html>
<html>
	<head>
		<title>Grid initialization from table element</title>
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/examples/shared/styles/examples.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.common.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.default.css"
			rel="stylesheet" />

		<link
			href="${pageContext.request.contextPath}/ui/kendoui/examples/shared/styles/examples.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/examples/shared/styles/examples-offline.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/examples/source/styles/kendo.common.css"
			rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.default.css"
			rel="stylesheet" />
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/jquery.min.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.core.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.validator.js">
</script>
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
</style>
	</head>
	<body style="font-size: 1em;">
		<br />

		<div id="example" class="k-content">
			<div id="tickets">
				<h3>
					修改任务${task.tname}
				</h3>
				<input type="hidden" id="id" value="${task.id}" name="id">
				<ul>
					<li>
						<label for="tname" class="required">
							任务名
						</label>
						<input type="text" id="tname" name="tname" class="k-textbox"
							placeholder="任务名称" required validationMessage="Please enter {0}!"
							value="${task.tname }" />
					</li>
					<li>
						<li>
							<label for="URL" class="required">
								URL
							</label>
							<input type="text" id="url" name="url" required
								validationMessage="Please enter {0}" value="${task.url }" />
							<span class="k-invalid-msg"></span>
						</li>
						<li>
							<label for="cookie" class="required">
								cookie
							</label>
							<textarea rows="5" cols="40" id="ucookies">${task.ucookies}</textarea>
						</li>
						<li>
							<label class="required">
								网站类型
							</label>
							<select name="webtype" id="webtype"
								style="width: 100px; height: 20px">
								<c:if test="${task.webtype == 1 }">
									<option value="1" selected>
										论坛
									</option>
									<option value="2">
										人才网
									</option>
								</c:if>

								<c:if test="${task.webtype == 2 }">
									<option value="1">
										论坛
									</option>
									<option value="2" selected>
										人才网
									</option>
								</c:if>
							</select>
						</li>

						<li class="accept">
							<button class="k-button" onclick="edit();" type="submit">
								Submit
							</button>
						</li>
						<li class="status"></li>
				</ul>
			</div>
			<style scoped>
.k-textbox {
	width: 11.8em;
}

#tickets {
	width: 510px;
	height: 323px;
	margin: 30px auto;
	padding: 10px 20px 20px 170px;
	background: url('../../content/web/validator/ticketsOnline.png')
		transparent no-repeat 0 0;
}

#tickets h3 {
	font-weight: normal;
	font-size: 1.4em;
	border-bottom: 1px solid #ccc;
}

#tickets ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#tickets li {
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
			<script>

$(document)
		.ready(
				function() {
					var validator = $("#tickets").kendoValidator().data(
							"kendoValidator"), status = $(".status");
					$("button")
							.click(
									function() {

										if (validator.validate()) {
											var url = "${pageContext.request.contextPath}/sys/actions/sys-users!editTask2.action";

											var data = "id="
													+ $("#id").val()
													+ "&tname="
													+ encodeURI($("#tname")
															.val()) + "&url="
													+ $("#url").val()
													+ "&webtype="
													+ $("#webtype").val();
											var ucookies = $("#ucookies").val();
											if (ucookies != '') {
												data = "&ucookies=" + ucookies;
											}
											$
													.getJSON(
															url,
															data,
															function(json) {
																if (json.tips = "success") {
																	alert("修改成功！");

																}
																window.location.href = "${pageContext.request.contextPath}/sys/actions/sys-users!taskList.action";
															});
										} else {
											status
													.text(
															"Oops! There is invalid data in the form.")
													.addClass("invalid");
										}
									});
				}

		);
</script>
		</div>
	</body>
</html>


