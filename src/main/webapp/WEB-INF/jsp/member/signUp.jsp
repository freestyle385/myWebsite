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
		    		<td class="btn-td"><input type="button" id="loginId-chk-btn" class="chk-btn" value="중복확인"/></td>
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
  		<input type="hidden" name="loginIdChk" value="0"/>
  	</form>
  	<div id="member-footer">
	    <input type="button" id="back-btn" value="홈으로" onclick="location.href='/'">
	    <input type="button" id="submit-btn" value="회원가입"/>
  	</div>
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$("#loginId-chk-btn").on("click", function (e) {
	const loginId = $('input[name="loginId"]').val();
	ChkDupLoginId(loginId);
});

$("#submit-btn").on("click", function (e) {
	const loginIdChk = $('input[name="loginIdChk"]').val();
	const loginPw = $('input[name="loginPw"]').val();
	const loginPwChk = $('input[name="loginPwChk"]').val();
	
	if (loginIdChk == 0) {
		alert("이메일 중복확인을 진행해주세요.");
		return;
	} else if (loginPw == '' || loginPwChk == '') {
		alert("비밀번호가 입력되지 않았습니다.");
		return;
	} else if (loginPw != loginPwChk) {
		alert("비밀번호를 정확하게 입력해주세요.");
		return;
	}
	
  	$("#table-wrap").submit();
});

//이메일 중복 체크
function ChkDupLoginId(loginId) {
	if (loginId == '') {
		alert("이메일이 입력되지 않았습니다.");
		return;
	} else if (!ChkEmail(loginId)) {
		alert("이메일 형식이 올바르지 않습니다.");
		return;
	}
	
	$.ajax({
        url : '/member/emailDuplChk',
        type : 'post',
        data : {
			"loginId" : loginId
		},
        success : function(data) {
            if(data > 0) {
            	alert("이미 가입되어 있는 이메일입니다.");
            	return;
                
            } else {
            	$('input[name=loginIdChk]').empty();
                $('input[name=loginIdChk]').val("1");
                alert("가입 가능한 이메일입니다.");
                $("#loginId").attr("readonly", true);
                $("#loginId").css("color", "#a6a6a6");
                $("#loginId-chk-btn").attr("disabled", true);
                $("#loginId-chk-btn").css("backgroundColor", "#a6a6a6");
                $("#loginId-chk-btn").css("cursor", "default");
            }
        },
    	error : function() {
			alert('다시 시도해주세요.');
		}
    });
}

// 이메일 형식 체크 
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