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

<!-- 섬머노트 -->
<script src="/resource/js/summernote/summernote-lite.js"></script>
<script src="/resource/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resource/css/summernote/summernote-lite.css">

<!-- css / js -->
<link rel="stylesheet" type="text/css" href="/resource/css/write.css">
<script src="/resource/js/write-checkByte.js"></script>

</head>

</body>
<article>
  <section id="write-wrap">
    <form action="/board/doWrite?memberId=1&" method="POST" id="write-form">
      <table id="board-write">
        <tr id="title-tr">
          <td id="title-td">제목</td>
          <td id="input-td"><input type="text" id="title" name="title" autocomplete="off" placeholder="제목을 입력해주세요."/></td>
          <td id="byte-td"><div id="byte-box"><span id="nowByte">0</span> / 100 byte</div></td>
        </tr>
        <tr>
          <td colspan="3">
            <textarea id="summernote" name="body"></textarea>
          </td>
        </tr>
      </table>
      <input type="submit" id="submit" value="저장" class="btn">
	  </form>
  </section>
</article>

<script>
$(document).ready(function() {
	// 썸머노트 에디터 불러오기 및 툴바 세팅
	$('#summernote').summernote({
		  height: 300,                 
		  minHeight: 200,           
		  maxHeight: null,             
		  focus: true,
		  lang: "ko-KR",				
		  placeholder: '자유롭게 글을 작성할 수 있습니다.',
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
});

// 제목 글자 수 체크
$("#input-td > input").on("keyup", fn_checkByte);

</script>

<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>
</body>
</html>