<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base/meta.jsp"%>
<html>
  <head>
  </head>
  <body>
  	<div class="easyui-layout" fit="true" style="width: 100%;height: 100%">
  		<input type="hidden" id="elTeilProductLineName" name="elTeilProductLineName" value="${paramMap.plId }">
  		<input type="hidden" id="elTeilK1007Num" name="elTeilK1007Num" value="${paramMap.k1007Num }">
		<div id="teilbox" data-options="region:'center'" style="padding:5px;background:#eee;">
			<c:forEach items="${paramMap.teilList}" var="map">
				<c:choose>
					<c:when test="${map.qualityLevel==\"0\"}">
						<a id="teil${map.TETEIL }" class="easyui-linkbutton c1" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" onclick="getMerkmal('${map.TETEIL }','${map.TETEILNR }','${map.TEBEZEICH }');"><font size="4" style="line-height: 100%">${map.TETEILNR }<br>${map.TEABT }</font></a>
					</c:when>
					<c:when test="${map.qualityLevel==\"1\"}">
						<a id="teil${map.TETEIL }" class="easyui-linkbutton c7" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" onclick="getMerkmal('${map.TETEIL }','${map.TETEILNR }','${map.TEBEZEICH }');"><font size="4" style="line-height: 100%">${map.TETEILNR }<br>${map.TEABT }</font></a>
					</c:when>
					<c:when test="${map.qualityLevel==\"2\"}">
						<a id="teil${map.TETEIL }" class="easyui-linkbutton c5" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" onclick="getMerkmal('${map.TETEIL }','${map.TETEILNR }','${map.TEBEZEICH }');"><font size="4" style="line-height: 100%">${map.TETEILNR }<br>${map.TEABT }</font></a>
					</c:when>
					<c:when test="${map.qualityLevel==\"3\"}">
						<a id="teil${map.TETEIL }" class="easyui-linkbutton c6" data-options="size:'large'" style="width:19%;height: 15.5%;margin-top: 5px" onclick="getMerkmal('${map.TETEIL }','${map.TETEILNR }','${map.TEBEZEICH }');"><font size="4" style="line-height: 100%">${map.TETEILNR }<br>${map.TEABT }</font></a>
					</c:when>
				</c:choose>
			</c:forEach>						
		</div> 
	</div>
	<script type="text/javascript">
		function searchTeil(){
				$('#teilAcc').panel({
					href:'<%=basePath%>qb/initTeilData?productLineName='+$('#elTeilProductLineName').val()+'&teilNum='+$('#teilNum').textbox('getValue')+'&teilName='+$('#teilName').textbox('getValue')+'&k1007Num='+$('#elTeilK1007Num').val()+'&ifShowNoneDataIndex='+ifShowNoneDataIndex+'&startTime='+$('#startTime').datetimebox('getValue')+'&endTime'+$('#endTime').datetimebox('getValue')
				});
		}
		function getMerkmal(teilId,teilNum,teilName){
  			$('#teilbox > a').linkbutton({
			    iconCls:''
			});
			$('#teil'+teilId).linkbutton({
			    iconCls: 'icon-large-gou'
			});
			$('#merkmalSearchbtn').linkbutton('enable');
			$('#SearchRowsBt').switchbutton('enable');
			$('#showDetailsBtn').linkbutton('enable');
			$('#openMerkmalQb').linkbutton('enable');
			$('#openQdasCharts').linkbutton('enable');
				$('#merkmalCenterbox').panel({
					href:'<%=basePath%>qb/initMerkmalData?teilId='+teilId+'&startTime='+$('#startTime').datetimebox('getValue')+'&endTime'+$('#endTime').datetimebox('getValue')+'&ifShowNoneDataIndex='+ifShowNoneDataIndex
				});
			var accSelected = $('#qbAcc').accordion('getPanel',1);
			accSelected.panel('setTitle', '零件(零件号：'+teilNum+' / 零件名：'+teilName+')');
			$('#qbAcc').accordion('select',2); 
  		}
  		$('#openTeilQb').click(function(){
  			$('#qbDig').panel({
							href:'<%=basePath%>qb/initQbShow?index='+'2&productLineName='+$('#elTeilProductLineName').val()+'&k1007Num='+$('#elTeilK1007Num').val()
						});
				$('#qbDig').dialog('open');
  		})
  		function teilRealTime(){
  			var startTime,endTime;
  			if($('#qbSearchTimeType1').radiobutton('options').checked==true){
  				startTime=$('#qbStartTime').datetimebox('getValue');
  				endTime=$('#qbEndTime').datetimebox('getValue');
  			}else{
  				var searchTeilRealTime=searchTimeInterval($('#timecc').combobox('getValue'));
  				startTime=searchTeilRealTime.startTime;
  				endTime=searchTeilRealTime.endTime;
  			}
  			$.ajax({
  				type:'post',
  				url:'<%=basePath%>qb/getTeilRealTime',
  				data:{
  					startTime:startTime,
  					endTime:endTime,
  					productLineName:$('#elTeilProductLineName').val()
  				},
  				success:function(data){
  					for(var i=0;i<data.length;i++){
  						switch(parseInt(data[i].qualityLevel)){
  							case 0:
						        $('#teil'+data[i].TETEIL).removeClass('c5 c6 c7').addClass('c1');
						        break;
						    case 1:
						        $('#teil'+data[i].TETEIL).removeClass('c5 c6 c1').addClass('c7');
						         break;
						    case 2:
						        $('#teil'+data[i].TETEIL).removeClass('c1 c6 c7').addClass('c5');
						         break;
						    case 3:
						        $('#teil'+data[i].TETEIL).removeClass('c5 c1 c7').addClass('c6');
						         break;
  						}
  					}
  				}
  			})
  		
  		}
	</script>
  </body>
</html>
