<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base/meta.jsp"%>
<html>
  <head>

  </head>
  
  <body>
  	<input id="teilIdVal" type="hidden" value="${paramMap.teilId }">
    <div class="easyui-layout" fit="true" style="width: 100%;height: 100%">
		<div id="merkmalbox" data-options="region:'west',split:false" style="padding:5px;background:#eee;width:550px;">
			<c:forEach items="${paramMap.merkmalList}" var="map">
				<c:choose>
					<c:when test="${map.qualityLevel==\"0\"}">
						<div style="margin-top: 5px;width: 100%;height: 105px">
							<div style="float: left;height: 100px">
								<a id="merkmal${map.MEMERKMAL }" class="easyui-linkbutton c1 qbbtn" data-options="size:'large'" style="width:280px;height: 100px;" 
										onclick="showChart('${map.MEMERKMAL }','${map.METEIL }','${map.MEMERKBEZ }');"><font size="4" style="line-height: 100%">${map.MEMERKNR }</br>${map.MEMERKBEZ }</font></a>
								<a class="easyui-linkbutton" id="showBtn${map.MEMERKMAL }" data-options="size:'large',iconCls:'icon-qdasIcon'" style="width:45px;height: 100px;" onclick="showQdasData('${map.MEMERKMAL }')"></a>
							</div>
							<div style="float: left;height: 100px;background:#eee;margin-left: 5px;border: 0.2px;">
								<table style="width: 100px;height: 100px;">
									<tr style="height: 45px">
										<td id="dzt${map.MEMERKMAL }" style="width: 45px"><img title="单值图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/dzt.bmp"></td>
										<td id="kzt${map.MEMERKMAL }" style="width: 45px"><img title="控制图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/kzt.bmp"></td>
									</tr>
									<tr style="height: 45px">
										<td id="zft${map.MEMERKMAL }" style="width: 45px"><img title="直方图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/zft.bmp"></td>
										<td id="bg3${map.MEMERKMAL }" style="width: 45px"><img title="表格3" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/bg3.bmp"></td>
									</tr>
								</table>
							</div>
							<div style="float: left;width:80px;height: 100px;border: 0.2px" id="cpkDiv${map.MEMERKMAL }">
								<p>未计算</p>
							</div>
						</div>
					</c:when>
					<c:when test="${map.qualityLevel==\"1\"}">
						<div style="margin-top: 5px;width: 100%;height: 105px">
							<div style="float: left;height: 100px">
								<a id="merkmal${map.MEMERKMAL }" class="easyui-linkbutton c7 qbbtn" data-options="size:'large'" style="width:280px;height: 100px;" 
										onclick="showChart('${map.MEMERKMAL }','${map.METEIL }','${map.MEMERKBEZ }');"><font size="4" style="line-height: 100%">${map.MEMERKNR }</br>${map.MEMERKBEZ }</font></a>
								<a class="easyui-linkbutton" id="showBtn${map.MEMERKMAL }" data-options="size:'large',iconCls:'icon-qdasIcon'" style="width:45px;height: 100px;" onclick="showQdasData('${map.MEMERKMAL }')"></a>
							</div>
							<div style="float: left;height: 100px;background:#eee;margin-left: 5px;border: 0.2px;">
								<table style="width: 100px;height: 100px;">
									<tr style="height: 45px">
										<td id="dzt${map.MEMERKMAL }" style="width: 45px"><img title="单值图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/dzt.bmp"></td>
										<td id="kzt${map.MEMERKMAL }" style="width: 45px"><img title="控制图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/kzt.bmp"></td>
									</tr>
									<tr style="height: 45px">
										<td id="zft${map.MEMERKMAL }" style="width: 45px"><img title="直方图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/zft.bmp"></td>
										<td id="bg3${map.MEMERKMAL }" style="width: 45px"><img title="表格3" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/bg3.bmp"></td>
									</tr>
								</table>
							</div>
							<div style="float: left;width:80px;height: 100px;border: 0.2px" id="cpkDiv${map.MEMERKMAL }">
								<p>未计算</p>
							</div>
						</div>
					</c:when>
					<c:when test="${map.qualityLevel==\"2\"}">
						<div style="margin-top: 5px;width: 100%;height: 105px">
							<div style="float: left;height: 100px">
								<a id="merkmal${map.MEMERKMAL }" class="easyui-linkbutton c5 qbbtn" data-options="size:'large'" style="width:280px;height: 100px;" 
										onclick="showChart('${map.MEMERKMAL }','${map.METEIL }','${map.MEMERKBEZ }');"><font size="4" style="line-height: 100%">${map.MEMERKNR }</br>${map.MEMERKBEZ }</font></a>
								<a class="easyui-linkbutton" id="showBtn${map.MEMERKMAL }" data-options="size:'large',iconCls:'icon-qdasIcon'" style="width:45px;height: 100px;" onclick="showQdasData('${map.MEMERKMAL }')"></a>
							</div>
							<div style="float: left;height: 100px;background:#eee;margin-left: 5px;border: 0.2px;">
								<table style="width: 100px;height: 100px;">
									<tr style="height: 45px">
										<td id="dzt${map.MEMERKMAL }" style="width: 45px"><img title="单值图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/dzt.bmp"></td>
										<td id="kzt${map.MEMERKMAL }" style="width: 45px"><img title="控制图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/kzt.bmp"></td>
									</tr>
									<tr style="height: 45px">
										<td id="zft${map.MEMERKMAL }" style="width: 45px"><img title="直方图" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/zft.bmp"></td>
										<td id="bg3${map.MEMERKMAL }" style="width: 45px"><img title="表格3" style="width: 45px;height: 45px;cursor:pointer" src="<%=basePath%>resources/images/bg3.bmp"></td>
									</tr>
								</table>
							</div>
							<div style="float: left;width:80px;height: 100px;border: 0.2px" id="cpkDiv${map.MEMERKMAL }">
								<p>未计算</p>
							</div>
						</div>
					</c:when>
					<c:when test="${map.qualityLevel==\"3\"}">
						<div style="float: left;width: 100%">
							<a id="merkmal${map.MEMERKMAL }" class="easyui-linkbutton c6 qbbtn" data-options="size:'large'" style="width:280px;height: 100px;margin-top: 5px" 
								onclick="showChart('${map.MEMERKMAL }','${map.METEIL }','${map.MEMERKBEZ }');"><font size="4" style="line-height: 100%">${map.MEMERKNR }</br>${map.MEMERKBEZ }</font></a>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>						
		</div> 
		<div id="charts" data-options="region:'center',onResize:function(){chartResize()}" style="background:#eee;padding: 5px">
		</div>
	</div>
	<div id="qdasImgBox1" class="easyui-window" title="Q-DAS" style="width:670px;height:400px" data-options="collapsible:false,modal:true,minimizable:false,maximizable:false,closed:true"></div>
	<div id="qdasImgBox2" class="easyui-window" title="Q-DAS" style="width:530px" data-options="collapsible:false,modal:true,minimizable:false,maximizable:false,closed:true"></div>
	<div id="dataWin" class="easyui-dialog" data-options="title:'数据详情',resizable:true,maximizable:true,modal:true,closed:true"></div>
	<script type="text/javascript" src="<%=basePath%>resources/js/echarts.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/charts.js"></script>
	<script type="text/javascript">
		var lineChart;
		var teilId,merkmalId;
		var winHeight=window.innerHeight;
		$(function(){
			$('#dataWin').height(window.innerHeight-200);
			$('#qdasImgBox2').height(window.innerHeight-100);
			$('#dataWin').width(window.innerWidth-200);
			$('#merkmalbox').find('.qbbtn').eq(0).linkbutton({
			    iconCls: 'icon-large-gou'
			});
			teilId='${paramMap.merkmalList[0].METEIL}';
			merkmalId='${paramMap.merkmalList[0].MEMERKMAL}';
			<%--  $('#openQdasCharts').click(function(){
			 //	$('#qdasWin').panel('clear');
			 	$('#qdasWin').dialog('open');
				$('#qdasWin').panel('refresh','<%=basePath%>qb/initQdasCharts?teilId='+teilId+'&merkmalId='+merkmalId);
				$('#qdasWin').panel({
								href:'<%=basePath%>qb/initQdasCharts?teilId='+teilId+'&merkmalId='+merkmalId
							});
			 }) --%>
			$('#merkmalSearchbtn').click(function(){
				$('#merkmalCenterbox').panel('refresh',"<%=basePath%>qb/initMerkmalData?teilId="+$('#teilIdVal').val()+"&merkmalName="+$('#merkmalName').textbox('getValue')+'&searchRowsFlag='+searchRows+'&ifShowNoneDataIndex='+ifShowNoneDataIndex);
			});
			getChartData('${paramMap.merkmalList[0].MEMERKMAL}','${paramMap.merkmalList[0].METEIL}');
			$('#showDetailsBtn').click(function(){
				$('#dataWin').dialog('open');
				$('#dataWin').panel('refresh','<%=basePath%>qb/initDetailsDataPage?teilId='+teilId+'&merkmalId='+merkmalId);
			})
			$('#openMerkmalQb').click(function(){
	  			$('#qbDig').panel({
								href:'<%=basePath%>qb/initQbShow?index='+'3&teilId='+teilId
							});
					$('#qbDig').dialog('open');
	  		})
		})
		function showChart(mId,tId,name){
			teilId=tId;
			merkmalId=mId;
			$('#merkmalbox').find('.qbbtn').linkbutton({
			    iconCls:''
			});
			$('#merkmal'+mId).linkbutton({
			    iconCls: 'icon-large-gou'
			});
			var accSelected = $('#qbAcc').accordion('getPanel',2);
			accSelected.panel('setTitle', '测量参数(参数名：'+name+')');
			getChartData(mId,tId)
		}
		function getChartData(mId,tId){
			$.ajax({
				type:'post',
				url:'<%=basePath%>qb/initWertevarChart',
				data:{
					teilId:tId,
					merkmalId:mId,
					searchRowsFlag:searchRows,
					startTime:$('#startTime').datetimebox('getValue'),
					endTime:$('#endTime').datetimebox('getValue')
				},
				success:function(data){
					if(data.length>0){
						if(data[0].MEMERKART=='0'){
							var upLimit=data[0].MEOGW;
							var downLimit=data[0].MEUGW;
							var xValue=[];
							var yValue=[];
							var tooltipTime=[];
								var tooltipPMBEZ=[];
							for(var i=0;i<data.length;i++){
								tooltipTime.push(data[i].WVDATZEIT);
									tooltipPMBEZ.push(data[i].MABEZ);
									xValue.push(data[i].WVWERTNR);
									yValue.push(data[i].WVWERT)
							}
							lineChart=initLineChart2('charts',xValue,yValue,upLimit,downLimit,data[0].MENENNMAS,tooltipTime,tooltipPMBEZ);
						}else{
							var integerNum=data[0].WVWERT+'';
							if(integerNum.indexOf('.')!=-1){
								integerNum=integerNum.substring(0, integerNum.indexOf('.'));
								
							}
							var xData=['合格','不合格'];
							var yData=[];
							var pieArr=[];
							var c=0;
							var okCount=0;
							var nokCount=0;
							if(integerNum.length==4){
								for(var i=0;i<data.length;i++){
									if(data[i].WVWERT==1000){
										okCount +=1;
									}else{
										nokCount +=1;
									}
								}
							}else{
								for(var i=0;i<data.length;i++){
									var strNum=data[i].WVWERT+'';
									if(strNum.indexOf('.')!=-1){
										var frontNum=parseInt(strNum.substring(0, strNum.indexOf('.')))/1000;
										var afterNum=parseFloat(strNum.substring(strNum.indexOf('.')-1))*1000000;
										okCount += frontNum-afterNum;
										nokCount += afterNum;
									}else{
										okCount += (parseInt(strNum)/1000);
									}
								}
							}
							yData=[okCount,nokCount];
							pieArr=[{name:'合格',value:okCount},{name:'不合格',value:nokCount}];
							lineChart=initBarAndPie('charts',xData,yData,pieArr);	
						}
					}else{
						if(lineChart!=null){
							lineChart.clear();
						}
					}
				}
			});
		}
		function chartResize(){
			if(lineChart!=null&lineChart!=''){
				lineChart.resize();
			}
		}
		function merkmalRealTime(){
			var startTime,endTime;
  			if($('#qbSearchTimeType1').radiobutton('options').checked==true){
  				startTime=$('#qbStartTime').datetimebox('getValue');
  				endTime=$('#qbEndTime').datetimebox('getValue');
  			}else{
  				var searchMerkmalRealTime=searchTimeInterval($('#timecc').combobox('getValue'));
  				startTime=searchMerkmalRealTime.startTime;
  				endTime=searchMerkmalRealTime.endTime;
  			}
  			$.ajax({
  				type:'post',
  				url:'<%=basePath%>qb/getMerkmalRealTime',
  				data:{
  					startTime:startTime,
  					endTime:endTime,
  					teilId:$('#teilIdVal').val()
  				},
  				success:function(data){
  					for(var i=0;i<data.length;i++){
  						switch(parseInt(data[i].qualityLevel)){
  							case 0:
						        $('#merkmal'+data[i].MEMERKMAL).removeClass('c5 c6 c7').addClass('c1');
						        break;
						    case 1:
						        $('#merkmal'+data[i].MEMERKMAL).removeClass('c5 c6 c1').addClass('c7');
						         break;
						    case 2:
						        $('#merkmal'+data[i].MEMERKMAL).removeClass('c1 c6 c7').addClass('c5');
						         break;
						    case 3:
						        $('#merkmal'+data[i].MEMERKMAL).removeClass('c5 c1 c7').addClass('c6');
						         break;
  						}
  					}
  				}
  			})
		}
		function showQdasData(merkmal){
			$('#dzt'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
			$('#kzt'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
			$('#zft'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
			$('#bg3'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
			$('#cpkDiv'+merkmal).empty().append('<img style="width: 80px;height: 90px" src="<%=basePath%>resources/images/cpkLoading.gif">');
			$.ajax({
				type:'post',
				url:'<%=basePath%>qb/getQdasGraphicAndCpk',
				data:{
					teilId:$('#teilIdVal').val(),
					merkmalId:merkmal,
					searchRowsFlag:searchRows
				},
				success:function(data){
					if(data.error==1){
						$('#cpkDiv'+merkmal).empty().append("<p>出现错误！！</p>");
					}else{
						$('#dzt'+merkmal).empty().append("<img title=\"单值图\" onclick=\"showImgWidth('"+data.dzt+"');\" style=\"width: 45px;height: 45px;cursor:pointer\" src=\"data:image/bmp;base64,"+data.dzt+"\">");
						$('#kzt'+merkmal).empty().append("<img title=\"控制图\" onclick=\"showImgWidth('"+data.kzt+"');\" style=\"width: 45px;height: 45px;cursor:pointer\" src=\"data:image/bmp;base64,"+data.kzt+"\">");
						$('#zft'+merkmal).empty().append("<img title=\"直方图\" onclick=\"showImgWidth('"+data.zft+"');\" style=\"width: 45px;height: 45px;cursor:pointer\" src=\"data:image/bmp;base64,"+data.zft+"\">");
						$('#bg3'+merkmal).empty().append("<img title=\"表格3\" onclick=\"showImgHeight('"+data.bg3+"');\" style=\"width: 45px;height: 45px;cursor:pointer\" src=\"data:image/bmp;base64,"+data.bg3+"\">");
						$('#cpkDiv'+merkmal).empty().append("<p>cp="+data.cp+"</p><p>cpk="+data.cpk+"</p>");
					}
					
				}
			})
		}
		function showImgWidth(imgstr){
			$('#qdasImgBox1').empty();
  			$('#qdasImgBox1').append("<img  style=\"width: 650px;height: 350px\" src=\"data:image/bmp;base64,"+imgstr+"\">")
  			$('#qdasImgBox1').window('open');
		}
		function showImgHeight(imgstr){
			$('#qdasImgBox2').empty();
  			$('#qdasImgBox2').append("<img  style=\"width: 510px;height: 730px\" src=\"data:image/bmp;base64,"+imgstr+"\">")
  			$('#qdasImgBox2').window('open');
		}
	</script>
  </body>
</html>
