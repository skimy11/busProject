package egovframework.burin.cmmn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.burin.cmmn.vo.SearchVO;

@Mapper
public interface SearchDao {
	// 길찾기 조회
	List<SearchVO> findRouteByStartAndEndStation(@Param("startStation") String startStation, @Param("endStation") String endStation);
	
	// 길찾기 노선 조회
	List<SearchVO> findRouteDetails(@Param("routeId") String routeId, @Param("startStation") String startStation, @Param("endStation") String endStation);

	// 스테이션 위치 정보 
	List<SearchVO> findLocationsByStationName(@Param("endStation") String endStation);

}