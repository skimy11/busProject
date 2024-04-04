package egovframework.burin.cmmn.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.burin.cmmn.service.BookMarkService;
import egovframework.burin.cmmn.vo.BookMarkVO;

@Controller
@RequestMapping("/bookmark")
public class BookMarkController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BookMarkController.class);
	
	@Resource(name = "bookMarkService")
    private BookMarkService bookMarkService;

	// 즐겨찾기 http://localhost/bookmark/bookmark.do
	@GetMapping("/bookmark.do")
	public String bookmarkPage() {
		return "bus/bookmark"; 
	}
	
	// 즐겨찾기 목록 조회
	@GetMapping("/getBookmarks.do")
	public String getBookmarks(Model model, HttpSession session) {
	    String userId = (String) session.getAttribute("authId"); // 세션에서 사용자 ID 가져오기
		System.out.println("확인 userId 111: "+userId);
	    if (userId != null) {
	        List<BookMarkVO> bookmarks = bookMarkService.getAllBookmarksByUserId(userId); // 수정된 서비스 메소드 호출
	        model.addAttribute("bookmarks", bookmarks);
	        return "jsonView";
	    } else {
	        model.addAttribute("message", "로그인이 필요합니다.");
	        return "jsonView";
	    }
	}
	
	// 즐겨찾기 목록 삭제
	@PostMapping("/deleteBookmark.do")
	@ResponseBody
	public ResponseEntity<String> deleteBookmark(@RequestParam("userId") String userId, @RequestParam("busId") String busId) {
		System.out.println("확인 busId: "+busId);
		System.out.println("확인 userId 222: "+userId);
	    try {
	        // 즐겨찾기 삭제 로직 실행
	        bookMarkService.deleteBookmark(userId, busId);
	        return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	        LOGGER.error("Error deleting bookmark", e);
	        return new ResponseEntity<>("FAILURE", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}


}