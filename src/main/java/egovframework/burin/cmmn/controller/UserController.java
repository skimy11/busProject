package egovframework.burin.cmmn.controller;

import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.burin.cmmn.enumpkg.ServiceResult;
import egovframework.burin.cmmn.service.AuthenticateService;
import egovframework.burin.cmmn.vo.UserVO;

@Controller
public class UserController {

  @Resource(name ="AuthenticateService")
  protected AuthenticateService service;
  
  //로그인 UI 주소 http://localhost/login.do
  @RequestMapping (value="/login.do", method = RequestMethod.GET)
  public String loginPage() { 
      return "bus_login";
  }

//로그인 처리
  @PostMapping("/loginProcess.do")
  public String login(@RequestParam("userId") String userId,
                      @RequestParam("userPw") String userPw,
                      HttpSession session) {
      UserVO inputData = new UserVO();
      inputData.setUserId(userId);
      inputData.setUserPw(userPw);

      ServiceResult result = null;
      try {
          result = service.authenticate(inputData);
      } catch (Exception e) {
          e.printStackTrace();
      }

      if (result == ServiceResult.OK) {
          // 로그인 성공
          session.setAttribute("authId", inputData.getUserId());
          return "redirect:/bus/main.do";
      } else {
          // 로그인 실패 메시지 인코딩
          String message = "로그인 실패했습니다.";
          try {
              String encodedMessage = URLEncoder.encode(message, "UTF-8");
              return "redirect:/login.do?message=" + encodedMessage;
          } catch (Exception e) {
              // 인코딩 실패 시, 기본 메시지로 리다이렉트
              return "redirect:/login.do";
          }
      }
  }
  
  
  
	// 로그아웃
	@PostMapping(value = "/logoutProcess.do")
	public String logout(HttpSession session) {
	    if (session != null) {
	        session.invalidate();  // 세션 무효화
	    }
	    return "redirect:/login.do"; // 로그아웃 후 로그인 페이지로 이동
	}

	
}