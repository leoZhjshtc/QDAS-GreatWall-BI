<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="meta.jsp"%>
<head>
<title>bi Page</title>
<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" type="image/x-icon">
<link href="<%=basePath %>resources/blueThemes/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.cookie.js"></script>
<script language="javascript">
	$(function(){
		console.log($.cookie('userName'));console.log($.cookie('password'));
		savecookie();
	 $('#loginBtn').click(function(){
	   	 $.messager.progress();
			$('#loginForm').form('submit', {
				url: '<%=basePath%>main/doLogin',
				type:'post',
				onSubmit: function(){
					var isValid = $(this).form('validate');
					if (!isValid){
						$.messager.progress('close');
					}
					return isValid;
				},
				dataType:"json",
				success:function(data){
					var result=JSON.parse(data);
					if(result.message==0){
						if($('#ifSave').checkbox('options').checked){
							$.cookie('userName', $('#userAccount').val(), { expires: 7 });
							$.cookie('password', $('#password').val(), { expires: 7 });
						}else{
							$.removeCookie('userName');
							$.removeCookie('password');
						}
						window.location.href="<%=basePath%>main/mainPage";
					}else{
						$('#errorText').html(result.message);
					}
					$.messager.progress('close');
				}
			});
	    })
	    function savecookie(){
			if($.cookie('userName')!==''&$.cookie('userName')!=undefined){
				$('#userAccount').textbox('setValue',$.cookie('userName'));
			}
			if($.cookie('password')!==''&$.cookie('password')!=undefined){
				$('#password').textbox('setValue',$.cookie('password'));
			}
		}
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
	document.onkeydown=function(){
			if(window.event&&window.event.keyCode==13){
				 $('#loginBtn').click();
				return false;
			}
		}
</script> 

</head>

<body background="<%=basePath%>resources/blueThemes/images/mainbg.png" style=" background-repeat:no-repeat ; background-size:100% 100%;  background-attachment: fixed;">



<!-- <div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div> -->
    
    <div class="loginbody">
    
	    <span class="systemlogo"></span> 
	       
	    <div class="loginbox">
	    	<form id="loginForm" method="post">
	    		<ul>
				    <!-- <li><input id="userName" name="userName" type="text" class="loginuser" onclick="JavaScript:this.value=''"/></li>
				    <li><input id="password" name="password" type="password" class="loginpwd" onclick="JavaScript:this.value=''"/></li> -->
				    <li><input class="easyui-textbox" id="userAccount" name="userAccount" style="width:80%;height:50px;padding:10px" data-options="required:true,validType:{length:[1,20]},prompt:'Username',iconCls:'icon-man',iconWidth:38"></li>
				    <li><input class="easyui-textbox" id="password" name="password" type="password" style="width:80%;height:50px;padding:10px" data-options="required:true,validType:{length:[5,20]},prompt:'Password',iconCls:'icon-lock',iconWidth:38"></li>
				    <!-- <li><input id="loginBtn" name="" type="button" class="loginbtn" value="登录" /></li> -->
				    <li><a id="loginBtn" class="easyui-linkbutton c6" data-options="size:'large'" style="width:120px">登录</a>
						<input id="ifSave" class="easyui-checkbox" name="ifSave" label="保存密码"  checked="ture">
						<span><font id="errorText" size='5' color='red'></font></span>
					</li>
			    </ul>
	    	</form>
	    </div>
    </div>
    
    
    
    <div class="loginbm">版权所有  2019  <a href="http://www.q-das.cn">q-das.cn</a></div>
	
</body>

</html>
