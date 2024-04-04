package egovframework.burin.cmmn.controller;

import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.burin.cmmn.service.Chart2Service;
import egovframework.burin.cmmn.vo.Chart2VO;



@Controller
@RequestMapping("/chart2")
public class BusChart2Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(BusChart2Controller.class);

	@Resource(name = "chart2Service")
    private Chart2Service chart2Service; 
	
    // 차트 http://localhost/chart2/chart2Info.do
	@GetMapping("/chart2Info.do")
	public String listRoutes(Model model) {
	    List<Chart2VO> positions = chart2Service.listAll();
	    for (Chart2VO position : positions) {
	        LOGGER.info("Position: getLa={}, getLngt={}", position.getLa(), position.getLngt());
	    }
	    model.addAttribute("positions", positions);
	    return "bus/bus_chart2"; 
	}	
    
}


