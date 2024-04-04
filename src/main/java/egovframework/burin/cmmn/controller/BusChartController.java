package egovframework.burin.cmmn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.burin.cmmn.service.ChartService;
import egovframework.burin.cmmn.vo.ChartVO;

@Controller
@RequestMapping("/chart")
public class BusChartController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BusChartController.class);

    @Resource(name = "chartService")
    private ChartService chartService;
    
    // 차트 http://localhost/chart/chartInfo.do
    @GetMapping("/chartInfo.do")
    public String getChartPage() {
        return "bus/bus_chart";
    }

    // 차트 조회
    @GetMapping("/api/busStations.do")
    public String getBusStations(Model model) {
        Map<String, Object> params = new HashMap<>();
        List<ChartVO> busStations = chartService.getBusStations(params);
        System.out.println("나와라 params : "+params);
        model.addAttribute("busStations", busStations);
        System.out.println("나와라 busStations : "+busStations);
        return "jsonView"; 
    }
}


