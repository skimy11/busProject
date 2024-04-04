package egovframework.burin.cmmn.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.burin.cmmn.vo.NodeVO;


@Mapper
public interface NodeDao {
	// 전체노선조회
	List<NodeVO> findNodesByRouteNm(String routeNm);
}