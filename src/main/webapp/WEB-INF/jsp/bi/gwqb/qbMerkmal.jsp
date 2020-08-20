<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base/meta.jsp" %>
<html>
<head>
</head>
<body>
<div class="easyui-layout" fit="true">
    <input type="hidden" id="merkmalPageTeilId" value="${merkmalPageTeilId}">
    <div id="qbMerkmalBtnDiv" data-options="region:'west',split:false" style="width:500px;padding: 5px">
        <c:forEach items="${merkmalList}" var="merkmal" varStatus="index">
            <c:choose>
                <c:when test="${merkmal.qualityLevel==\"0\"}">
                    <div style="margin-top: 5px;width: 100%;height: 105px">
                        <div style="float: left;height: 100px;width: 250px">
                            <a id="merkmal${merkmal.MEMERKMAL}" class="easyui-linkbutton c1 qbbtn"
                               data-options="size:'large'" style="width:190px;height: 100px;"
                               onclick="merkmalBtnClick('${merkmal.MEMERKMAL}','${merkmal.METEIL }');"><span
                                    class="buttonText">${merkmal.MEMERKNR  }<br>${merkmal.MEMERKBEZ  }</span></a>
                            <a class="easyui-linkbutton" id="showBtn${merkmal.MEMERKMAL }"
                               data-options="size:'large',iconCls:'icon-qdasIcon'" style="width:45px;height: 100px;"
                               onclick="showQdasData('${merkmal.MEMERKMAL }')"></a>
                        </div>
                        <div style="float: left;height: 100px;background:#eee;margin-left: 5px;border: 0.2px;width: 102px">
                            <table style="width: 100px;height: 100px;">
                                <tr style="height: 45px">
                                    <td id="dzt${merkmal.MEMERKMAL }" style="width: 45px"><img title="单值图"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/dzt.bmp">
                                    </td>
                                    <td id="kzt${merkmal.MEMERKMAL }" style="width: 45px"><img title="控制图"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/kzt.bmp">
                                    </td>
                                </tr>
                                <tr style="height: 45px">
                                    <td id="zft${merkmal.MEMERKMAL }" style="width: 45px"><img title="直方图"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/zft.bmp">
                                    </td>
                                    <td id="bg3${merkmal.MEMERKMAL }" style="width: 45px"><img title="表格3"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/bg3.bmp">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: left;width:80px;height: 100px;border: 0.2px"
                             id="cpkDiv${merkmal.MEMERKMAL }">
                            <p>未计算</p>
                        </div>
                    </div>
                </c:when>
                <c:when test="${merkmal.qualityLevel==\"2\"}">
                    <div style="margin-top: 5px;width: 100%;height: 105px">
                        <div style="float: left;height: 100px;width: 250px">
                            <a id="merkmal${merkmal.MEMERKMAL}" class="easyui-linkbutton c5 qbbtn"
                               data-options="size:'large'" style="width:190px;height: 100px;"
                               onclick="merkmalBtnClick('${merkmal.MEMERKMAL}','${merkmal.METEIL }');"><span
                                    class="buttonText">${merkmal.MEMERKNR  }<br>${merkmal.MEMERKBEZ  }</span></a>
                            <a class="easyui-linkbutton" id="showBtn${merkmal.MEMERKMAL }"
                               data-options="size:'large',iconCls:'icon-qdasIcon'" style="width:45px;height: 100px;"
                               onclick="showQdasData('${merkmal.MEMERKMAL }')"></a>
                        </div>
                        <div style="float: left;height: 100px;background:#eee;margin-left: 5px;border: 0.2px;width: 102px">
                            <table style="width: 100px;height: 100px;">
                                <tr style="height: 45px">
                                    <td id="dzt${merkmal.MEMERKMAL }" style="width: 45px"><img title="单值图"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/dzt.bmp">
                                    </td>
                                    <td id="kzt${merkmal.MEMERKMAL }" style="width: 45px"><img title="控制图"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/kzt.bmp">
                                    </td>
                                </tr>
                                <tr style="height: 45px">
                                    <td id="zft${merkmal.MEMERKMAL }" style="width: 45px"><img title="直方图"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/zft.bmp">
                                    </td>
                                    <td id="bg3${merkmal.MEMERKMAL }" style="width: 45px"><img title="表格3"
                                                                                               style="width: 45px;height: 45px;cursor:pointer"
                                                                                               src="<%=basePath%>resources/images/bg3.bmp">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: left;width:75px;height: 100px;border: 0.2px"
                             id="cpkDiv${merkmal.MEMERKMAL }">
                            <p>未计算</p>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
    </div>
    <div data-options="region:'center',border:false" style="">
        <div class="easyui-layout" fit="true">
            <div data-options="region:'north',split:false" style="height: 40px;padding: 4px;overflow: hidden">
                <a id="merkmalQbShow" class="easyui-linkbutton" data-options="iconCls:'icon-kanbanicon'" onclick="plOpenQbShow();"
                   style="float: right">打开轮播看板</a>
            </div>
            <div id="dztChart" data-options="region:'center',onResize:function(){chartResize()}" style=""></div>
        </div>
    </div>
