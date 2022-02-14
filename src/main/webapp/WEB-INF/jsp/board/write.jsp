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
<link rel="stylesheet" type="text/css" href="/resource/css/write.css">

</head>

</body>
<article>
  <section id="write-wrap">
    <form action="/board/doWrite?memberId=1&" method="POST" id="write-form" enctype="multipart/form-data">
      <table id="board-write">
        <tr>
          <td>제목</td>
          <td><input type="text" id="title" name="title"/></td>
        </tr>
        <tr>
          <td colspan="2">
            <textarea id="body" name="body"></textarea>
          </td>
        </tr>
      </table>
      <input type="file" id="files" name="files" multiple="multiple">
      <input type="submit" id="submit" value="저장" class="btn">
	  </form>
  </section>
</article>

<script>

</script>

<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>
</body>
</html>