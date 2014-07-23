<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico" />
    <title>Crwal</title>
    <link href="${pageContext.request.contextPath}/css/loginCss/styles.css" type="text/css" media="screen" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/loginCss/jquery-ui-1.8.16.custom.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/loginJs/jquery-1.6.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/loginJs/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/loginJs/jquery.keyboard.extension-typing.js"></script>
    <link type="text/css" href="${pageContext.request.contextPath}/css/loginCss/keyboard.css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/loginJs/jquery.keyboard.js"></script>


    

</head>
<body id="login">
    <div id="wrappertop">
    </div>
    <div id="wrapper">
        <div id="content">
            <div id="header">
                <h1>
                       <img src="${pageContext.request.contextPath}/images/loginImage/logo.png"   height="50"  width="100"  alt="logo"/></h1>
            </div>
            <div id="darkbanner" class="banner320">
                <h2>
                    登录系统</h2>
            </div>
            <div id="darkbannerwrap">
            </div>
            <form id="form1" method="post" action="${pageContext.request.contextPath}/sys/actions/sys-users!frame.action">
            <fieldset class="form">
                <p>
                    <label class="loginlabel" for="user_name">
                        Username:</label>
                    <input class="logininput ui-keyboard-input ui-widget-content ui-corner-all" name="username"
                        id="username" type="text" value="" />
                </p>
                <p>
                    <label class="loginlabel" for="user_password">
                        Password:</label>
                    <span>
                        <input class="logininput"   name="password" id="password" type="password" /><img
                            id="passwd" class="tooltip" alt="Click to open the virtual keyboard" title="Click to open the virtual keyboard"
                            src="${pageContext.request.contextPath}/images/loginImage/keyboard.png" /></span>
                </p>
                <button id="loginbtn" type="submit" class="positive" name="Submit">
                    <img src="${pageContext.request.contextPath}/images/loginImage/key.png" alt="Announcement" />Login</button>
                <ul id="forgottenpassword">
                </ul>
            </fieldset>
           </form>
        </div>
    </div>
   
   
    <script type="text/javascript">
        $(document).ready(function() {
            $('#password').keyboard({
                openOn: null,
                stayOpen: true,
                layout: 'qwerty'
            }).addTyping();
            $('#passwd').click(function() {
                $('#password').getkeyboard().reveal();
            })

            $(".logininput").blur(function() {
                if ($(this).val() == "") {
                    $(this).css("border-color", "red");
                                    }
                else
                    $(this).css("border-color", "#D9D6C4");
            })

            $("#loginbtn").click(function() {
                var k = 0;
                var ajaxhtml = "";
                $(".logininput").each(function(i, obj) {
                    if ($(obj).val().trim() == "") {
                        k++;
                        $(this).css("border-color", "red");
                        $(this).focus();
                        return false;
                    }
                });
                if (k != 0) return;
                ajaxhtml = $("#loginbtn").html();
                $("#loginbtn").html("Loading....  <img src='${pageContext.request.contextPath}/images/loginImage/loading.gif' alt='Announcement' /> ");
                $("#loginbtn").attr("disabled", "disabled");
            })
        });
        
    </script>
</body>
</html>
