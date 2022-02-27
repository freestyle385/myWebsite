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
  	<form action="/member/findLoginPw" method="POST" id="table-wrap">
  		<table id="member-table">
  			<colgroup>
			    <col width="40%"/>
			    <col width="60%"/>
		    </colgroup>
		    <tbody>
		    	<tr>
		    		<th colspan="2">입력하신 아이디로 임시 비밀번호가 발송됩니다</th>
		    	</tr>
		    	<tr>
		    		<th scope="row">아이디</th>
		    		<td colspan="2" class="input-td"><input type="text" id="loginId" name="loginId" autocomplete="off" placeholder="이메일을 입력해주세요."/></td>
		    	</tr>
		    </tbody>
  		</table>
  	</form>
  	<div id="member-footer">
	    <input type="button" id="back-btn" value="홈으로" onclick="location.href='/'">
	    <input type="button" id="submit-btn" value="코드발송"/>
  	</div>
  	
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$("#submit-btn").on("click", function (e) {
	const loginId = $('input[name="loginId"]').val();
	
	if (loginId == '') {
		alert("아이디가 입력되지 않았습니다.");
		return;
	} else if (!ChkEmail(loginId)) {
		alert("이메일 형식이 올바르지 않습니다.");
		return;
	}
	
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