</div>
<div id="qdasImgBox1" class="easyui-window" title="Q-DAS" style="width:670px;height:400px" data-options="collapsible:false,modal:true,minimizable:false,maximizable:false,closed:true"></div>
<div id="qdasImgBox2" class="easyui-window" title="Q-DAS" style="width:530px" data-options="collapsible:false,modal:true,minimizable:false,maximizable:false,closed:true"></div>
<script type="text/javascript" src="<%=basePath%>resources/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/charts.js"></script>
<script type="text/javascript">
    var qbLinechart;
    $(function () {
        $('#qbMerkmalBtnDiv').find('.qbbtn').each(function (index, ele) {
            if (index == 0) {
                $(ele).click();
            }
        });
    })

    function merkmalBtnClick(merkmal, teilId) {
        $('#qbMerkmalBtnDiv').find('.qbbtn').each(function (index, ele) {
            $(ele).linkbutton({
                iconCls: ''
            })
        })
        $('#merkmal' + merkmal).linkbutton({
            iconCls: 'icon-large-gou'
        })
        initChart(teilId, merkmal, startTime, endTime);
    }

    function initChart(teilId, merkmal, startTime, endTime) {
        $.ajax({
            type: 'post',
            url: '<%=basePath%>qbgw/getChartData',
            data: {
                teilId: teilId,
                merkmalId: merkmal,
                startTime: startTime,
                endTime: endTime,
                ifBy125: ifBy125
            },
            success: function (data) {
                if (data.length > 0) {
                    if (data[0].MEMERKART == '0') {
                        var upLimit = data[0].MEOGW;
                        var downLimit = data[0].MEUGW;
                        var xValue = [];
                        var yValue = [];
                        var tooltipTime = [];
                        var tooltipPMBEZ = [];
                        var tooltipMABEZ = [];
                        var tooltipK0014 = [];
                        var tooltipNEST = [];
                        for (var i = 0; i < data.length; i++) {
                            tooltipTime.push(data[i].WVDATZEIT);
                            tooltipPMBEZ.push(data[i].PMNR);
                            tooltipMABEZ.push(data[i].MABEZ);
                            tooltipK0014.push(data[i].WV0014);
                            tooltipNEST.push(data[i].NEBESCH)
                            xValue.push(data[i].WVDATZEIT);
                            yValue.push(data[i].WVWERT)
                        }
                        qbLinechart = initLineChart2('dztChart', xValue, yValue, upLimit, downLimit, data[0].MENENNMAS, tooltipTime, tooltipPMBEZ,tooltipMABEZ,tooltipK0014,tooltipNEST);
                    } else {
                        var integerNum = data[0].WVWERT + '';
                        if (integerNum.indexOf('.') != -1) {
                            integerNum = integerNum.substring(0, integerNum.indexOf('.'));

                        }
                        var xData = ['合格', '不合格'];
                        var yData = [];
                        var pieArr = [];
                        var c = 0;
                        var okCount = 0;
                        var nokCount = 0;
                        if (integerNum.length == 4) {
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].WVWERT == 1000) {
                                    okCount += 1;
                                } else {
                                    nokCount += 1;
                                }
                            }
                        } else {
                            for (var i = 0; i < data.length; i++) {
                                var strNum = data[i].WVWERT + '';
                                if (strNum.indexOf('.') != -1) {
                                    var frontNum = parseInt(strNum.substring(0, strNum.indexOf('.'))) / 1000;
                                    var afterNum = parseFloat(strNum.substring(strNum.indexOf('.') - 1)) * 1000000;
                                    okCount += frontNum - afterNum;
                                    nokCount += afterNum;
                                } else {
                                    okCount += (parseInt(strNum) / 1000);
                                }
                            }
                        }
                        yData = [okCount, nokCount];
                        pieArr = [{name: '合格', value: okCount}, {name: '不合格', value: nokCount}];
                        qbLinechart = initBarAndPie('dztChart', xData, yData, pieArr);
                    }
                } else {
                    if (qbLinechart != null) {
                        qbLinechart.clear();
                    }
                }
                /*if (data[0].MEMERKART != 1) {
                    var upLimit;
                    var downLimit;
                    var chartTitle;
                    var mdata;
                    var xValue = [];
                    var yValue = [];
                    var tooltipTime = [];
                    var tooltipPRVORNAME = [];
                    var tooltipPMBEZ = [];
                    if (data.length > 0) {
                        upLimit = data[0].MEOGW;
                        downLimit = data[0].MEUGW;
                        chartTitle = data[0].MEMERKBEZ;
                        mdata = data[0].MENENNMAS;
                        for (var i = 0; i < data.length; i++) {
                            tooltipTime.push(data[i].WVDATZEIT);
                            tooltipPRVORNAME.push(data[i].PRVORNAME == undefined ? '' : data[i].PRVORNAME);
                            tooltipPMBEZ.push('');
                            xValue.push(data[i].WVDATZEIT);
                            yValue.push(data[i].WVWERT)
                        }
                    }
                    qbLinechart = initQbLineChart('dztChart', xValue, yValue, upLimit, downLimit, mdata, tooltipTime, tooltipPRVORNAME, tooltipPMBEZ, chartTitle);
                } else {
                    var xData = ['合格', '不合格'];
                    var yData = [];
                    var pieArr = [];
                    var okCount = 0;
                    var nokCount = 0;
                    var title;
                    if (data.length > 0) {
                        title = data[0].MEMERKBEZ
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].WVWERT.toString().indexOf('.') !== 0 & parseFloat(data[i].WVWERT.toString().substring(data[i].WVWERT.toString().indexOf(".") - 1) > 0)) {
                                nokCount += 1;
                            } else {
                                okCount += 1;
                            }
                        }
                    }
                    yData = [okCount, nokCount];
                    pieArr = [{name: '合格', value: okCount}, {name: '不合格', value: nokCount}];
                    qbLinechart = initBarAndPie('dztChart', xData, yData, pieArr, title);

                }*/

            }
        })
    }

    function chartResize() {
        if (qbLinechart != null & qbLinechart != undefined) {
            qbLinechart.resize();
        }
    }

   /* $('#merkmalQbShow').click(function () {
        pageIndex = 0;
        $('#qbShowDiv').window('open');
        plInterval = setInterval(plQbShow, 1000 * 10);
    });*/
    function showQdasData(merkmal){
        $('#dzt'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
        $('#kzt'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
        $('#zft'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
        $('#bg3'+merkmal).empty().append('<img style="width: 45px;height: 45px" src="<%=basePath%>resources/images/qdasLoading.gif">');
        $('#cpkDiv'+merkmal).empty().append('<img style="width: 80px;height: 90px" src="<%=basePath%>resources/images/cpkLoading.gif">');
        $.ajax({
            type:'post',
            url:'<%=basePath%>qbgw/getQdasGraphicAndCpk',
            data:{
                teilId:$('#merkmalPageTeilId').val(),
                merkmalId:merkmal,
                startTime:startTime,
                endTime: endTime,
                ifBy125: ifBy125
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
