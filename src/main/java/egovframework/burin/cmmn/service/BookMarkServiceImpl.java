package egovframework.burin.cmmn.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import egovframework.burin.cmmn.dao.BookMarkDao;
import egovframework.burin.cmmn.vo.BookMarkVO;

@Service("bookMarkService")
public class BookMarkServiceImpl implements BookMarkService {

    @Resource(name = "bookMarkDao")
    private BookMarkDao bookMarkDao;

    // 즐겨찾기 목록
    @Override
    public List<BookMarkVO> getAllBookmarksByUserId(String userId) {
        return bookMarkDao.getAllBookmarksByUserId(userId);
    }

    // 즐겨찾기 삭제
    @Override
    public void deleteBookmark(String userId, String busId) {
        bookMarkDao.deleteBookmark(userId, busId);
    }
    
    // 즐겨찾기 추가
    @Override
    public void insertBookmark(String userId, String busId) {
        bookMarkDao.insertBookmark(userId, busId);
    }
    
    // 즐겨찾기 중복 검사
    @Override
    public boolean checkBookmarkExists(String userId, String busId) {
        return bookMarkDao.checkBookmarkExists(userId, busId);
    }
}
