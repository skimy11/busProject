package egovframework.burin.cmmn.service;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import egovframework.burin.cmmn.vo.SearchVO;


public interface SearchService {
     // 길찾기 조회
     List<SearchVO> findRoute(String startStation, String endStation);
     
    // 길찾기 노선 조회
    List<SearchVO> findRouteDetails(@Param("routeId") String routeId, @Param("startStation") String startStation, @Param("endStation") String endStation);
    
    // 스테이션 위치 정보 조회
    SearchVO getStationLocation(String endStation);
}





