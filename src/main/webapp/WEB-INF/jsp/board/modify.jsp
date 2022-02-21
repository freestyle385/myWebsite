<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="/resource/js/modify-hashtag.js"></script>
<script src="/resource/js/summernote.js"></script>

</head>

</body>
<article>
<section id="modify-wrap">
	<form action="/board/doModify" method="POST" id="table-wrap">
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
		          <th scope="row">글번호</th>
		          <td>${detailRd.getData().getBoardId()}</td>
		          <th scope="row">작성일</th>
		          <td>${detailRd.getData().getRegDate()}</td>
		          <th scope="row">조회수</th>
		          <td>${detailRd.getData().getHitCnt()}</td>
		     	</tr>
			    <tr>
		          <th scope="row" id="title-td">제목</th>
		          <td colspan="4" id="input-td"><input type="text" id="title" name="title" autocomplete="off" value="${detailRd.getData().getTitle()}" placeholder="제목을 입력해주세요."/></td>
		          <td colspan="1" id="byte-td"><div id="byte-box"><span id="nowByte">0</span> / 100 byte</div></td>
		        </tr>
		        <tr>
		          <td colspan="7" id="body-td" colspan="3">
		            <textarea id="summernote" name="body">${detailRd.getData().getBody()}</textarea>
		          </td>
		        </tr>
	        </tbody>
	  	</table>
	  	<input type="hidden" value="${detailRd.getData().getBoardId()}" name="boardId" />
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
	    <ul id="tag-list">
	    	<c:if test="${detailRd.getData().getHashtag() != ''}">
	    	<!-- jstl fn을 활용해 태그 문자열 split -->
	    	<c:forEach var="tagValue" items="${fn:split(detailRd.getData().getHashtag(), ',')}" varStatus="status">
	    		<li class="tag-item">#${tagValue}<span class='del-btn' idx="${status.index}"> x</span></li>
	    	</c:forEach>
	    	</c:if>
	    </ul>
  	  </div>
    </div>
    <div id="board-footer">
  		<input type="button" class="back-btn" value="목록으로" onclick="location.href='/board/list'">
  		<input type="button" class="submit-btn" value="저장">
    </div>
</section>  

</article>

<script>
// 제목 input 입력 후 엔터로 인한 submit 방지
$('input[name="title"]').keydown(function(e) {
	  if (e.keyCode === 13) {
	    e.preventDefault();
	  };
});

//제목 글자 수 체크
$("#input-td > input").on("keyup", fn_checkByte);

$(document).ready(function(){
	  //외부. 수정 이전에 생성된 태그 문자열을 split
	  const oldTag = "${detailRd.getData().getHashtag()}";
	  var oldTagList = new Array();
	  
	  if(oldTag != ''){
		  oldTagList = oldTag.split(',');
	  }
	  
	  // 외부. tag 생성을 위한 배열
	  var tag = new Array();
	  var counter = 0;
	  
	  // 외부. oldTagList를 tag 배열에 반영하고 그 다음부터 인덱스 계산
	  tag = tag.concat(oldTagList);
	  counter += oldTagList.length;
	
	  // 외부. 입력한 값을 tag로 생성
	  function addTag (value) {
	    tag[counter] = value; // 태그를 Object 안에 추가
	    counter++; // 태그 생성 시 같이 생성되는 del-btn의 id
	  }
	
	  // 내부. tag 배열의 값들을 value 배열로 저장
	  function marginTag () {
	    return Object.values(tag).filter(function (word) {
	      return word !== "";
	    });
	  }
	  
	  // 외부. 태그 추가 이벤트
	  $("#tag").on("keyup", function (e) {
	    // 키보드에 입력된 값
		var self = $(this);
	
	    // 엔터를 눌렀을 때 실행
	    if (e.key === "Enter") {
	      // self의 값 가져오기
	      var tagValue = self.val().trim(); 
		
	      // tagValue가 빈 칸이면 태그 추가X
	      if (tagValue == ""){
	    	  alert("올바르지 않은 태그입니다.");
	    	  return;
	      } else {
	        // result는 tag 배열의 값과 새로 입력된 태그가 같은지 검사(===)
	        // 있다면 result에 tagValue 추가X, 없다면 tagValue 추가
	        var result = Object.values(tag).filter(function (word) {
	          return word === tagValue;
	        });
	
	        // result에 따라 addTag 함수 실행 또는 반려
	        if (result.length == 0) { 
	          $("#tag-list").append("<li class='tag-item cell'>"+"#"+tagValue+"<span class='del-btn' idx='"+counter+"'> x</span></li>");
	          addTag(tagValue);
	          self.val("");
	        } else {
	          alert("이미 존재하는 태그입니다.");
	          return;
	        }
	      } 
	    
	      e.preventDefault(); // 스페이스바로 빈 공간이 생기지 않도록 방지
	    }
	  });
	
	  // 외부. 태그 삭제 이벤트 
	  // 인덱스를 찾아내 li 삭제 및 tag 배열에서 값 삭제
	  $(document).on("click", ".del-btn", function (e) {
		var index = $(this).attr("idx");
	    tag[index] = "";
	   
	    $(this).parent().remove();
	  });
	  
	  // 내부. 게시물 저장 버튼 클릭 시 tag값들을 같이 넘겨줌
	  $(".submit-btn").on("click", function (e) {
	    // marginTag 데이터를 hidden input에 문자열로 적용
	    var value = marginTag().toString();
	    $("#rdTag").val(value);
		
	    $("#table-wrap").submit();
	  });
});

</script>

<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>
</body>
</html>