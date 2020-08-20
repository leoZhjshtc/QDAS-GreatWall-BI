<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base/meta.jsp"%>
<html>
  <head>
  <title>质量看板</title>
  <link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" type="image/x-icon">
  <link href="<%=basePath %>resources/blueThemes/css/bi.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=basePath%>resources/js/loading.js"></script>
  	<script type="text/javascript">
		/* var productLineRealTimeInterval;
		var teilRealTimeInterval;
		var merkmalRealTimeInterval; */
		var searchRows=false;
		var startTime,endTime;
		var ifShowNoneDataIndex=0;
  		$(function(){
  			$('#qbAcc').accordion({
  				multiple:false,
  				fit:true,
			    animate:false,
			    onSelect:function(title,index){
			    	/* if(index==1){
			    		teilRealTimeInterval=setInterval(qbTeilRealTime, 10000);
			    	}else if(index==0){
			    		productLineRealTimeInterval=setInterval(qbProductLineRealTime, 10000);
			    	}else if(index==2){
			    		merkmalRealTimeInterval=setInterval(qbMerkmalRealTime, 10000);
			    	} */
			    },
			    onUnselect:function(title,index){
			    	/* if(index==1){
			    			clearInterval(teilRealTimeInterval);
			    	}else if(index==0){
			    		clearInterval(productLineRealTimeInterval);
			    	}else if(index==2){
			    		clearInterval(merkmalRealTimeInterval);
			    	} */
			    }
			});
			var now=new Date();
			var searchTime=now.getTime()-(7*86400000);
			var ago=new Date(searchTime);
			startTime=ago.getFullYear()+"-"+(ago.getMonth()+1)+"-"+ago.getDate()+" "+ago.getHours()+":"+ago.getMinutes()+":"+ago.getSeconds();
			endTime=now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
			$('#startTime').datetimebox('setValue',startTime);
			$('#endTime').datetimebox('setValue',endTime);
			$('#qbMainSearchBtn').click(function(){
				$('#plCenterbox').panel('refresh','<%=basePath%>qb/getProductLineData?startTime='+$('#startTime').datetimebox('getValue')+'&endTime='+$('#endTime').datetimebox('getValue')+'&ifShowNoneDataIndex='+ifShowNoneDataIndex+'&productLineName='+$('#searchPlName').textbox('getValue'));
			})
			
			$('#plCenterbox').panel({
				href:'<%=basePath%>qb/getProductLineData?startTime='+startTime+'&endTime='+endTime+'&ifShowNoneDataIndex='+ifShowNoneDataIndex
			});
			$('#qbDig').dialog({
				title:'质量看板',
				height:$(window).height()-100,
   				width:$(window).width()-100,
				resizable:true,
				maximizable:true,
				modal:true,
				closed:true,
				onClose:function(){
					 clearInterval(auto);
					/*var p = $('#qbAcc').accordion('getSelected');
					if (p){
						var index = $('#qbAcc').accordion('getPanelIndex', p);
						if(index==1){
				    		teilRealTimeInterval=setInterval(qbTeilRealTime, 10000);
				    	}else if(index==0){
				    		productLineRealTimeInterval=setInterval(qbProductLineRealTime, 10000);
				    	}else if(index==2){
				    		merkmalRealTimeInterval=setInterval(qbMerkmalRealTime, 10000);
				    	}
					} */
				},
				onBeforeOpen:function(){
			    	/* clearInterval(teilRealTimeInterval);
			    	clearInterval(productLineRealTimeInterval);
			    	clearInterval(merkmalRealTimeInterval); */
				}
			})
			$('#openQb').click(function(){
				$('#qbDig').panel({
							href:'<%=basePath%>qb/initQbShow?index='+'1'
						});
				$('#qbDig').dialog('open');
			});
			 $('#SearchRowsBt').switchbutton({
		            checked: false,
		            disabled:true,
		            onText:'显示所有数据',
		            offText:'显示125条数据',
		            onChange: function(checked){
		           	 $('#cpkText').html("");
		               searchRows=checked;
		                $('#merkmalCenterbox').panel('refresh','<%=basePath%>qb/initMerkmalData?teilId='+$('#teilIdVal').val()+'&searchRowsFlag='+searchRows+'&startTime='+$('#startTime').datetimebox('getValue')+'&endTime'+$('#endTime').datetimebox('getValue')+'&ifShowNoneDataIndex='+ifShowNoneDataIndex);
		            }
		        })
		        <%-- $('#openQdasCharts').click(function(){
				 	$('#qdasWin').dialog('open');
					$('#qdasWin').panel({
									href:'<%=basePath%>qb/initQdasCharts?teilId='+teilId+'&merkmalId='+merkmalId
								});
								
					if($('#openQdasCharts').linkbutton('options').disabled==true){
						return false;
					}else{
						$.messager.progress();
						$.ajax({
							type:'post',
							data:{
								teilId:teilId,
								merkmalId:merkmalId,
								searchRowsFlag:searchRows
							},
							url:'<%=basePath%>qb/getQdasV11Cpk',
							success:function(data){
								if(data.error==1){
									$('#cpkText').html("获取数据出错！！！");
								}else{
									$('#cpkText').html("Cp="+data.cp.value+"   cpk="+data.cpk.value);
								}
								$.messager.progress('close');
							}
						})
					}
				 }) --%>
	     })   
	        
		function qbProductLineRealTime(){
			productLineRealTime();
		}
		function qbTeilRealTime(){
			teilRealTime();
		}
		function qbMerkmalRealTime(){
			merkmalRealTime();
		}
		 function logout(){
			$.messager.confirm('提示信息', '确定登出用户？', function(r){
				if (r){
					window.location.href='<%=basePath%>main/logout';
				}
			});
		}
		function ifShowNoneData(aa){
			if(aa){
				ifShowNoneDataIndex=1;
			}else{
				ifShowNoneDataIndex=0;
			}
			$('#plCenterbox').panel({
				href:'<%=basePath%>qb/getProductLineData?startTime='+$('#startTime').datetimebox('getValue')+'&endTime='+$('#endTime').datetimebox('getValue')+'&ifShowNoneDataIndex='+ifShowNoneDataIndex+'&productLineName='+$('#searchPlName').textbox('getValue')
			});
		}
  	</script>
  </head>
  
