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
<link rel="stylesheet" type="text/css" href="/resource/css/list.css">
</head>

</body>
<article>
  <section id="search-wrap">
    <form action="/board" method="GET" id="search-form">
      <!-- 해시태그 필터 -->
      <div id="filter-wrap">
        <div id="filter-name"><span>해시태그 필터</span></div>
        <div id="filter-select">
          <select name="hashtag">
            <option value="" ${searchedTag == "" ? 'selected' : ''}>전체 선택</option>
            <c:if test="${allHashTag != null}">
              <c:forEach var="hashTag" items="${allHashTag}">
                <option value="${hashTag}" ${searchedTag == hashTag ? 'selected' : ''}>${hashTag}</option>
              </c:forEach>
            </c:if>
          </select>
        </div>
      </div>
      <!-- 검색창 -->
      <div id="searchKeyword-box">
        <input name="searchKeyword" value="${searchedKeyword}" placeholder="키워드를 검색해보세요."/>
      <button type="submit" class="search-btn">
          <svg aria-hidden="true" data-prefix="fas" data-icon="search" class="search_svg__svg-inline--fa search_svg__fa-search search_svg__fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.3rem" height="1.3rem"><path d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg>
      </button>
      </div>
    </form>  
  </section>
  
  <section id="list-wrap">
    <div id="list-header"></div>
    <table id="board-list">
	        <colgroup>
	            <col width="15%"/>
	            <col width="*"/>
	            <col width="25%"/>
	            <col width="10%"/>
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col">글번호</th>
	                <th scope="col">제목</th>
	                <th scope="col">작성일</th>
	                <th scope="col">조회수</th>
	            </tr>
	        </thead>
	        <tbody>
	          <c:forEach var="board" items="${listRd.getData()}">
              <tr>
                <td>${board.boardId}</td>
                <td class="title"><a href="#">${board.title}</a></td>
                <td>${board.regDate}</td>
                <td>${board.hitCnt}</td>
              </tr>
            </c:forEach>
	        	<c:if test="${listRd.getData().size() == 0}">
              <tr>
                <td colspan="4">조회된 결과가 없습니다.</td>
              </tr>
            </c:if>
	        </tbody>
	    </table>
	    <div id="list-footer">
        <div id="write-btn"><a href="#">글쓰기</a></div>
        <nav id="page-nav">
          <ul>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
          </ul>
        </nav>
        <div class="empty-btn"></div>
      </div>
  </section>
</article>

<script>

</script>

<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>
</body>
</html>