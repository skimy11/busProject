package egovframework.burin.cmmn.service;

import javax.inject.Inject;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.burin.cmmn.dao.UserDao;
import egovframework.burin.cmmn.enumpkg.ServiceResult;
import egovframework.burin.cmmn.vo.UserVO;

@Service("AuthenticateService")
public class AuthenticateServiceImpl extends EgovAbstractServiceImpl implements AuthenticateService {
    @Inject
    private UserDao userDao;

    @Override
    public ServiceResult authenticate(UserVO inputData) {
        // 사용자가 입력한 아이디와 패스워드를 이용하여 데이터베이스에서 사용자 조회
        int count = userDao.loginUser(inputData);
        System.out.println(count);
        // 로그인 성공 반환
        if (count == 1) {
            return ServiceResult.OK;
        } else {
            // 로그인 실패 반환
            return ServiceResult.NOTEXIST; // 사용자가 존재하지 않는 경우
            // return ServiceResult.INVALIDPASSWORD; // 비밀번호가 일치하지 않는 경우
        }
    }
}

