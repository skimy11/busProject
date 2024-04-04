package egovframework.burin.cmmn.service;

import egovframework.burin.cmmn.enumpkg.ServiceResult;
import egovframework.burin.cmmn.vo.UserVO;

public interface AuthenticateService {
    
    /**
     * 사용자 인증
     * @param inputData 사용자가 입력한 정보
     * @return 로그인 성공 여부를 나타내는 ServiceResult
     */
    ServiceResult authenticate(UserVO inputData) throws Exception;
}

