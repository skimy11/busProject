<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <script>
        // URL 파라미터에서 메시지를 가져와서 알림을 표시하는 함수
        function displayMessage() {
            // URL에서 'message' 파라미터 가져오기
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            // 메시지가 있으면 알림 표시
            if (message) {
                alert(message);
            }
        }

        // 페이지 로드 후 메시지 표시 함수 호출
        window.onload = displayMessage;
        


    </script>
    <style>
.login_logo_wrap {
    margin: 14px 0 11px
}

.login_wrap .login_inner,.login_wrap .step_inner,.step_wrap .login_inner,.step_wrap .step_inner {
    padding: 0 20px;
    box-sizing: border-box;
    display: flex;
    justify-content: center;
}

.login_frm {
	width: 70%;
}

.login_wrap .title_wrap,.step_wrap .title_wrap {
    padding-bottom: 40px;
    text-align: center
}

.login_wrap .title_wrap .title,.step_wrap .title_wrap .title {
    font-size: 22px;
    font-weight: 600;
    line-height: 30px;
    letter-spacing: -.4px;
    color: #1e1e23
}

.login_wrap .title_wrap .desc,.step_wrap .title_wrap .desc {
    padding-top: 6px;
    font-size: 15px;
    line-height: 21px;
    letter-spacing: -.5px;
    color: #767678
}

.login_wrap .title_wrap .desc .accent,.step_wrap .title_wrap .desc .accent {
    font-weight: 600;
    color: #03c75a
}

.login_wrap .title_wrap .sub_desc,.step_wrap .title_wrap .sub_desc {
    padding-top: 6px;
    font-size: 13px;
    line-height: 18px;
    letter-spacing: -.5px;
    color: rgba(146,146,148,.8)
}

.login_wrap .title_wrap+.btn_check,.step_wrap .title_wrap+.btn_check {
    margin-top: 0
}

.login_wrap .title_wrap+.block_box,.login_wrap .title_wrap+.protect_box,.step_wrap .title_wrap+.block_box,.step_wrap .title_wrap+.protect_box {
    margin-top: -10px
}

html[lang=en] .login_form_wrap {
    margin-top: 76px
}

html[lang=en] .login_form_wrap .login_title_wrap {
    margin-top: -65px
}

.login_title_wrap {
    margin-bottom: 30px;
    text-align: center
}

.login_title_wrap .login_desc {
    font-size: 15px;
    line-height: 21px;
    letter-spacing: -.6px;
    color: #303038
}

.pc_keyboard_wrap {
    position: relative;
    z-index: 200
}

.pc_keyboard_wrap .btn_key {
    position: relative;
    float: right;
    padding-right: 24px;
    z-index: 10
}

.pc_keyboard_wrap .btn_key::after {
    content: " ";
    display: block;
    clear: both
}

.pc_keyboard_wrap .btn_key::after {
    content: '';
    position: absolute;
    top: 50%;
    right: 7px;
    margin-top: -4px;
    background-position: -222px -117px;
    background-repeat: no-repeat;
    width: 12px;
    height: 8px
}

.pc_keyboard_wrap .btn_key .text {
    font-size: 12px;
    line-height: 20px;
    color: rgba(146,146,148,.8)
}

.pc_keyboard_wrap .btn_key[aria-expanded=true]::after {
    transform: rotate(180deg)
}

.pc_keyboard_fold {
    margin-top: 40px;
    padding-bottom: 16px;
    overflow: hidden
}

.pc_keyboard {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 8px;
    height: 152px;
    padding: 5px 5px 50px 5px;
    border-radius: 6px;
    border: solid 1px rgba(0,0,0,.08);
    background-color: #fff;
    box-sizing: border-box
}

.pc_keyboard .keyboard_img {
    display: block;
    margin: 0 auto
}

.pc_keyboard .btn_key {
    position: absolute;
    right: 0;
    bottom: 8px
}

.pc_keyboard .btn_key::after {
    transform: rotate(180deg)
}

.login_form {
    position: relative
}

.login_box .input_inner {
    padding: 15px 35px 15px 50px
}

.login_box .icon_id,.login_box .icon_pw {
    position: absolute;
    top: 12px;
    left: 12px;
    opacity: .25;
    background-position: -157px -38px;
    background-repeat: no-repeat;
    width: 30px;
    height: 30px
}

.login_box .icon_id.on,.login_box .icon_pw.on {
    opacity: 1
}

