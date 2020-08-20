<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base/meta.jsp"%>
<html>
  <head>
	
  </head>
  
  <body>
  					<div class="easyui-layout" fit="true" style="width: 100%;height: 100%">
						<div id="centerbox" data-options="region:'center'" style="padding:5px;background:#eee;">
							<c:forEach items="${paramMap.plList}" var="prodectLine">
								<c:choose>
									<c:when test="${prodectLine.qualityLevel==\"0\"}">
										<a id="${prodectLine.buttonId}" class="easyui-linkbutton c1" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" 
											onclick="getTeil('${prodectLine.buttonId}','${prodectLine.TEERZEUGNIS }','${prodectLine.TENRKURZ }');"><font size="5">${prodectLine.TEERZEUGNIS  }<br>${prodectLine.TENRKURZ }</font></a>
									</c:when>
									<c:when test="${prodectLine.qualityLevel==\"1\"}">
										<a id="${prodectLine.buttonId}" class="easyui-linkbutton c7" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" 
											onclick="getTeil('${prodectLine.buttonId}','${prodectLine.TEERZEUGNIS }','${prodectLine.TENRKURZ }');"><font size="5">${prodectLine.TEERZEUGNIS  }<br>${prodectLine.TENRKURZ }</font></a>
									</c:when>
									<c:when test="${prodectLine.qualityLevel==\"2\"}">
										<a id="${prodectLine.buttonId}" class="easyui-linkbutton c5" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" 
											onclick="getTeil('${prodectLine.buttonId}','${prodectLine.TEERZEUGNIS }','${prodectLine.TENRKURZ }');"><font size="5">${prodectLine.TEERZEUGNIS  }<br>${prodectLine.TENRKURZ }</font></a>
									</c:when>
									<c:when test="${prodectLine.qualityLevel==\"3\"}">
										<a id="${prodectLine.buttonId}" class="easyui-linkbutton c6" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" 
											onclick="getTeil('${prodectLine.buttonId}','${prodectLine.TEERZEUGNIS }','${prodectLine.TENRKURZ }');"><font size="5">${prodectLine.TEERZEUGNIS }<br>${prodectLine.TENRKURZ }</font></a>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
		        	</div>
	<script type="text/javascript">
	function getTeil(plId,plName,k1007){
  			$('#centerbox > a').linkbutton({
			    iconCls:''
			});
  			$('#'+plId).linkbutton({
			    iconCls: 'icon-large-gou'
			});
			$('#teilSearchbtn').linkbutton('enable');
			$('#openTeilQb').linkbutton('enable');
			//var searchProductLineTeilRealTime=searchTimeInterval($('#timecc').combobox('getValue'));
			$('#qbAcc').accordion('select',1); 
  			$('#teilAcc').panel('refresh','<%=basePath%>qb/initTeilData?productLineName='+plName+'&k1007Num='+k1007+'&startTime='+$('#startTime').datetimebox('getValue')+'&endTime'+$('#endTime').datetimebox('getValue')+'&ifShowNoneDataIndex='+ifShowNoneDataIndex);
			var accSelected = $('#qbAcc').accordion('getPanel',0);
			accSelected.panel('setTitle', '产线(产线名：'+plName+')');
			
  		}
  		//var productLineRealTimeInterval=setInterval(productLineRealTime, 10000);
  	 	function productLineRealTime(){
  			var startTime,endTime;
  			if($('#qbSearchTimeType1').radiobutton('options').checked==true){
  				startTime=$('#qbStartTime').datetimebox('getValue');
  				endTime=$('#qbEndTime').datetimebox('getValue');
  			}else{
  				var searchProductLineRealTime=searchTimeInterval($('#timecc').combobox('getValue'));
  				startTime=searchProductLineRealTime.startTime;
  				endTime=searchProductLineRealTime.endTime;
  			}
  			$.ajax({
  				type:'post',
  				url:'<%=basePath%>qb/getProductLineRealTime',
  				data:{
  					startTime:startTime,
  					endTime:endTime
  				},
  				success:function(data){
  					for(var i=0;i<data.length;i++){
  						switch(parseInt(data[i].qualityLevel)){
  							case 0:
						        $('#'+data[i].buttonId).removeClass('c5 c6 c7').addClass('c1');
						        break;
						    case 1:
						        $('#'+data[i].buttonId).removeClass('c5 c6 c1').addClass('c7');
						         break;
						    case 2:
						        $('#'+data[i].buttonId).removeClass('c1 c6 c7').addClass('c5');
						         break;
						    case 3:
						        $('#'+data[i].buttonId).removeClass('c5 c1 c7').addClass('c6');
						         break;
  						}
  					}
  				}
  			})
  		}
  		
	</script>
  </body>
</html>
