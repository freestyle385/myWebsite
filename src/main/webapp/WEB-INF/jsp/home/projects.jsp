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
  <section id="archive-wrap">
  	<div id="archive-info" class="info-wrap">
  		<div class="archive-content">
  			<div class="archive-title">Github</div>
  			<div class="archive-link"><a href="https://github.com/freestyle385" target="_blank">github.com/freestyle385</a></div>
  			<div class="archive-body">학원 수강 내용, 프로젝트 소스 코드</div>
  		</div>
  		<div class="archive-content">
  			<div class="archive-title">Tistory</div>
  			<div class="archive-link"><a href="https://freestyle385.tistory.com/" target="_blank">freestyle385.tistory.com</a></div>
  			<div class="archive-body">습득한 지식을 정리하는 블로그</div>
  		</div>
  		<div class="archive-content">
  			<div class="archive-title">Codepen</div>
  			<div class="archive-link"><a href="https://to2.kr/cBj" target="_blank">to2.kr/cBj</a></div>
  			<div class="archive-body">학원 수강 중 필기 내용<br/>(블로그에 통합 예정)</div>
  		</div>
  	</div>
  	
  </section>
  <section id="projects-wrap">
    <div class="main-title"><span>Projects</span></div>
    
    <div class="info-wrap">
      <div class="info-title">My Website (개인 프로젝트)</div>
      <div class="sub-title">
      	<span>1. 시연 영상</span>
      </div>
      <div class="sub-body">
		<video autoplay controls loop muted src="/resource/video/MyWebsite_video.mp4"></video>
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
    
    <div class="info-wrap">
      <div class="info-title">포켓카드노트 (팀 프로젝트)</div>
      <div class="sub-title">
      	<span>1. 시연 영상</span>
      </div>
      <div class="sub-body">
		<video autoplay controls loop muted src="/resource/video/MyPocketCardNote_video.mp4"></video>
      </div>
      <div class="sub-title">
      	<span>2. 프로젝트 소개</span>
      </div>
      <div class="sub-body">
      	<div class="sub-body-1">
      		<span>면접 대비 또는 자격증 시험을 준비하면서, 나만의 주관식 문제를 쉽게 정리하고 풀어볼 수 있으면 어떨까하는 생각에서 아이디어를 착안하였습니다. 따라서 전반적인 디자인이나 기능 또한, 단어장으로 쓰일 법한 작은 포켓노트와 포스트잇을 떠올리며 구상하였습니다.<br/>주 역할로는 아이디어 구상부터 화면 설계 전반 및 기능 설계 일부, 프론트엔드 개발을 담당하였습니다. 그리고 Git Branch를 관리하고 프론트-백엔드 간의 요구사항을 조율하며 협업을 원활하게 이루어가는 연습을 하는 데 초점을 맞추었습니다.<br/>비록 JSP를 활용하면서 완전한 프론트엔드 개발을 경험하지는 못 했지만, 서버와 브라우저 간 유기적인 데이터 통신에 있어서 잘 협의된 데이터 포맷이 중요하다는 점을 프론트엔드의 관점에서 느껴볼 수 있었습니다.</span>
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
			    		<td>최근 생성한 해시태그 목록, 학습 상태 확인<br/>카드 CRUD, 해시태그와 학습 상태, 키워드 검색<br/>다수 카드의 학습 상태 일괄 변경 및 각 카드별 학습 상태 변경<br/>각 카드별 문제를 보고 연습 풀이 후 정답 확인<br/>카카오 계정을 통한 회원가입/탈퇴<br/>내 회원정보 보기</td>
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
      	<a href="https://www.notion.so/82309d64fd34459f99c2dc7130aca385" target="_blank">포켓카드노트 개발노트(Notion) 바로가기</a>
      </div>
    </div>
    
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>

</script>

</body>
</html>