<body>
	<div class="easyui-layout" fit="true" style="width: 100%;height: 100%">
		<div data-options="region:'north',split:false,collapsible:false,border:false" style="background-color: #2dc3e8;height: 60px;overflow: hidden;" >
			<div style="float: left;margin-left: 20px;height: 100%"><small> <img src="<%=basePath%>resources/images/qdas-logo.png" alt="" /></small></div>
			<div style="position: absolute;left: 50%"><small> <img src="<%=basePath%>resources/images/greatWallLogo.jpg" alt="" style="width: 300px;height: 55px" /></small></div>
			<div class="user">
				<span>${user.userName }</span>
				<i><a onclick="logout()" style="cursor:pointer">退出登录</a></i>
			</div>   
			
		</div>
	    <div data-options="region:'center',border:false" style="overflow: hidden;">
	    	<div id="qbAcc" style="width:100%;height:100%;">
		        <div id="plAcc" title="产线" style="overflow:auto;">
		        	<div class="easyui-layout" fit="true" style="width: 100%;height: 100%">
		        		<div data-options="region:'north',split:false,collapsible:false" style="height:42px;background:#eee;padding: 5px;overflow: hidden">
		        			<div style="float: left">
		        				开始时间：<input class="easyui-datetimebox" id="startTime" name="startTime"  data-options="editable:false" style="width:150px">
		        				结束时间：<input class="easyui-datetimebox" id="endTime" name="endTime"  data-options="editable:false" style="width:150px">
								产线：<input id="searchPlName" class="easyui-textbox" data-options="" style="width:100px">
								<a id="qbMainSearchBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
							    <input class="easyui-checkbox" label="无数据项:" labelWidth="75px" style="margin-left: 5px" data-options="onChange:function(checked){ifShowNoneData(checked);}">
		        			</div>
			        			<a id="openQb" class="easyui-linkbutton c3" data-options="iconCls:'icon-kanbanicon'" style="float: right">打开轮播看板</a>
		        		</div>
						<div id="plCenterbox" data-options="region:'center'"> </div>
		        	</div> 
		        </div>
		        <div title="零件" style="padding:0px;">
		        	<div class="easyui-layout" fit="true" style="width: 100%;height: 100%">
		        		<div data-options="region:'north',split:false,collapsible:false" style="height:42px;background:#eee;padding: 5px">
							零件号：<input id="teilNum" name="teilNum" class="easyui-textbox" data-options="" style="width:200px">
							部门：<input id="teilName" name="teilName" class="easyui-textbox" data-options="" style="width:200px">
							<a id="teilSearchbtn" class="easyui-linkbutton" data-options="iconCls:'icon-search',disabled:true" onclick="searchTeil();">查询</a>
							<a id="openTeilQb" class="easyui-linkbutton c3" data-options="iconCls:'icon-kanbanicon',disabled:true" style="float: right">打开轮播看板</a>
						</div>
						<div id="teilAcc" data-options="region:'center'"></div>
		        	</div>
		        </div>
		        <div id="merkmalAcc" title="测量参数">
		        	<div class="easyui-layout" fit="true" style="width: 100%;height: 100%">
		        		<div data-options="region:'north',split:false,collapsible:false" style="height:42px;background:#eee;padding: 5px;overflow: hidden;">
		        			参数名：<input id="merkmalName" name="merkmalName" class="easyui-textbox" data-options="" style="width:200px">
							<a id="merkmalSearchbtn" class="easyui-linkbutton" data-options="iconCls:'icon-search',disabled:true">查询</a>
							<input id="SearchRowsBt" style="width:200px;height:30px">
							<!-- <span id="cpkText" style="line-height: 20px;position: absolute;left: 50%;top: 10px;font-size:20px;font-weight:bold;"></span> -->
							<a id="showDetailsBtn" class="easyui-linkbutton c4" data-options="iconCls:'icon-search',disabled:true" style="float: right;">查看详情</a>
							<a id="openMerkmalQb" class="easyui-linkbutton c3" data-options="iconCls:'icon-kanbanicon',disabled:true" style="float: right;margin-right: 10px">打开轮播看板</a>
							<!-- <a id="openQdasCharts" class="easyui-linkbutton c3" data-options="iconCls:'icon-jisuanqi',disabled:true" style="float: right;margin-right: 10px">计算CPK值</a> -->
						</div>
						<div id="merkmalCenterbox" data-options="region:'center'"></div>
		        	</div>
		        </div>
		    </div>
	    </div>
	</div>
	<div id="qbDig" ></div>
</body>
</html>