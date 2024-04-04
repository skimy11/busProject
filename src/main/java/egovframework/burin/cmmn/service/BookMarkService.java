package egovframework.burin.cmmn.service;

import java.util.List;
import egovframework.burin.cmmn.vo.BookMarkVO;

public interface BookMarkService {
	// 즐겨찾기 목록
	List<BookMarkVO> getAllBookmarksByUserId(String userId);
	
	// 즐겨찾기 삭제
	void deleteBookmark(String userId, String busId);

	// 즐겨찾기 추가
	void insertBookmark(String userId, String busId);
	
	// 즐겨찾기 중복 검사
    boolean checkBookmarkExists(String userId, String busId);
}


