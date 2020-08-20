package cn.qdas.bi.dao;


import cn.qdas.bi.bean.QualityBoard;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface QualityBoardMapper {
	List getAllProductLine(QualityBoard qb);
	//List getAlarmCountByProductLine(@Param("productLineNames")String[] productLineNames, @Param("startTime")String startTime, @Param("endTime")String endTime);
	List getAlarmCountByProductLine(QualityBoard qb);
	List getAlarmCountByProductLineCount();
	List getTeilAlarmCountData(QualityBoard qb);
	List getTeilAlarmCountDataCount(QualityBoard qb);
	List getMerkmalAlarmCountData(QualityBoard qb);
	List getMerkmalAlarmCountDataCount(QualityBoard qb);
	List getWertevarChartData(QualityBoard qb);
	List getWertevarChartDataCount(QualityBoard qb);
	List getWertevarDate(QualityBoard qb);
	List<Map> getQbFormData(@Param("productLineNames")String[] productLineNames, @Param("startTime")String startTime, @Param("endTime")String endTime);
	List<Map> getTeilsQbFormData(QualityBoard qb);
	List<Map> getQbTableData(@Param("teilId")String teilId,@Param("merkmalId")String merkmalId, @Param("startTime")String startTime, @Param("endTime")String endTime);
	List<Map> getQbTableDataCount(@Param("teilId")String teilId,@Param("merkmalId")String merkmalId);
	List<Map> getQbTeilFormData(@Param("teilId")String teilId,@Param("startTime")String startTime,@Param("endTime")String endTime);
	Map getWertevarMaxValue(QualityBoard qb);
}
