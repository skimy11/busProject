package egovframework.burin.cmmn.dao;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.burin.cmmn.vo.UserVO;

@Mapper
public interface UserDao {
	// 회원정보 검증 
	public int loginUser(UserVO inputData);
}