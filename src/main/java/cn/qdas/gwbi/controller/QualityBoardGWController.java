package cn.qdas.gwbi.controller;

import cn.qdas.gwbi.bean.QualityBoardGW;
import cn.qdas.gwbi.service.IQualityBoardGWService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: Leo-Zhou 周钧
 * @Date: 2019/6/28
 * @Description: cn.qdas.bi.controller
 */
@Controller
@RequestMapping("/qbgw")
public class QualityBoardGWController {
    @Resource
    IQualityBoardGWService qualityBoardgwbiService;

    @RequestMapping("initQb")
    public String initQualityBoard(){
        return "bi/gwqb/qualityBoard";
    }
    @RequestMapping("initProductLinePage")
    public String initProductLinePage(QualityBoardGW qbg, Model model){
        List list=qualityBoardgwbiService.getProductLineDataService(qbg);
        model.addAttribute("plList",list);
        return "bi/gwqb/qbProductLinePage";
    }
    @RequestMapping("initTeilPage")
    public String initTeilPage(QualityBoardGW qbg, Model model){
        List list = qualityBoardgwbiService.getTeilDataService(qbg);
        model.addAttribute("teilList",list);
        model.addAttribute("teilPagePl",qbg.getProductLineName());
        model.addAttribute("teilPageK1007",qbg.getTeilK1007());
        return "bi/gwqb/qbTeilPage";
    }
    @RequestMapping("initMerkmal")
    public String initMerkmal(QualityBoardGW qbg, Model model){
        List<Map> list = qualityBoardgwbiService.getMerkmalDataService(qbg);
        model.addAttribute("merkmalList",list);
        model.addAttribute("merkmalPageTeilId",list.get(0).get("METEIL"));
        return "bi/gwqb/qbMerkmal";
    }
    @RequestMapping("getChartData")
    @ResponseBody
    public List getChartData(QualityBoardGW qbg){
        List list=qualityBoardgwbiService.getChartDataService(qbg);
        return list;
    }
    @RequestMapping("getQbShowFormInfo")
    @ResponseBody
    public Map getQbShowFormInfo(QualityBoardGW qbg){
        Map map=qualityBoardgwbiService.getQbShowFormInfoService(qbg);
        return map;
    }

    @RequestMapping("getProductLineComboboxData")
    @ResponseBody
    public List getProductLineComboboxData(){
        return qualityBoardgwbiService.getProductLineComboboxDataService();
    }


    @RequestMapping("getQdasGraphicAndCpk")
    @ResponseBody
    public Map getQdasGraphicAndCpk(QualityBoardGW qb) {
        Map imgMap=new HashMap<String, Object>();
        try {
            imgMap = qualityBoardgwbiService.getQdasGraphicAndCpk(qb);
        } catch (Exception e) {
            imgMap.put("error", 1);
            e.printStackTrace();
        }
        return imgMap;
    }
    @RequestMapping("initQbShow")
    public String initQbShow(){
        return "bi/gwqb/qbShowPage";
    }
}
