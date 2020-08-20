package cn.qdas.gwbi.service;


import cn.qdas.gwbi.bean.QualityBoardGW;

import java.util.List;
import java.util.Map;

public interface IQualityBoardGWService {
    List getProductLineComboboxDataService();
    List getProductLineDataService(QualityBoardGW qualityBoard);
    List getTeilDataService(QualityBoardGW qualityBoard);
    List getMerkmalDataService(QualityBoardGW qualityBoard);
    List getChartDataService(QualityBoardGW qualityBoard);
    Map getQbShowFormInfoService(QualityBoardGW qualityBoard);
    Map getQdasGraphicAndCpk(QualityBoardGW qualityBoard) throws Exception;
}
