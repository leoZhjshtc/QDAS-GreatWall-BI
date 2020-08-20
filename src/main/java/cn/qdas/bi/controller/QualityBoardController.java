package cn.qdas.bi.controller;

import cn.qdas.bi.bean.QualityBoard;
import cn.qdas.bi.service.IQualityBoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: Leo-Zhou 周钧
 * @Date: 2019/6/28
 * @Description: cn.qdas.bi.controller
 */
@Controller
@RequestMapping("/qb")
public class QualityBoardController {
    @Resource
    IQualityBoardService iqbs;
    @RequestMapping("initQb")
    public String initQbPage() {
        return "bi/qb/qualityBoard";
    }
    @RequestMapping("getProductLineData")
    public String getProductLineData(Model model, QualityBoard qb) {
        List list =iqbs.getAllProductLine(qb);
        Map map=new HashMap<String, String>();
        map.put("plList", list);
        model.addAttribute("paramMap", map);
        return "bi/qb/qbProductLineData";
    }
    @RequestMapping("getProductLineRealTime")
    @ResponseBody
    public List getProductLineRealTime(QualityBoard qb) {
    	 List list =iqbs.getAllProductLine(qb);
    	 return list;
    }
    @RequestMapping("initTeilData")
    public String initTeilData(Model model, QualityBoard qb) {
        List <Map> teilList=iqbs.getTeilData(qb);
        Map map=new HashMap<String, String>();
        map.put("plId", qb.getProductLineName());
        map.put("k1007Num", qb.getK1007Num());
        map.put("teilList",teilList);
        model.addAttribute("paramMap", map);
        return "bi/qb/qbTeilData";
    }
    @RequestMapping("getTeilRealTime")
    @ResponseBody
    public List getTeilRealTime(QualityBoard qb) {
    	List list = iqbs.getTeilData(qb);
    	return list;
    }
    @RequestMapping("initMerkmalData")
    public String initMerkmalData(Model model,QualityBoard qb) {
        List list=iqbs.getMerkmalData(qb);
        Map map=new HashMap<String, String>();
        System.out.println(qb.getTeilId());
        System.out.println(qb.getMerkmalName());
        map.put("teilId", qb.getTeilId());
        map.put("merkmalList", list);
        model.addAttribute("paramMap", map);
        return "bi/qb/qbMerkmalData";
    }
    @RequestMapping("getMerkmalRealTime")
    @ResponseBody
    public List getMerkmalRealTime(QualityBoard qb) {
    	 List list=iqbs.getMerkmalData(qb);
    	 return list;
    }
    @RequestMapping("initWertevarChart")
    @ResponseBody
    public List getWertevarChartData(QualityBoard qb) {
        List list=iqbs.getWertevarChartData(qb);
        return list;
    }
    @RequestMapping("initDetailsDataPage")
    public String initDetailsDataPage(QualityBoard qb,Model model) {
    	model.addAttribute("teilId", qb.getTeilId());
    	model.addAttribute("merkmalId", qb.getMerkmalId());
    	return "bi/qb/detailsDataPage";
    }
    @RequestMapping("getWertevarData")
    @ResponseBody
    public List getWertevarData(QualityBoard qb) {
        List list = iqbs.getWertevarDate(qb);
        return list;
    }
    /**
     *
     * @param index 1:所有产线的数据  2：单个产线的数据 3：单个零件的数据
     * @return
     */
    @RequestMapping("initQbShow")
    public String initQbShowPage(Model model,String index,QualityBoard qb) {
        model.addAttribute("index", index);
        model.addAttribute("productLineName", qb.getProductLineName());
        model.addAttribute("teilId", qb.getTeilId());
        model.addAttribute("k1007Num", qb.getK1007Num());
        return "bi/qb/qbShow";
    }
    @RequestMapping("getQbForm")
    @ResponseBody
    public Map getQbFormData(Integer arrIndex,QualityBoard qb,String teilId,String index) {
        Map map=new HashMap<String,Object>();
        switch (index) {
            case "1":
                map=iqbs.getQbFormData(arrIndex,qb);
                break;
            case "2":
                map=iqbs.getQbTeilsFormData(arrIndex,qb);
                break;
            case "3":
                map=iqbs.getQbTeilFormData(teilId,arrIndex,qb);
                break;
        }
        return map;
    }
    @RequestMapping("getQdasGraphicAndCpk")
    @ResponseBody
    public Map getQdasGraphicAndCpk(QualityBoard qb) {
    	Map imgMap=new HashMap<String, Object>();
		try {
			imgMap = iqbs.getQdasGraphicAndCpk(qb);
		} catch (Exception e) {
			imgMap.put("error", 1);
			e.printStackTrace();
		}
    	return imgMap;
    }
    @RequestMapping("initQdasCharts")
    public String initQdasCharts(QualityBoard qb,Model model) {
    	model.addAttribute("teilIdqc", qb.getTeilId());
    	model.addAttribute("merkmalqc", qb.getMerkmalId());
    	return "bi/qb/qdasCharts"; 
    }
    @RequestMapping("getQdasChartsData")
    @ResponseBody
    public Map getQdasChartsData(QualityBoard qb) {
    	Map imgMap=null;
		try {
			imgMap = iqbs.getQdasGraphic(qb);
		} catch (Exception e) {
			imgMap.put("error", 1);
			e.printStackTrace();
		}
    	return imgMap;
    }
   @RequestMapping("getQdasV11Cpk")
   @ResponseBody
   public Map getQdasV11Cpk(QualityBoard qb) {
	   Map map=new  HashMap<String, Object>();
	   
	   try {
		map=iqbs.getQdasV11Cpk(qb);
		} catch (Exception e) {
			map.put("error", 1);
			e.printStackTrace();
		}
	   
	   return map;
   }
}
