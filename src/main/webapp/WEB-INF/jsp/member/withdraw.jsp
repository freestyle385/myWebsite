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
<link rel="stylesheet" type="text/css" href="/resource/css/member-style.css">

</head>

</body>
<article>
  <section id="login-wrap">
  	<form action="/member/doWithdrawal" method="POST" id="table-wrap">
  		<table id="member-table">
  			<colgroup>
			    <col width="40%"/>
			    <col width="60%"/>
		    </colgroup>
		    <tbody>
		    	<tr>
		    		<th colspan="2">회원 탈퇴를 위해서는 본인 확인이 필요합니다</th>
		    	</tr>
		    	<tr>
		    		<th scope="row">비밀번호</th>
		    		<td colspan="2" class="input-td"><input type="password" class="loginPw" name="loginPw" autocomplete="off" placeholder="비밀번호를 입력해주세요."/></td>
		    	</tr>
		    </tbody>
  		</table>
  	</form>
  	<div id="member-footer">
	    <input type="button" id="back-btn" value="홈으로" onclick="location.href='/'">
	    <input type="button" id="widhdrawal-btn" value="회원탈퇴"/>
  	</div>
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$("#widhdrawal-btn").on("click", function (e) {
	const loginPw = $('input[name="loginPw"]').val();
	
	if (loginPw == '') {
		alert("비밀번호가 입력되지 않았습니다.");
		return;
	}
	
	if (confirm('회원 탈퇴를 하시겠습니까?') == false) {
		return false;
	};
	
  	$("#table-wrap").submit();
});

//이메일 형식 체크 
function ChkEmail(str) {                                                 
     const chkEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

     if(!chkEmail.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}      
</script>

</body>
</html>