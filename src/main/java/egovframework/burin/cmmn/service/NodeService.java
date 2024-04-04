package egovframework.burin.cmmn.service;

import java.util.List;

import egovframework.burin.cmmn.vo.NodeVO;


public interface NodeService {
	// 전체 노선 조회
	List<NodeVO> findNodesByRouteNm(String routeNm);
   
    
}


