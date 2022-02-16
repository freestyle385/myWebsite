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

<!-- css / js -->
<link rel="stylesheet" type="text/css" href="/resource/css/detail.css">

</head>

</body>
<article>
<section id="detail-wrap">
  <div id="table-wrap">
  	<table id="board-detail">
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
	        <th scope="row">제목</th>
	        <td colspan="6"><span id="title-span">${detailRd.getData().getTitle()}</span></td>
	      </tr>
	      <tr>
	        <td colspan="6">${detailRd.getData().getBody()}</td>
	      </tr>
	    </tbody>
  	</table>
  </div>
  <div id="detail-tag">
  	<div id="tag-wrap">
	    <!--  해시태그 목록   -->
	    <ul id="tag-list">
	    	<c:if test="${detailRd.getData().getHashtag().length() > 0}">
		    	<!-- jstl fn을 활용해 태그 문자열 split -->
		    	<c:forEach var="tagValue" items="${fn:split(detailRd.getData().getHashtag(), ',')}">
		    		<li class="tag-item">#${tagValue}</li>
		    	</c:forEach>
	    	</c:if>
	    </ul>
  	</div>
  </div>
  <div id="detail-footer">
    <input type="button" class="back-btn" value="목록으로" onclick="location.href='/board/list'">
    <div id="btn-wrap">
    	<div id="delete-btn"><a onclick="if (confirm('카드를 삭제하시겠습니까?') == false) {return false};" href="/board/doDelete?boardId=${detailRd.getData().getBoardId()}">삭제하기</a></div>
    	<div id="modify-btn"><a href="/board/modify?boardId=${detailRd.getData().getBoardId()}">수정하기</a></div>
    </div>
  </div>
</section>  
  
</article>

<script>

</script>

<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>
</body>
</html>