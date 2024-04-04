package egovframework.burin.cmmn.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.burin.cmmn.dao.ChartDao;
import egovframework.burin.cmmn.vo.ChartVO;


@Service("chartService")
public class ChartServiceImpl implements ChartService {

    @Autowired
    private ChartDao chartDao;

    // 차트 조회
    @Override
    public List<ChartVO> getBusStations(Map<String, Object> params) {
        return chartDao.getBusStations(params);
    }
}
