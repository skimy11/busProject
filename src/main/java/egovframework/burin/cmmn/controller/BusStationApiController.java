package egovframework.burin.cmmn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import egovframework.burin.cmmn.service.ChartService;
import egovframework.burin.cmmn.vo.ChartVO;

@RestController
@RequestMapping("/api")
public class BusStationApiController {

    @Resource(name = "chartService")
    private ChartService chartService;

    @GetMapping("/busStations")
    public List<ChartVO> getBusStations() {
        Map<String, Object> params = new HashMap<>();
        System.out.println("check params : "+params);
        return chartService.getBusStations(params);
    }
}
