package cn.qdas.bi.service.impl;


import javax.annotation.Resource;
import javax.xml.rpc.ServiceException;

import cn.qdas.bi.bean.QualityBoard;

import org.dom4j.DocumentException;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.qdas.bi.dao.QualityBoardMapper;
import cn.qdas.bi.service.IQualityBoardService;
import cn.qdas.core.V11Webservice.V11GetCpkData;
import cn.qdas.core.V11Webservice.V11WebServiceClient;

import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class QualityBoardServiceImpl implements IQualityBoardService{
	@Resource
	QualityBoardMapper qbm;

	@Override
	public List getAllProductLine(QualityBoard qb) {
		List<Map> list=qbm.getAlarmCountByProductLine(qb);
		for(int i=0;i<list.size();i++){
			Map map=list.get(i);
			/*if(null==map.get("TEERZEUGNIS")||"".equals(map.get("TEERZEUGNIS"))){
				list.remove(i);
				i--;
			}else{*/
				if("0".equals(qb.getIfShowNoneDataIndex())&&Integer.parseInt(String.valueOf(map.get("wvCount")))==0){
					map.put("qualityLevel","4");
				}else if("1".equals(qb.getIfShowNoneDataIndex())&&Integer.parseInt(String.valueOf(map.get("wvCount")))==0){
					map.put("qualityLevel","3");
				}else if(Integer.parseInt(String.valueOf(map.get("alarmCount1")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount2")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount65536")))>0){
					map.put("qualityLevel","2");
				}else if(Integer.parseInt(String.valueOf(map.get("alarmCount16")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount32")))>0){
					map.put("qualityLevel","1");
				}else{
					map.put("qualityLevel","0");
				}
				map.put("buttonId",String.valueOf(map.get("TEERZEUGNIS"))+String.valueOf(map.get("TENRKURZ")));
			//}
		}
		return list;
	}
	public List getTeilData(QualityBoard qb) {
		List<Map> list=qbm.getTeilAlarmCountData(qb);
		for(int i=0;i<list.size();i++){
			Map map=list.get(i);
			if("0".equals(qb.getIfShowNoneDataIndex())&&Integer.parseInt(String.valueOf(map.get("wvCount")))==0){
				map.put("qualityLevel","4");
			}else if("1".equals(qb.getIfShowNoneDataIndex())&&Integer.parseInt(String.valueOf(map.get("wvCount")))==0) {
				map.put("qualityLevel","3");
			}else if(Integer.parseInt(String.valueOf(map.get("alarmCount1")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount2")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount65536")))>0){
				map.put("qualityLevel","2");
			}else if(Integer.parseInt(String.valueOf(map.get("alarmCount16")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount32")))>0){
				map.put("qualityLevel","1");
			}else{
				map.put("qualityLevel","0");
			}
		}
		return list;
	}
	public List getMerkmalData(QualityBoard qb) {
		List<Map> list=qbm.getMerkmalAlarmCountData(qb);
		/*if(qb.isSearchRowsFlag()) {
			list=qbm.getMerkmalAlarmCountData(qb);
		}else {
			list=qbm.getMerkmalAlarmCountDataCount(qb);
		}*/
		
		for(int i=0;i<list.size();i++){
			Map map=list.get(i);
			if("0".equals(qb.getIfShowNoneDataIndex())&&Integer.parseInt(String.valueOf(map.get("wvCount")))==0){
				map.put("qualityLevel","4");
			}else if("1".equals(qb.getIfShowNoneDataIndex())&&Integer.parseInt(String.valueOf(map.get("wvCount")))==0) {
				map.put("qualityLevel","3");
			}else if(Integer.parseInt(String.valueOf(map.get("alarmCount1")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount2")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount65536")))>0){
				map.put("qualityLevel","2");
			}else if(Integer.parseInt(String.valueOf(map.get("alarmCount16")))>0||Integer.parseInt(String.valueOf(map.get("alarmCount32")))>0){
				map.put("qualityLevel","1");
			}else{
				map.put("qualityLevel","0");
			}
		}
		return list;
	}
	public List getWertevarChartData(QualityBoard qb) {
		List<Map> list=new ArrayList<Map>();
		if(qb.isSearchRowsFlag()) {
			list=qbm.getWertevarChartData(qb);
		}else {
			list=qbm.getWertevarChartDataCount(qb);
		}
		for(int i=0;i<list.size();i++) {
			list.get(i).put("WVDATZEIT", String.valueOf(list.get(i).get("WVDATZEIT")).substring(0, 19));
		}
		return list;
	}
	public List getWertevarDate(QualityBoard qb) {
		List<Map> list=qbm.getWertevarDate(qb);
		for(int i=0;i<list.size();i++) {
			list.get(i).put("WVDATZEIT", String.valueOf(list.get(i).get("WVDATZEIT")).substring(0, 19));
		}
		return list;
	}
	public Map getQbFormData(Integer arrIndex,QualityBoard qb) {
		List<String> plList=qbm.getAllProductLine(qb);
		for (int i=0;i<plList.size();i++){
			if (plList.get(i)==null||"".equals(plList.get(i))){
				plList.remove(i);
			}
		}
		String[] plArr=plList.toArray(new String[plList.size()]);
		Map formMap=getQbFormDataByPage(plArr,arrIndex,qb.getStartTime(),qb.getEndTime());
		List<Map> formlist=(List<Map>) formMap.get("rows");
		List<Map> tableList=new ArrayList<Map>();
		if(qb.isSearchRowsFlag()) {
			tableList=qbm.getQbTableData(formlist.get(0).get("TETEIL").toString(), formlist.get(0).get("MEMERKMAL").toString(),qb.getStartTime(),qb.getEndTime());
		}else {
			tableList=qbm.getQbTableDataCount(formlist.get(0).get("TETEIL").toString(), formlist.get(0).get("MEMERKMAL").toString());
		}
		for(int i=0;i<tableList.size();i++) {
			if(!"".equals(String.valueOf(tableList.get(i).get("WVDATZEIT")))&&null!=String.valueOf(tableList.get(i).get("WVDATZEIT"))){
				tableList.get(i).put("WVDATZEIT", String.valueOf(tableList.get(i).get("WVDATZEIT")).substring(0,19));
			}
		}
		Map reMap=new HashMap<String, Object>();
		reMap.put("formList", formlist.get(0));
		reMap.put("tableList", tableList);
		reMap.put("total", formMap.get("total"));
		return reMap;
	}
	public Map getQbFormDataByPage(String[] plArr,int arrIndex,String startTime,String endTime) {
		Page page = PageHelper.startPage(arrIndex, 1, true);
		List<Map> formlist=qbm.getQbFormData(plArr,startTime,endTime);
		Map map=new HashMap<String,Object>();
		map.put("rows", formlist);
		map.put("total", page.getTotal());
		return map;
	}
	/**
	 * 单个产线的轮播
	 */
	public Map getQbTeilsFormData(Integer arrIndex,QualityBoard qb) {
		Map formMap=getQbTeilsFormDataByPage(arrIndex,qb);
		List<Map> formlist=(List<Map>) formMap.get("rows");
		List<Map> tableList=new ArrayList<Map>();
		if(qb.isSearchRowsFlag()) {
			tableList=qbm.getQbTableData(formlist.get(0).get("TETEIL").toString(), formlist.get(0).get("MEMERKMAL").toString(),qb.getStartTime(),qb.getEndTime());
		}else {
			tableList=qbm.getQbTableDataCount(formlist.get(0).get("TETEIL").toString(), formlist.get(0).get("MEMERKMAL").toString());
		}
		for(int i=0;i<tableList.size();i++) {
			if(!"".equals(String.valueOf(tableList.get(i).get("WVDATZEIT")))&&null!=String.valueOf(tableList.get(i).get("WVDATZEIT"))){
				tableList.get(i).put("WVDATZEIT", String.valueOf(tableList.get(i).get("WVDATZEIT")).substring(0,19));
			}
		}
		Map reMap=new HashMap<String, Object>();
		reMap.put("formList", formlist.get(0));
		reMap.put("tableList", tableList);
		reMap.put("total", formMap.get("total"));
		return reMap;
	}
	public Map getQbTeilsFormDataByPage(int arrIndex,QualityBoard qb) {
		Page page = PageHelper.startPage(arrIndex, 1, true);
		List<Map> formlist=qbm.getTeilsQbFormData(qb);
		Map map=new HashMap<String,Object>();
		map.put("rows", formlist);
		map.put("total", page.getTotal());
		return map;
	}
	/**
	 * 获取单个零件轮播的所有数据
	 * @return
	 */
	public Map getQbTeilFormData(String teilId,Integer arrIndex,QualityBoard qb) {
		Map formMap=getQbTeilFormDataByPage(teilId,arrIndex,qb.getStartTime(),qb.getEndTime());
		List<Map> formlist=(List<Map>) formMap.get("rows");
		List<Map> tableList=new ArrayList<Map>();
		if(qb.isSearchRowsFlag()) {
			tableList=qbm.getQbTableData(formlist.get(0).get("TETEIL").toString(), formlist.get(0).get("MEMERKMAL").toString(),qb.getStartTime(),qb.getEndTime());
		}else {
			tableList=qbm.getQbTableDataCount(formlist.get(0).get("TETEIL").toString(), formlist.get(0).get("MEMERKMAL").toString());
		}
		if(tableList.size()>0){
			for(int i=0;i<tableList.size();i++) {
				if(!"".equals(String.valueOf(tableList.get(i).get("WVDATZEIT")))&&null!=String.valueOf(tableList.get(i).get("WVDATZEIT"))){
					tableList.get(i).put("WVDATZEIT", String.valueOf(tableList.get(i).get("WVDATZEIT")).substring(0,19));
				}
			}
		}
		Map reMap=new HashMap<String, Object>();
		reMap.put("formList", formlist.get(0));
		reMap.put("tableList", tableList);
		reMap.put("total", formMap.get("total"));
		return reMap;
	}
	public Map getQbTeilFormDataByPage(String teilId,int arrIndex,String startTime,String endTime) {
		Page page = PageHelper.startPage(arrIndex, 1, true);
		List<Map> formlist=qbm.getQbTeilFormData(teilId,startTime,endTime);
		Map map=new HashMap<String,Object>();
		map.put("rows", formlist);
		map.put("total", page.getTotal());
		return map;
	}
	public Map getQdasGraphic(QualityBoard qb) throws Exception{
		/*String endTime=qb.getEndTime();
		if(endTime==null||"".equals(endTime)) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			endTime=sdf.format(new Date());
		}*/
		int index=0;
		if(!qb.isSearchRowsFlag()) {
			Map map=qbm.getWertevarMaxValue(qb);
			int maxIndex=Integer.parseInt(map.get("MAXNUM").toString());
			index=maxIndex-125;
		}
		return V11WebServiceClient.getGraphic(qb.getTeilId(), qb.getMerkmalId(),qb.isSearchRowsFlag(),index);
	}
	/* (non-Javadoc)
	 * @see cn.qdas.bi.service.IQualityBoardService#getQdasV11Cpk(cn.qdas.bi.bean.QualityBoard)
	 */
	@Override
	public Map getQdasV11Cpk(QualityBoard qb) throws Exception {
		int index=0;
		if(!qb.isSearchRowsFlag()) {
			Map map=qbm.getWertevarMaxValue(qb);
			int maxIndex=Integer.parseInt(map.get("MAXNUM").toString());
			index=maxIndex-125;
		}
		return V11GetCpkData.getV11CpkData(qb.getTeilId(), qb.getMerkmalId(),qb.isSearchRowsFlag(),index);
	}
	public Map getQdasGraphicAndCpk(QualityBoard qb) throws Exception {
		int index=0;
		if(!qb.isSearchRowsFlag()) {
			Map map=qbm.getWertevarMaxValue(qb);
			int maxIndex=Integer.parseInt(map.get("MAXNUM").toString());
			index=maxIndex-125;
		}
		//return V11WebServiceClient.getGraphicAndCpk(qb.getTeilId(), qb.getMerkmalId(), qb.isSearchRowsFlag(),index);
		return null;
	}
}
