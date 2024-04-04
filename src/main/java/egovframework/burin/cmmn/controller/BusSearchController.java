package egovframework.burin.cmmn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.burin.cmmn.service.SearchService;
import egovframework.burin.cmmn.vo.SearchVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@RequestMapping("/search")
public class BusSearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusSearchController.class);

    @Resource(name = "searchService")
    private SearchService searchService;
   
    // 길찾기 http://localhost/search/searchInfo.do
    @GetMapping("/searchInfo.do")
    public String searchInfo() {
        return "bus/bus_search";
    }
    
    // 길찾기 조회
    @GetMapping("/findRoute.do")
    public String findRoute(
        @RequestParam String startQuery, 
        @RequestParam String endQuery, 
        Model model) {
        // 검색 수행 플래그 추가
        model.addAttribute("searchPerformed", true);

        try {
            List<SearchVO> routes = searchService.findRoute(startQuery, endQuery);
            if (routes.isEmpty()) {
                model.addAttribute("message", "해당 버스가 없습니다.");
            } else {
                model.addAttribute("routes", routes);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "검색 처리 중 오류가 발생했습니다.");
        }
        return "bus/bus_search";
    }
    
 // 길찾기 노선 조회
    @GetMapping("/showRouteDetails.do")
    public String showRouteDetails(
            @RequestParam String routeId, 
            @RequestParam String startStation, 
            @RequestParam String endStation, 
            Model model) {
        // 요청 파라미터 로깅
        System.out.println("routeId 쳌1: " + routeId);
        System.out.println("startStation 쳌2: " + startStation);
        System.out.println("endStation 쳌3: " + endStation);

        // 상세 노선 정보 조회 시도
        try {
            List<SearchVO> routeDetails = searchService.findRouteDetails(routeId, startStation, endStation);
            model.addAttribute("routeDetails", routeDetails);
            System.out.println("routeDetails 쳌4: " + routeDetails);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "상세 정보 조회 중 오류가 발생했습니다.");
        }
        
        return "bus/bus_route_details"; 
    }
    
    // 스테이션 위치 정보 조회
    @GetMapping("/getStationLocation.do")
    public ModelAndView getStationLocation(@RequestParam("endStation") String endStation) {
        ModelAndView mav = new ModelAndView("jsonView");
        try {
            SearchVO searchVO = searchService.getStationLocation(endStation);
            if (searchVO != null) {
                mav.addObject("pointLat", searchVO.getPointLat());
                mav.addObject("pointLng", searchVO.getPointLngt());
            } else {
                mav.addObject("message", "위치 정보를 찾을 수 없습니다: " + endStation);
            }
        } catch (Exception e) {
            mav.addObject("message", "검색 중 오류가 발생했습니다.");
        }
        return mav;
    }







}