.login_box .icon_pw {
    background-position: -160px -146px;
    background-repeat: no-repeat;
    width: 30px;
    height: 30px
}


.input_item:first-child .input_inner, .input_login:first-child .input_inner {
    border-top: 0;
}

.login_box .input_inner {
    padding: 15px 35px 15px 50px;
}
.input_inner {
    position: relative;
    display: block;
    height: 100%;
    padding: 15px 18px 15px 19px;
    border-top: 1px solid #f5f5f5;
    box-sizing: border-box;
    text-align: left;
}

.input_inner input {
	border: none;
}

.btn_check, .btn_white {
    display: block;
    width: 100%;
    margin-top: 14px;
    padding: 14px 0 13px;
    border-radius: 6px;
    border: solid 1px rgba(0, 0, 0, .05);
    background-color: #0393c7;
    box-sizing: border-box;
    cursor: pointer;
}

.input_password, .input_text {
    position: relative;
    display: block;
    width: 100%;
    height: 22px;
    font-size: 16px;
    line-height: 22px;
    letter-spacing: -.53px;
    color: #303038;
    z-index: 5;
}

.btn_check .text, .btn_white .text {
    font-size: 18px;
    line-height: 25px;
    font-weight: 700;
    color: #fff;
}

.login_logo_wrap {
    margin: 14px 0 11px;
    text-align: center;
    display: flex;
    justify-content: center;
}


.login_box .icon_id, .login_box .icon_pw {
    position: absolute;
    top: 12px;
    left: 12px;
    opacity: .25;
    background-position: -157px -38px;
    background-repeat: no-repeat;
    width: 30px;
    height: 30px;
}

.input_item, .input_login {
    position: relative;
}

.login_box {
    position: relative;
    width: 100%;
    margin: 0 auto;
    border-radius: 6px;
    box-shadow: 0 2px 8px 0 rgba(0,0,0,.05);
    border: solid 1px #e6e6ea;
    background-color: #fff;
    box-sizing: border-box;
}

.login_logo_wrap h2 {
    font-size: 2rem;
    text-align: center;
    line-height: 0;
}

.login_logo_wrap h2 a {
    color: inherit;
    text-decoration: none;
    font-weight: 500;
}

.login_logo_wrap h2 span {
    font-weight: 600;
}

</style>
</head>
<body>
	<div id="sri_section">    
		<div id="sri_wrap">
		    <div class="login_logo_wrap">
		        <h2><a href="/bus/main.do" style="line-height: 0.5;">burin<span>map</span></a></h2>
		    </div>
		    <div id="content" class="login_wrap">
		        <div class="login_inner wrap_content" role="main">
		            <form id="login_frm" name="login_frm" class="login_frm" method="post" action="${pageContext.request.contextPath}/loginProcess.do">
		                <div class="login_form_wrap login_input_wrap swIdFind">
		                    <div class="pc_keyboard_wrap tab_panel" id="keyboard_wrap" style="display: block;"  role="tabpanel" aria-label="회원">
		                        <div class="pc_keyboard_fold">         
		                        </div>
		                        <div class="pc_keyboard" id="keyboard_view" style="display: none;">
		                                <img src="https://ssl.pstatic.net/static/nid/login/img-keyboard-dark2.png" id="keyboard_view_image" width="100%" height="100%" alt="PC키보드" class="keyboard_img">
		                        </div>
		                    </div>
		                    <div class="login_form login-form">
		                        <div class="login_box id-input-box">
		                            <div class="input_item" id="input_item_id">
		                                <div class="input_inner">
		                                    <span class="icon_id" id="icon_id"></span>
		                                    <input type="text" id="id" name="userId" accesskey="L" maxlength="41" autocapitalize="none" value="" placeholder="아이디" class="input_text">
		                                </div>                                     
		                            </div>
		                            <div class="input_item" id="input_item_pw">
		                                <div class="input_inner">
		                                    <span class="icon_pw" id="icon_pw"></span>
		                                    <input type="password" id="password" name="userPw" placeholder="비밀번호" class="input_password txt_tool" maxlength="16">
		                                </div>                                      
		                            </div>
		                        </div>
		                    </div>                            
		                    <!-- button -->
		                    <button type="submit" class="btn_check" id="log.login">
		                        <!-- tg-text=btn-text -->
		                        <span type="submit" class="text" id="submit_btn">로그인</span>
		                    </button> 
		                </div>
		            </form>
		        </div>
		    </div>
		</div>
	</div>    	       
</body>
</html>


