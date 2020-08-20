<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../base/meta.jsp" %>
<html>
<head>
</head>
<body>
<div class="easyui-layout" fit="true">
    <div id="plBtnDiv" data-options="region:'center',border:false" style="padding: 0px">
        <c:forEach items="${plList}" var="pl" varStatus="index">
            <c:choose>
                <c:when test="${pl.qualityLevel==\"0\"}">
                    <a class="easyui-linkbutton c1 buttonText" data-options="size:'large'" style="width:18%;height: 100px;margin-top: 5px;margin-left: 5px"
                       onclick="getProcedure('${index.index}','${pl.TENRKURZ  }','${pl.TEERZEUGNIS }');">
                        <span class="buttonText">${pl.TENRKURZ  }<br>${pl.TEERZEUGNIS  }</span>
                    </a>
                </c:when>
                <c:when test="${pl.qualityLevel==\"2\"}">
                    <a class="easyui-linkbutton c5 buttonText" data-options="size:'large'" style="width:18%;height: 100px;margin-top: 5px;margin-left: 5px"
                       onclick="getProcedure('${index.index}','${pl.TENRKURZ  }','${pl.TEERZEUGNIS }');">
                        <span class="buttonText">${pl.TENRKURZ  }<br>${pl.TEERZEUGNIS  }</span>
                    </a>
                </c:when>
            </c:choose>
        </c:forEach>
    </div>
</div>
<script type="text/javascript">
    function getProcedure(btnIndex,teilK1007, plName) {
        $('#plBtnDiv').find('.easyui-linkbutton').each(function (index, ele) {
            if (btnIndex == index) {
                $(ele).linkbutton({
                    iconCls: 'icon-large-gou'
                });
            } else {
                $(ele).linkbutton({
                    iconCls: ''
                });
            }
        })
        $('#qbAcc').accordion('select', 1);
        $('#teilAcc').panel('refresh', '<%=basePath%>qbgw/initTeilPage?startTime=' + startTime + "&endTime=" + endTime + "&teilK1007=" + encodeURI(teilK1007)+ "&productLineName=" + encodeURI(plName)+"&ifBy125="+ifBy125);

    }
</script>
</body>
</html>
