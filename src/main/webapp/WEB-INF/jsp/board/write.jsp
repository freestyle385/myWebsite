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
<link rel="stylesheet" type="text/css" href="/resource/css/board-style.css">
<script src="/resource/js/checkByte.js"></script>
<script src="/resource/js/write-hashtag.js"></script>
<script src="/resource/js/summernote.js"></script>

</head>

</body>
<article>
  <section id="write-wrap">
    <form action="/board/doWrite" method="POST" id="table-wrap">
      <table id="board-table">
      	<colgroup>
	      <col width="20%"/>
	      <col width="10%"/>
	      <col width="20%"/>
	      <col width="20%"/>
	      <col width="20%"/>
	      <col width="10%"/>
	    </colgroup>
	    <tbody>
	        <tr>
	          <th scope="row" id="title-td">제목</th>
	          <td colspan="4" id="input-td"><input type="text" id="title" name="title" autocomplete="off" placeholder="제목을 입력해주세요."/></td>
	          <td colspan="1" id="byte-td"><div id="byte-box"><span id="nowByte">0</span> / 100 byte</div></td>
	        </tr>
	        <tr>
	          <td colspan="7" id="body-td" colspan="3">
	            <textarea id="summernote" name="body"></textarea>
	          </td>
	        </tr>
        </tbody>
      </table>

      <!-- 게시물 저장 시 함께 넘겨줄 tag값들을 위한 hidden input -->
      <input type="hidden" value="" name="hashtag" id="rdTag"/>
	 </form>
	 
	 <div id="board-hashtag">
	   <div id="msg"><span>*입력 후 엔터를 누르면 적용</span></div>
       <div id="tag-wrap">
	      <div id="tag-input">
	        <input type="text" id="tag" placeholder="추가할 해시 태그"/>
	      </div>
	  
	      <!--  해시태그 목록   -->
	      <ul id="tag-list"></ul>
  	   </div>
	 </div>
	 
	 <div id="board-footer">
      	<input type="button" class="back-btn" value="목록으로" onclick="location.href='/board/list'">
      	<input type="button" class="submit-btn" value="저장">
     </div>
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
// 제목 글자 수 체크
$("#input-td > input").on("keyup", fn_checkByte);

// 제목 input 입력 후 엔터로 인한 submit 방지
$('input[name="title"]').keydown(function(e) {
	  if (e.keyCode === 13) {
	    e.preventDefault();
	  };
});

</script>

</body>
</html>