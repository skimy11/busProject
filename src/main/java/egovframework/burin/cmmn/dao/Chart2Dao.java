package egovframework.burin.cmmn.dao;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.burin.cmmn.vo.Chart2VO;

@Mapper("chart2Dao")
public interface Chart2Dao {
	// 차트 조회
	List<Chart2VO> selectAllRoutes();
}