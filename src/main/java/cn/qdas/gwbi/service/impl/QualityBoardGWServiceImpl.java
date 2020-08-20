package cn.qdas.gwbi.service.impl;


import cn.qdas.core.V11Webservice.V11WebServiceClient;
import cn.qdas.gwbi.bean.QualityBoardGW;
import cn.qdas.gwbi.dao.QualityBoardGWMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@SuppressWarnings(value = { "all" })
public class QualityBoardGWServiceImpl implements cn.qdas.gwbi.service.IQualityBoardGWService {
	@Resource
	QualityBoardGWMapper qbm;

	@Override
	public List getProductLineComboboxDataService() {
		return qbm.getProductLineComboboxDataMapper();
	}

	@Override
	public List getProductLineDataService(QualityBoardGW qualityBoard) {
		List list=new ArrayList<Map>();
		if(qualityBoard.isIfBy125()){
			list=qbm.getProductLineDataBy125Mapper(qualityBoard);
		}else{
			list=qbm.getProductLineDataByTimeMapper(qualityBoard);
		}
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				Map plMap= (Map) list.get(i);
				plMap.put("qualityLevel","0");
				List<Map> wvList= (List) plMap.get("wvList");
				for(int j=0;j<wvList.size();j++){
					if(null!=wvList.get(j).get("MEMERKART")&&"1".equals(wvList.get(j).get("MEMERKART").toString())){
						if(wvList.get(j).get("WVWERT")!=null&&Float.parseFloat(wvList.get(j).get("WVWERT").toString().substring(wvList.get(j).get("WVWERT").toString().indexOf(".")-1))>0){
							plMap.put("qualityLevel","2");
							break;
						}
					}else {
						if((wvList.get(j).get("MEUGW")!=null&&wvList.get(j).get("WVWERT")!=null&&
								Float.parseFloat(String.valueOf(wvList.get(j).get("WVWERT")))<Float.parseFloat(String.valueOf(wvList.get(j).get("MEUGW"))))||
								(wvList.get(j).get("MEOGW")!=null&&wvList.get(j).get("WVWERT")!=null&&
										Float.parseFloat(String.valueOf(wvList.get(j).get("WVWERT")))>Float.parseFloat(String.valueOf(wvList.get(j).get("MEOGW"))))) {
							plMap.put("qualityLevel","2");
							break;
						}
					}
				}
			}
		}
		return list;
	}

	@Override
	public List getTeilDataService(QualityBoardGW qualityBoard) {
		List<Map> list=new ArrayList<Map>();
		if(qualityBoard.isIfBy125()){
			list=qbm.getTeilDataBy125Mapper(qualityBoard);
		}else{
			list=qbm.getTeilDataByTimeMapper(qualityBoard);
		}
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				Map plMap=list.get(i);
				plMap.put("qualityLevel","0");
				List<Map> wvList= (List) plMap.get("wvList");
				for(int j=0;j<wvList.size();j++){
					if(null!=wvList.get(j).get("MEMERKART")&&"1".equals(wvList.get(j).get("MEMERKART").toString())){
						if(wvList.get(j).get("WVWERT")!=null&&Float.parseFloat(wvList.get(j).get("WVWERT").toString().substring(wvList.get(j).get("WVWERT").toString().indexOf(".")-1))>0){
							plMap.put("qualityLevel","2");
							break;
						}
					}else {
						if((wvList.get(j).get("MEUGW")!=null&&wvList.get(j).get("WVWERT")!=null&&
								Float.parseFloat(String.valueOf(wvList.get(j).get("WVWERT")))<Float.parseFloat(String.valueOf(wvList.get(j).get("MEUGW"))))||
								(wvList.get(j).get("MEOGW")!=null&&wvList.get(j).get("WVWERT")!=null&&
										Float.parseFloat(String.valueOf(wvList.get(j).get("WVWERT")))>Float.parseFloat(String.valueOf(wvList.get(j).get("MEOGW"))))) {
							plMap.put("qualityLevel","2");
							break;
						}
					}
				}
			}
		}
		return list;
	}
	@Override
	public List getMerkmalDataService(QualityBoardGW qualityBoard) {
		List<Map> list=new ArrayList<Map>();
		if(qualityBoard.isIfBy125()){
			list=qbm.getMerkmalDataBy125Mapper(qualityBoard);
		}else{
			list=qbm.getMerkmalDataByTimeMapper(qualityBoard);
		}
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				Map plMap=list.get(i);
				plMap.put("qualityLevel","0");
				List<Map> wvList= (List) plMap.get("wvList");
				for(int j=0;j<wvList.size();j++){
					if(null!=wvList.get(j).get("MEMERKART")&&"1".equals(wvList.get(j).get("MEMERKART").toString())){
						if(wvList.get(j).get("WVWERT")!=null&&Float.parseFloat(wvList.get(j).get("WVWERT").toString().substring(wvList.get(j).get("WVWERT").toString().indexOf(".")-1))>0){
							plMap.put("qualityLevel","2");
							break;
						}
					}else {
						if((wvList.get(j).get("MEUGW")!=null&&wvList.get(j).get("WVWERT")!=null&&
								Float.parseFloat(String.valueOf(wvList.get(j).get("WVWERT")))<Float.parseFloat(String.valueOf(wvList.get(j).get("MEUGW"))))||
								(wvList.get(j).get("MEOGW")!=null&&wvList.get(j).get("WVWERT")!=null&&
										Float.parseFloat(String.valueOf(wvList.get(j).get("WVWERT")))>Float.parseFloat(String.valueOf(wvList.get(j).get("MEOGW"))))) {
							plMap.put("qualityLevel","2");
							break;
						}
					}
				}
			}
		}
		return list;
	}

	@Override
	public List getChartDataService(QualityBoardGW qualityBoard) {
		List<Map> list=new ArrayList<Map>();
		if(qualityBoard.isIfBy125()){
			list=qbm.getChartDataBy125Mapper(qualityBoard);
		}else{
			list=qbm.getChartDataByTimeMapper(qualityBoard);
		}
		return list;
	}
	public Map getQdasGraphicAndCpk(QualityBoardGW qb) throws Exception {
		int index=0;
		if(qb.isIfBy125()) {
			Map map=qbm.getWertevarMaxValue(qb);
			int maxIndex=Integer.parseInt(map.get("WVWERTNR").toString());
			index=maxIndex-125;
		}
		return V11WebServiceClient.getGraphicAndCpk(qb,index);
	}
	@Override
	public Map getQbShowFormInfoService(QualityBoardGW qualityBoard) {
		Page page=PageHelper.startPage(qualityBoard.getPage(),1,true);
		List<Map> list=qbm.getQbShowFormInfoMapper(qualityBoard);
		List chartList=new ArrayList();
		if (list.size()>0){
			qualityBoard.setTeilId(list.get(0).get("WVTEIL").toString());
			qualityBoard.setMerkmalId(list.get(0).get("WVMERKMAL").toString());
			if(qualityBoard.isIfBy125()){
				chartList=qbm.getChartDataBy125Mapper(qualityBoard);
			}else{
				chartList=qbm.getChartDataByTimeMapper(qualityBoard);
			}
		}
		Map map=new HashMap<String,Object>();
		if (chartList.size()>0){
			map.put("rows", chartList.get(0));
		}
		map.put("chartList", chartList);
		map.put("total", page.getTotal());
		return map;
	}
}
