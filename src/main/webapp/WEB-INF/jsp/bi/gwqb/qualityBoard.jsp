<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../../base/meta.jsp" %>
<html>
<head>
    <script type="text/javascript" src="<%=basePath%>resources/js/echarts.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/charts.js"></script>
    <link href="<%=basePath %>resources/blueThemes/css/bi.css" rel="stylesheet" type="text/css" />
    <title>质量看板</title>
    <style type="text/css">
        font {
            font-size: 18px;
            font-weight: bold
        }
        .buttonText{
            font-size:22px;
            line-height: 25px;
        }
    </style>
    <script type="text/javascript">
        Date.prototype.format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
        var now=new Date();
        // var searchTime=now.getTime()-(7*86400000);
        // var ago=new Date(searchTime);
        //var startTime=ago.getFullYear()+"-"+(ago.getMonth()+1)+"-"+ago.getDate()+" "+ago.getHours()+":"+ago.getMinutes()+":"+ago.getSeconds();
        var weekStartDate = new Date(now.getFullYear(), now.getMonth(), now.getDate() - now.getDay())
        var startTime=weekStartDate.format('yyyy-MM-dd 00:00:00');
        var endTime=now.format('yyyy-MM-dd hh:mm:ss');
        console.log(startTime);
        console.log(endTime);
        var plInterval=null;
        var ifBy125=true;

        $(function () {
            $('#plAcc').panel('refresh', '<%=basePath%>qbgw/initProductLinePage?ifBy125='+ifBy125+'&startTime='+startTime+'&endTime='+endTime);
            $('#qbShowDiv').window({
                // width: $(window).width() - 100,
                // height: $(window).height() - 100,
                maximized:true,
                maximizable:false,
                collapsible: false,
                minimizable: false,
                modal: true,
                closed: true,
                resizable:false,
                cache:false,
                title:'看板',
                href:'<%=basePath%>qbgw/initQbShow',
                onClose:function () {
                    clearInterval(plInterval);
                }
            });
            /*$('#plQbShow').click(function () {
                pageIndex=0;
                $('#qbShowDiv').window('open').panel('refresh', '<%=basePath%>qbgw/initQbShow');
            })*/
            $('#qbStartTime').datetimebox({
                onChange:function(newValue, oldValue){qbDateSearch(newValue,1)},
                editable:false,
                value:startTime
            })
            $('#qbEndTime').datetimebox({
                onChange:function(newValue, oldValue){qbDateSearch(newValue,2)},
                editable:false,
                value:endTime
            })

        })

        function plOpenQbShow() {
            pageIndex=0;
            $('#qbShowDiv').window('open');
        }
        function qbDateSearch(newValue,index) {
            if(index==1){
                if($('#qbEndTime').datetimebox('getValue')!=''&newValue>$('#qbEndTime').datetimebox('getValue')){
                    $.messager.alert('信息','开始时间不得大于结束时间!','info');
                }else{
                    startTime=$('#qbStartTime').datetimebox('getValue');
                    $('#plAcc').panel('refresh', '<%=basePath%>qbgw/initProductLinePage?ifBy125='+ifBy125+"&productLineName="+encodeURI($('#plSearchName').combobox('getValue'))+"&startTime="+startTime+"&endTime="+endTime);
                }
            }else{
                if($('#qbStartTime').datetimebox('getValue')!=''&newValue<$('#qbStartTime').datetimebox('getValue')){
                    $.messager.alert('信息','开始时间不得大于结束时间!','info');
                }else{
                    endTime=$('#qbEndTime').datetimebox('getValue');
                    $('#plAcc').panel('refresh', '<%=basePath%>qbgw/initProductLinePage?ifBy125='+ifBy125+"&productLineName="+encodeURI($('#plSearchName').combobox('getValue'))+"&startTime="+startTime+"&endTime="+endTime);
                }

            }
        }
        function checkChange(flag) {
            ifBy125=flag;
            $('#plAcc').panel('refresh', '<%=basePath%>qbgw/initProductLinePage?ifBy125='+ifBy125+"&productLineName="+encodeURI($('#plSearchName').combobox('getValue'))+"&startTime="+startTime+"&endTime="+endTime);
        }
        function plComboboxSelect(plname) {
            $('#plAcc').panel('refresh', '<%=basePath%>qbgw/initProductLinePage?ifBy125='+ifBy125+"&productLineName="+encodeURI(plname)+"&startTime="+startTime+"&endTime="+endTime);
        }
        function logout(){
            $.messager.confirm('提示信息', '确定登出用户？', function(r){
                if (r){
                    window.location.href='<%=basePath%>main/logout';
                }
            });
        }
    </script>
</head>
<body>
<div class="easyui-layout" fit="true">
    <div data-options="region:'north',split:false,collapsible:false,border:false" style="background-color: #2dc3e8;height: 60px;overflow: hidden;" >
        <div style="float: left;margin-left: 20px;height: 100%"><small> <img src="<%=basePath%>resources/images/qdas-logo.png" alt="" /></small></div>
        <div style="position: absolute;left: 50%"><small> <img src="<%=basePath%>resources/images/greatWallLogo.jpg" alt="" style="width: 300px;height: 55px" /></small></div>
        <div class="user">
            <span>${user.userName }</span>
            <i><a onclick="logout()" style="cursor:pointer">退出登录</a></i>
        </div>

    </div>
    <div data-options="region:'center',border:false" style="overflow: hidden;">
        <div id="qbAcc" class="easyui-accordion" style="height: 100%;width: 100%">
            <div title="产线" data-options="selected:true" style="overflow:auto;">
                <div class="easyui-layout" fit="true">
                    <div data-options="region:'north',border:false" style="height: 40px;padding: 10px;overflow: hidden">
                        <div style="float: left">
                            <input class="easyui-checkbox" id="ifBy125" label="显示近125次测量:" labelWidth="120px" data-options="checked:true,onChange:function(checked){checkChange(checked);}">
                        </div>
                        <div style="float: left;margin-left: 10px">
                            开始时间：<input id="qbStartTime" style="width:150px">
                            结束时间：<input id="qbEndTime" style="width:150px">
                            产线：<input id="plSearchName" style="width:100px" class="easyui-combobox" data-options="valueField:'TEERZEUGNIS',textField:'TEERZEUGNIS',url:'<%=basePath%>qbgw/getProductLineComboboxData',editable:false,onSelect:function(record){plComboboxSelect(record.TEERZEUGNIS)}">
                        </div>
                        <a id="plQbShow" class="easyui-linkbutton" data-options="iconCls:'icon-kanbanicon'" onclick="plOpenQbShow();"
                           style="float: right">打开轮播看板</a>
                    </div>
                    <div id="plAcc" data-options="region:'center',border:false"></div>
                </div>
            </div>
            <div id="teilAcc" title="零件" data-options="">

            </div>
            <div id="merkmalAcc" title="参数">
            </div>
        </div>
    </div>
</div>
<div id="qbShowDiv">
</div>
</body>
</html>