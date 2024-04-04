package egovframework.burin.cmmn.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.burin.cmmn.dao.MainDao;
import egovframework.burin.cmmn.vo.MainVO;
import egovframework.burin.cmmn.vo.RouteInfoVO;

@Service("busStopService")
public class BusStopServiceImpl implements BusStopService {

    @Autowired
    private MainDao mainDao;

    // 지도에 정거장 조회
    @Override
    public List<MainVO> getBusStopInfo(Map<String, Object> params) {
        return mainDao.getBusStopInfo(params);
    }

    // 정거장명으로 검색
    @Override
    public List<MainVO> searchBusStopByNodeName(String nodeNm) {
        return mainDao.searchBusStopByNodeName(nodeNm);
    }

    // 노선 정보 조회
	@Override
	public List<RouteInfoVO> getRouteInfoByRouteNm(String routeNm) throws Exception {
		return mainDao.getRouteInfoByRouteNm(routeNm);
	}
}



