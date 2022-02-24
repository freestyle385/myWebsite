<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HYS's Portfolio</title>
</head>
<body>
  <script type="text/javascript">
    const loginId = '${loginId}';

    alert(loginId + '계정의 인증이 완료되었습니다. 로그인 화면으로 이동합니다.');

    window.open('', '_self', ''); 
    
    self.location = '/member/login';
  </script>
</body>
</html>