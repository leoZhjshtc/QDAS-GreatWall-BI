package cn.qdas.bi.service;


import cn.qdas.bi.bean.QbProductLine;
import cn.qdas.bi.bean.QualityBoard;

import java.util.List;
import java.util.Map;

public interface IQualityBoardService {
	List<Map> getAllProductLine(QualityBoard qb);
	List getTeilData(QualityBoard qb);
	List getMerkmalData(QualityBoard qb);
	List getWertevarChartData(QualityBoard qb);
	List getWertevarDate(QualityBoard qb);
	Map getQbFormData(Integer arrIndex, QualityBoard qb);
	Map getQbTeilsFormData(Integer arrIndex,QualityBoard qb);
	Map getQbTeilFormData(String teilId,Integer arrIndex,QualityBoard qb);
	Map getQdasGraphicAndCpk(QualityBoard qb) throws Exception;
	Map getQdasGraphic(QualityBoard qb) throws Exception;
	Map getQdasV11Cpk(QualityBoard qb)throws Exception;
}
