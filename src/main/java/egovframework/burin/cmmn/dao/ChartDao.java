package egovframework.burin.cmmn.dao;

import java.util.List;
import java.util.Map;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.burin.cmmn.vo.ChartVO;



@Mapper("chartDao")
public interface ChartDao {
	// 차트 조회 getBusStations
		List<ChartVO> getBusStations(Map<String, Object> params);
}