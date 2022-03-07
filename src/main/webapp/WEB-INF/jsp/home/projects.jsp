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
<link rel="stylesheet" type="text/css" href="/resource/css/home-style.css">
</head>

</body>
<article>
  <section id="projects-wrap">
    <div id="main-title"><span>Projects</span></div>
    
    <div class="info-wrap">
      <div class="info-title">My Website (개인 프로젝트)</div>
      <div class="sub-title">
      	<span>1. 시연 영상</span>
      </div>
      <div class="sub-body">
		
      </div>
      <div class="sub-title">
      	<span>2. 프로젝트 소개</span>
      </div>
      <div class="sub-body">
      	<div class="sub-body-1">
      		<span>현재 접속하고 계신 이 웹사이트에 해당하는 프로젝트입니다.<br/>포트폴리오만을 위한 정적 웹사이트가 아닌, 내가 원하는 기능들을 추가한 나만의 웹사이트를 만들고 싶었습니다.<br/>게시판은 기술블로그 활용을 목적으로 구상하였고, 학원에서 배웠던 기본 CRUD 구현을 토대로 각종 부가 기능을 넣어보았습니다.</span>
      	</div>
      	<div class="sub-body-2">
      		<table>
	      		<colgroup>
				    <col width="50%"/>
				    <col width="50%"/>
			    </colgroup>
			    <tbody>
			    	<tr>
			    		<th scope="row">&#128504; 주요 기능</th>
			    		<td>프로필 요약 및 자기소개서<br/>프로젝트 소개 및 아카이브 링크<br/>게시판 CRUD와 댓글 CRUD(ajax)<br/>해시태그와 키워드로 게시물 조회<br/>게시판 이용을 위한 회원 가입/탈퇴<br/>무분별한 계정 생성을 막기 위한 계정(이메일) 인증<br/>원활한 계정 이용을 위한 비밀번호 찾기/변경</td>
			    	</tr>
			    	<tr>
			    		<th scope="row">&#128504; Front-end</th>
			    		<td>HTML, CSS, JS, JQuery</td>
			    	</tr>
			    	<tr>
			    		<th scope="row">&#128504; Back-end</th>
			    		<td>Spring Framework, JSP</td>
			    	</tr>
			    	<tr>
			    		<th scope="row">&#128504; Database</th>
			    		<td>MySql</td>
			    	</tr>
			    	<tr>
			    		<th scope="row">&#128504; Deployment</th>
			    		<td>Naver Cloud Platform</td>
			    	</tr>
			    </tbody>									
      		</table>
      	</div>
      </div>
      <div class="sub-title">
        <span>3. 프로젝트 개발노트</span>
      </div>
      <div class="sub-body">
      	<a href="https://www.notion.so/MyWebsite-fba5c755de4c4a2297915775be5b35ea" target="_blank">MyWebsite 개발노트(Notion) 바로가기</a>
      </div>
    </div>
    
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$(document).ready(function(){
	  $("#open-btn").click(function(){
	    $("#etc-wrap").slideDown(1000, function() {
	      $("#etc-wrap").addClass("active");
	    });
	    $(this).removeClass("active");
	    $("#close-btn").addClass("active");
		})
		$("#close-btn").click(function(){
	    $("#etc-wrap").slideUp(1000, function() {
	      $("#etc-wrap").removeClass("active");
	    });
	    $(this).removeClass("active");
	    $("#open-btn").addClass("active"); 
	  })
});
</script>

</body>
</html>