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
<link rel="stylesheet" type="text/css" href="/resource/css/board-style.css">
<link rel="stylesheet" type="text/css" href="/resource/css/comment-style.css">

</head>

</body>
<article>
<section id="detail-wrap">
  <div id="table-wrap">
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
	        <th scope="row">제목</th>
	        <td colspan="6"><span id="title-span">${detailRd.getData().getTitle()}</span></td>
	      </tr>
	      <tr>
	        <td colspan="6">${detailRd.getData().getBody()}</td>
	      </tr>
	    </tbody>
  	</table>
  </div>
  
  <c:if test="${detailRd.getData().getHashtag().length() > 0}">
  <div id="board-hashtag">
  	<div id="tag-wrap">
	    <!--  해시태그 목록   -->
	    <ul id="tag-list">
	    	<!-- jstl fn을 활용해 태그 문자열 split -->
	    	<c:forEach var="tagValue" items="${fn:split(detailRd.getData().getHashtag(), ',')}">
	    		<li class="tag-item">#${tagValue}</li>
	    	</c:forEach>
	    </ul>
  	</div>
  </div>
  </c:if>
  
  <div id="board-footer">
    <input type="button" class="back-btn" value="목록으로" onclick="location.href='/board/list'">
    <c:if test="${loginStatus.getLoginedMemberId() == detailRd.getData().getMemberId()}">
    <div id="btn-wrap">
    	<div id="modify-btn"><a href="/board/modify?boardId=${detailRd.getData().getBoardId()}">수정하기</a></div>
    	<div id="delete-btn"><a onclick="if (confirm('해당 글을 삭제하시겠습니까?') == false) {return false};" href="/board/doDelete?boardId=${detailRd.getData().getBoardId()}">삭제하기</a></div>
    </div>
    </c:if>
  </div>
</section>  

<section id="etc-wrap">
	<div id="comm-wrap">
		<div id="comm-count"><span id="get-count"></span> Comments</div>
		<div id="comm-write-box">
			<c:set var="loginedMember" value="${loginStatus.getLoginedMember()}"/>
			<form method="POST" class="comm-form">
				<input type="hidden" name="boardId" value="${detailRd.getData().getBoardId()}"/>
				<input type="hidden" name="memberId" value="${loginStatus.getLoginedMemberId()}"/>
				<div class="comm-write"><textarea name="commBody" autocomplete="off" placeholder="${loginedMember == null ? '로그인 후 이용해주세요.' : '댓글을 입력해주세요.'}"></textarea></div>
			</form>
			<div id="comm-form-btn">
				<c:if test="${loginedMember != null}">
				<input type="button" id="comm-write-btn" value="저장"/>
				</c:if>
				<c:if test="${loginedMember == null}">
				<input type="button" id="empty-btn" value="저장"/>
				</c:if>
			</div>
		</div>
		<div id="list-box">
			<ul id="comm-list"></ul>
		</div>
	</div>
	
</section>  
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$(document).ready(function () {
	// 페이지 로딩 시 댓글 리스트 출력
	getCommList();
	
});

$("#comm-write-btn").on("click", function (e) {
	// form 내용을 넣어 doCommentWrite ajax로 넘김
	let insertData = $(".comm-form").serialize();
    doCommWrite(insertData);
});

$("#empty-btn").on("click", function (e) {
	alert("로그인 후 이용해주세요.");
	$('[name=commBody]').val('');
});

// 댓글 리스트 불러오기
function getCommList() {
	let boardId = $("input[name=boardId]").val();
	let loginedMemberId = $("input[name=memberId]").val();
	$.ajax({
		type : "GET",
		url : "/comment/list",
		data : {
			"boardId" : boardId
		},
		success : function(data) {
			$("#comm-list").empty();
			
            $.each(data, function(key, value) { 
            	
				let str = '<li class="comm-item"><div class="comm-writer">' + value.memberId + '</div>';
				str += '<div class="comm-body content' + value.commId + '">' + value.commBody + '</div>';
				str += '<div class="regDate-btn-wrap"><div class="comm-regDate">' + value.regDate + '</div>';
				if (loginedMemberId == value.memberId) {
					str += '<div class="comm-btn-box comm-btn-box-' + value.commId + '"><a class="comm-btn btn1-' + value.commId + '" onclick="showCommModify(' + value.commId + ',\'' + value.commBody + '\');">수정</a>';
					str += '<a class="comm-btn btn2-' + value.commId + '" onclick="doCommDelete(' + value.commId + ');">삭제</a></div></div></li>';
				} else {
					str += '</div></li>';
				}
				
				$("#comm-list").append(str);
            });

		},
		error : function() {
			alert('다시 시도해주세요.');
		}
	})
	
	$.ajax({
		type : "GET",
		url : "/comment/getCommentsCount",
		data : {
			"boardId" : boardId
		},
		success : function(data) {
			$("#get-count").empty();
			$("#get-count").append(data);		
		},
		error : function() {
			alert('다시 시도해주세요.');
		}
	})
}

// 댓글 저장
function doCommWrite(insertData) {
    $.ajax({
        url : '/comment/doWrite',
        type : 'post',
        data : insertData,
        success : function(data) {
            if(data == 1) {
            	// 댓글 작성 후 댓글 목록 reload
            	getCommList(); 
                $('[name=commBody]').val('');
            }
        },
    	error : function() {
			alert('다시 시도해주세요.');
		}
    });
}

// 댓글 수정화면
function showCommModify(commId, commBody) {
	
	let a = '<div class="comm-form"><div class="comm-write"><textarea name="commBody-' + commId + '" autocomplete="off" placeholder="댓글을 입력해주세요.">' + commBody + '</textarea></div></div>';
	let b = '<div class="comm-btn-box comm-btn-box-' + commId + '"><a class="comm-btn btn1-' + commId + '" onclick="doCommModify(' + commId + ');">저장</a>';
	b += '<a class="comm-btn btn2-' + commId + '" onclick="getCommList();">취소</a></div>';
	
    $('.content' + commId).html(a);
    $('.btn1-' + commId).remove();
    $('.btn2-' + commId).remove();
    $('.comm-btn-box-' + commId).html(b);
    
}
 
// 댓글 수정
function doCommModify(commId) {
    let updateContent = $('[name=commBody-' + commId + ']').val();
    
    $.ajax({
        url : '/comment/doModify',
        type : 'post',
        data : {
        	'commId' : commId,
        	'commBody' : updateContent
        },
        success : function(data){
        	// 댓글 수정 후 댓글 목록 reload
            if(data == 1) {
            	getCommList();  
            }
        },
        error : function() {
        	alert('다시 시도해주세요.');
		}
    });
}

// 댓글 삭제 
function doCommDelete(commId){
    
	if (confirm('해당 댓글을 삭제하시겠습니까?') == false) {
		return false;
	};
	
	$.ajax({
        url : '/comment/doDelete',
        type : 'post',
        data : {
        	'commId' : commId
        },
        success : function(data){
        	// 댓글 삭제 후 댓글 목록 reload
            if(data == 1) {
            	getCommList();  
            }
        }
    });
}

</script>

</body>
</html>