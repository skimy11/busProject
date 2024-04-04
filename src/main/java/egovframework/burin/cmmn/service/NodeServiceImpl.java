package egovframework.burin.cmmn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.burin.cmmn.dao.NodeDao;
import egovframework.burin.cmmn.vo.NodeVO;


@Service("nodeService")
public class NodeServiceImpl implements NodeService {

    @Autowired
    private NodeDao nodeDao;

    // 전체 노선 조회
	@Override
	public List<NodeVO> findNodesByRouteNm(String routeNm) {
		return nodeDao.findNodesByRouteNm(routeNm);
	}


}



