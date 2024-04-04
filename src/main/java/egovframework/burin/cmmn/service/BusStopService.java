package egovframework.burin.cmmn.service;

import java.util.List;
import java.util.Map;

import egovframework.burin.cmmn.vo.MainVO;
import egovframework.burin.cmmn.vo.RouteInfoVO;

public interface BusStopService {
	// 지도에 정거장 조회
    List<MainVO> getBusStopInfo(Map<String, Object> params);
    
    // 정거장명으로 검색
    List<MainVO> searchBusStopByNodeName(String nodeNm);
    
    // 노선 정보 조회
    List<RouteInfoVO> getRouteInfoByRouteNm(String routeNm) throws Exception;
   
    
}


