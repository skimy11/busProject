package egovframework.burin.cmmn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import egovframework.burin.cmmn.service.BookMarkService;
import egovframework.burin.cmmn.service.BusStopService;
import egovframework.burin.cmmn.vo.MainVO;
import egovframework.burin.cmmn.vo.RouteInfoVO;

@Controller
@RequestMapping("/bus")
public class BusMainController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BusMainController.class);

    @Resource(name = "busStopService")
    private BusStopService busStopService;
    
    @Resource(name = "bookMarkService")
    private BookMarkService bookMarkService;

    // 로그인 http://localhost/login.do
    @GetMapping("/login.do")
    public String login() {
        return "bus_login";
    }

    // 메인 http://localhost/bus/main.do
    @GetMapping("/main.do")
    public String index() {
        return "bus/bus_main";
    }

    // 지도에 정거장 조회
    @GetMapping("/getBusStopInfo.do")
    public String getBusStopInfo(
    		@RequestParam("lat") double lat, 
    		@RequestParam("lng") double lng,
    		Model model) {
    	
    	Map<String, Object> params = new HashMap<>();
    	params.put("lat", lat);
    	params.put("lng", lng);
//    	System.out.println("1111: "+lat);
    	
    	try {
    		List<MainVO> result = busStopService.getBusStopInfo(params);
    		if (!result.isEmpty()) {
//    			System.out.println("222: "+lat);
    			model.addAttribute("rst", result);
    		} else {
//    			System.out.println("333: "+lat);
    			model.addAttribute("fail", "값이 없습니다.");
    		}
    	} catch (Exception e) {
//    		System.out.println("444: "+lat);
    		LOGGER.error("Error getting bus stop info", e);
    	}
    	return "jsonView";
    }
    
    // 로그아웃
 	@PostMapping(value = "/logoutProcess.do")
 	public String logout(HttpSession session) {
 	    if (session != null) {
 	        session.invalidate();  
 	    }
 	    return "redirect:/login.do"; 
 	}
 	
 	// 검색어에 따른 버스 정거장 정보 조회
 	@GetMapping("/searchBusStop.do")
 	public String searchBusStop(
 	        @RequestParam("nodeNm") String nodeNm, 
 	        Model model) {

 	    try {
 	        List<MainVO> results = busStopService.searchBusStopByNodeName(nodeNm);
 	        if (!results.isEmpty()) {
 	        	System.out.println("check nodeNm : "+nodeNm);
 	            model.addAttribute("busStops", results);
 	        } else {
 	            model.addAttribute("message", "정거장이 없습니다.");
 	        }
 	    } catch (Exception e) {
 	        LOGGER.error("Error searching for bus stop", e);
 	        model.addAttribute("message", "검색 중 오류가 발생했습니다.");
 	    }
 	    return "jsonView";
 	}
 	
 // 노선 정보 조회
 	@GetMapping("/getBusRouteInfo.do")
 	public String getRouteInfo(@RequestParam("routeNm") String routeNm, Model model) {
 	    try {
 	        List<RouteInfoVO> routeInfo = busStopService.getRouteInfoByRouteNm(routeNm);
 	        System.out.println("check routeNm : "+routeNm);
 	       
 	        if (routeInfo != null && !routeInfo.isEmpty()) {
 	        	System.out.println("check routeInfo : "+routeInfo);
 	            model.addAttribute("routeInfo", routeInfo);
 	        } else {
 	            model.addAttribute("message", "해당 노선에 대한 정보가 없습니다.");
 	        }
 	    } catch (Exception e) {
 	        LOGGER.error("Error getting route info", e);
 	        model.addAttribute("message", "노선 정보 조회 중 오류가 발생했습니다.");
 	    }
 	    return "jsonView"; 
 	}
 	
 // 즐겨찾기 추가
// 	@PostMapping("/insertBookmark.do")
// 	public String insertBookmark(@RequestParam("userId") String userId, @RequestParam("busId") String busId, Model model) {
// 	    try {
// 	        // 중복 즐겨찾기 검사
// 	        boolean isAlreadyAdded = bookMarkService.checkBookmarkExists(userId, busId);
// 	        if (isAlreadyAdded) {
// 	            // 이미 추가된 경우, Model에 메시지 추가
// 	            model.addAttribute("message", "이미 추가된 즐겨찾기입니다.");
// 	            return "jsonView";
// 	        }
//
// 	        // 즐겨찾기 추가 로직 실행
// 	        bookMarkService.insertBookmark(userId, busId);
// 	        // 성공 메시지 Model에 추가
// 	        model.addAttribute("message", "즐겨찾기에 추가되었습니다.");
// 	    } catch (Exception e) {
// 	        // 오류 메시지 Model에 추가
// 	        model.addAttribute("message", "즐겨찾기 추가 중 오류가 발생했습니다.");
// 	    }
// 	    return "jsonView";
// 	}
 	
 	@PostMapping("/insertBookmark.do")
 	public String insertBookmark(@RequestParam("userId") String userId, @RequestParam("busId") String busId, Model model) {
 	    try {
 	        // 중복 즐겨찾기 검사
 	        boolean isAlreadyAdded = bookMarkService.checkBookmarkExists(userId, busId);
 	        if (isAlreadyAdded) {
 	            // 이미 추가된 경우, 즐겨찾기 삭제 로직으로 변경
 	            bookMarkService.deleteBookmark(userId, busId);
 	            model.addAttribute("message", "즐겨찾기가 삭제되었습니다.");
 	        } else {
 	            // 추가되지 않은 경우, 즐겨찾기 추가 로직
 	            bookMarkService.insertBookmark(userId, busId);
 	            model.addAttribute("message", "즐겨찾기에 추가되었습니다.");
 	        }
 	    } catch (Exception e) {
 	        // 오류 메시지 Model에 추가
 	        model.addAttribute("message", "즐겨찾기 처리 중 오류가 발생했습니다.");
 	    }
 	    return "jsonView";
 	}
 	
 	@PostMapping("/deleteBookmark.do")
 	public String deleteBookmark(@RequestParam("userId") String userId, @RequestParam("busId") String busId, Model model) {
 	    try {
 	        // 즐겨찾기 삭제 로직 실행
 	        bookMarkService.deleteBookmark(userId, busId);
 	        // 성공 메시지 Model에 추가
 	        model.addAttribute("message", "즐겨찾기가 삭제되었습니다.");
 	    } catch (Exception e) {
 	        // 오류 메시지 Model에 추가
 	        model.addAttribute("message", "즐겨찾기 삭제 중 오류가 발생했습니다.");
 	    }
 	    return "jsonView";
 	}



}
