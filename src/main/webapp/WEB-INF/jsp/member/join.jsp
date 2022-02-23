<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HYS's Portfolio</title>
<!-- header.jspf 불러오기 -->
<%@ include file="../common/header.jspf"%>

<!-- css / js -->
<link rel="stylesheet" type="text/css" href="/resource/css/join.css">

</head>

</body>
<article>
  <section id="join-wrap">
  	<form action="/member/doSignUp" method="POST" id="table-wrap">
  		<table id="member-table">
  			<colgroup>
			    <col width="30%"/>
			    <col width="55%"/>
			    <col width="25%"/>
		    </colgroup>
		    <tbody>
		    	<tr>
		    		<th scope="row">이메일</th>
		    		<td class="input-td"><input type="text" id="loginId" name="loginId" autocomplete="off" placeholder="이메일을 입력해주세요."/></td>
		    		<td class="btn-td"><input type="button" class="chk-btn" value="중복확인"/></td>
		    	</tr>
		    	<tr>
		    		<th scope="row">이메일 인증</th>
		    		<td class="input-td"><input type="text" id="cert-num" name="loginIdCert" autocomplete="off" placeholder="인증번호를 입력해주세요."/></td>
		    		<td class="btn-td"><input type="button" class="chk-btn" value="인증하기"/></td>
		    	</tr>
		    	<tr>
		    		<th scope="row">비밀번호</th>
		    		<td colspan="2" class="input-td"><input type="password" class="loginPw" name="loginPw" autocomplete="off" placeholder="비밀번호를 입력해주세요."/></td>
		    	</tr>
		    	<tr>
		    		<th scope="row">비밀번호 확인</th>
		    		<td colspan="2" class="input-td"><input type="password" class="loginPw" name="loginPwChk" autocomplete="off" placeholder="비밀번호를 다시 입력해주세요."/></td>
		    	</tr>
		    </tbody>
  		</table>
  	</form>
  	<div id="member-footer">
	    <input type="button" id="back-btn" value="홈으로" onclick="location.href='/'">
	    <input type="button" id="submit-btn" value="가입"/>
  	</div>
  </section>
</article>

<script>
$("#submit-btn").on("click", function (e) {
	const loginId = $('input[name="loginId"]').val();
	const loginIdCert = $('input[name="loginIdCert"]').val();
	const loginPw = $('input[name="loginPw"]').val();
	const loginPwChk = $('input[name="loginPwChk"]').val();
	
	if (loginId == '') {
		alert("이메일이 입력되지 않았습니다.");
		return;
	} else if (!ChkEmail(loginId)) {
		alert("이메일 형식이 올바르지 않습니다.");
		return;
	} else if (loginIdCert == '') {
		alert("인증번호가 입력되지 않았습니다.");
		return;
	} else if (loginPw == '' || loginPwChk == '') {
		alert("비밀번호를 확인해주세요.");
		return;
	} else if (loginPw != loginPwChk) {
		alert("비밀번호를 정확하게 입력해주세요.");
		return;
	}
	
  	$("#table-wrap").submit();
});

// 이메일 형식 체크 
function ChkEmail(str) {                                                 
     let chkEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

     if(!chkEmail.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}                 

</script>

<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>
</body>
</html>