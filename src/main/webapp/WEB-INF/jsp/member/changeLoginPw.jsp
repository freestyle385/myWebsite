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
  	<form action="/member/updateLoginPw" method="POST" id="table-wrap">
  		<table id="member-table">
  			<colgroup>
			    <col width="40%"/>
			    <col width="60%"/>
		    </colgroup>
		    <tbody>
		    	<tr>
		    		<th colspan="2">비밀번호 변경</th>
		    	</tr>
		    	<tr>
		    		<th scope="row">이전 비밀번호</th>
		    		<td colspan="2" class="input-td"><input type="password" class="loginPw" name="loginPw" autocomplete="off" placeholder="이전 비밀번호를 입력해주세요."/></td>
		    	</tr>
		    	<tr>
		    		<th scope="row">새 비밀번호</th>
		    		<td colspan="2" class="input-td"><input type="password" class="loginPw" name="newLoginPw" autocomplete="off" placeholder="변경할 비밀번호를 입력해주세요."/></td>
		    	</tr>
		    	<tr>
		    		<th scope="row">새 비밀번호 확인</th>
		    		<td colspan="2" class="input-td"><input type="password" class="loginPw" name="newLoginPwChk" autocomplete="off" placeholder="변경할 비밀번호를 다시 입력해주세요."/></td>
		    	</tr>
		    </tbody>
  		</table>
  	</form>
  	<div id="member-footer">
	    <input type="button" id="back-btn" value="홈으로" onclick="location.href='/'">
	    <input type="button" id="submit-btn" value="변경하기"/>
  	</div>
  	
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$("#submit-btn").on("click", function (e) {
	const loginPw = $('input[name="loginPw"]').val();
	const newLoginPw = $('input[name="newLoginPw"]').val();
	const newLoginPwChk = $('input[name="newLoginPwChk"]').val();
	
	if (loginPw == '' || newLoginPw == '' || newLoginPwChk == '') {
		alert("비밀번호가 입력되지 않았습니다.");
		return;
	} else if (newLoginPw != newLoginPwChk) {
		alert("비밀번호를 정확하게 입력해주세요.");
		return;
	}
	
  	$("#table-wrap").submit();
});

</script>

</body>
</html>