package egovframework.burin.cmmn.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.burin.cmmn.dao.Chart2Dao;
import egovframework.burin.cmmn.vo.Chart2VO;



@Service("chart2Service")
public class Chart2ServiceImpl implements Chart2Service {

    @Autowired
    private Chart2Dao chart2Dao;

    // 차트 조회
    @Override
    public List<Chart2VO> listAll() {
        return chart2Dao.selectAllRoutes();
    }
}
