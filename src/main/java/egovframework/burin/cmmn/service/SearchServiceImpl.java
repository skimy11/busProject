package egovframework.burin.cmmn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.burin.cmmn.dao.SearchDao;
import egovframework.burin.cmmn.vo.SearchVO;


@Service("searchService")
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDao searchDao;
    
    // 길찾기 조회
    @Override
    public List<SearchVO> findRoute(String startStation, String endStation) {
        return searchDao.findRouteByStartAndEndStation(startStation, endStation);
    }
    
    // 길찾기 노선 조회
    @Override
    public List<SearchVO> findRouteDetails(String routeId, String startStation, String endStation) {
        return searchDao.findRouteDetails(routeId, startStation, endStation);
    }
    
    // 스테이션 위치 정보 조회
    @Override
    public SearchVO getStationLocation(String endStation) {
        // List를 반환하는 대신 단일 객체를 반환하도록 변경
        List<SearchVO> results = searchDao.findLocationsByStationName(endStation);
        if (results != null && !results.isEmpty()) {
            return results.get(0); // 첫 번째 결과 반환, 실제로는 정확한 로직에 따라 변경될 수 있음
        }
        return null;
    }

}



