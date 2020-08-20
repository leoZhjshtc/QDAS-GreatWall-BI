package cn.qdas.gwbi.dao;



import cn.qdas.gwbi.bean.QualityBoardGW;

import java.util.List;
import java.util.Map;

public interface QualityBoardGWMapper {
	List getProductLineComboboxDataMapper();
	List getProductLineDataBy125Mapper(cn.qdas.gwbi.bean.QualityBoardGW qb);
	List getProductLineDataByTimeMapper(cn.qdas.gwbi.bean.QualityBoardGW qb);
	List getTeilDataBy125Mapper(cn.qdas.gwbi.bean.QualityBoardGW qb);
	List getTeilDataByTimeMapper(cn.qdas.gwbi.bean.QualityBoardGW qb);
	List getMerkmalDataBy125Mapper(cn.qdas.gwbi.bean.QualityBoardGW qb);
	List getMerkmalDataByTimeMapper(cn.qdas.gwbi.bean.QualityBoardGW qb);
	List getChartDataBy125Mapper(cn.qdas.gwbi.bean.QualityBoardGW qualityBoard);
	List getChartDataByTimeMapper(cn.qdas.gwbi.bean.QualityBoardGW qualityBoard);
	List getQbShowFormInfoMapper(cn.qdas.gwbi.bean.QualityBoardGW qualityBoard);
	Map getWertevarMaxValue(QualityBoardGW qualityBoard);
}
