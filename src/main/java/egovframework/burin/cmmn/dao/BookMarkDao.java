package egovframework.burin.cmmn.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.burin.cmmn.vo.BookMarkVO;

@Mapper
public interface BookMarkDao {
    // 즐겨찾기 조회
    List<BookMarkVO> getAllBookmarksByUserId(String userId);
    
    // 즐겨찾기 삭제
    void deleteBookmark(@Param("userId") String userId, @Param("busId") String busId);
    
    // 즐겨찾기 추가
    void insertBookmark(@Param("userId") String userId, @Param("busId") String busId);
    
    // 즐겨찾기 중복 검사
    boolean checkBookmarkExists(@Param("userId") String userId, @Param("busId") String busId);

}
