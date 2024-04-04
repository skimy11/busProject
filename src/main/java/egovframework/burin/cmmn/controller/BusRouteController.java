package egovframework.burin.cmmn.controller;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import egovframework.burin.cmmn.service.NodeService;
import egovframework.burin.cmmn.vo.NodeVO;


@Controller
@RequestMapping("/route")
public class BusRouteController {

    @Resource(name = "nodeService")
    private NodeService nodeService;
   
    // 전체노선조회 http://localhost/route/routeInfo.do
    @GetMapping("/routeInfo.do")
    public String routeInfo(
    		@RequestParam("routeNm") String routeNm, 
    		Model model) {
    	System.out.println("체크!!! routeNm: " + routeNm);
        List<NodeVO> nodeList = nodeService.findNodesByRouteNm(routeNm);
        System.out.println("nodeList 체크: "+nodeList);
        System.out.println("routeNm 체크: "+routeNm);
        
        model.addAttribute("nodeList", nodeList);
        model.addAttribute("routeNm", routeNm);
        return "bus/bus_route";
    }
}
