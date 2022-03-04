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
<link rel="stylesheet" type="text/css" href="/resource/css/main.css">
</head>

</body>
<article>
  <section id="welcome-wrap">
    <div id="welcome-msg">
      <div><span>안녕하세요.</span></div>
      <div id="msg-slider">
          <div class="msg">
            <span>사람들과 소통하고 교류하는 것을 좋아하는,</span>
          </div>
          <div class="msg">
            <span>체계를 기획하고 정리하는 것을 좋아하는,</span>
          </div>
          <div class="msg">
            <span>자기객관화를 통해 상황을 분석하는,</span>
          </div>
      </div>
      <div><span>신입 백엔드 개발자 허윤석입니다.</span></div>
    </div>
  </section>

  <section id="summary-wrap">
    <div id="summary-title"><span>SUMMARY</span></div>
    <div id=summary-body>
      <div class="info-wrap">
        <div class="info-title"><span>PERSONAL INFO</span></div>
        <div id="personal-body">
          <div id="profile">
          <div id="profile-img"><img src="/resource/img/HeoYoonseok.jpg" alt="증명사진"></div>
          <div id="profile-body">
            <p>허윤석</p>
            <p>1992.01.12.</p>
            <p>건양대학교 운동처방학과 졸</p>
          </div>
          </div>
          <div id="contact">
            <div>
              <h4>ADDRESS</h4>
              <p>대전광역시 유성구</p>
            </div>
            <div>
              <h4>EMAIL</h4>
              <p>freestyle385@gmail.com</p>
            </div>
            <div>
              <h4>PHONE</h4>
              <p>010-2432-4583</p>
            </div>
          </div>
        </div>
      </div>
      
      <div class="info-wrap">
        <div class="info-title"><span>CERTIFICATION</span></div>
        <div id="cert-body">
          <div id="cert-left">
            <span>SBS아카데미 웹개발자 과정 수료</span><br>
            <span>(2021.05. ~ 2021.12.)</span>
          </div>
          <div id="cert-right">
            <span>정보처리기사 취득</span><br>
            <span>(2021년도 1회)</span>
          </div>
        </div>
      </div>
      
      <div id="skill-info" class="info-wrap">
        <div class="info-title"><span>SKILLS</span></div>
        <div id="skill-body">
          <div id="skill-fe" class="skill-logo">
          	<img src="/resource/img/fe_logo_1.png" style="height: 80px;"/>
          	<img src="/resource/img/fe_logo_2.png" style="height: 80px;"/>
          </div>
          <div id="skill-be">
          	<div id="skill-be-1" class="skill-logo">
          	<img src="/resource/img/be_logo_1.png" style="height: 80px;"/>
          	<img src="/resource/img/be_logo_2.svg" style="height: 80px;"/>
          	<img src="/resource/img/be_logo_3.png" style="height: 80px;"/>
          </div>
          <div id="skill-be-2" class="skill-logo">
          	<img src="/resource/img/be_logo_4.png" style="height: 80px;"/>
          	<img src="/resource/img/be_logo_5.png" style="height: 80px;"/>
          </div>
          </div>
          <div id="skill-devops" class="skill-logo">
          	<img src="/resource/img/devops_logo_1.png" style="height: 80px;"/>
          </div>
        </div>
      </div>
    </div>
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$(document).ready(function(){
	// welcome-msg 애니메이션
	var indexNum = 0;
	  
	setInterval(function(){
	  
	  if(indexNum > 2){
	    indexNum = 0;
	  };
	  
	  $(".msg").removeClass('active');
	  $(".msg").eq(indexNum).addClass('active');
	  
	  indexNum++;
	  
	}, 2500 );
	  
});
</script>

</body>
</html>