package egovframework.burin.cmmn.service;

import java.util.List;
import java.util.Map;
import egovframework.burin.cmmn.vo.ChartVO;


public interface ChartService {
	// 차트 조회 getBusStations
	List<ChartVO> getBusStations(Map<String, Object> params);
	
}


