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
  <section id="about-wrap">
    <div class="main-title"><span>ABOUT</span></div>
    <div class="open-btn active">개발 외 이력이 궁금하시다면 Click !</div>
    <div class="close-btn">다시 숨기시려면 Click !</div>
    
    <div id="etc-wrap" class="info-wrap">
      <div class="info-title">ETC INFO</div>
      <div class="sub-title">
        <span>1. 학력 사항</span>
      </div>
      <div class="sub-body">
        <span>- 건양대학교 운동처방학과 (현 스포츠의학과) 졸업 (2010.03~2018.02)</span>
      </div>
      <div class="sub-title">
        <span>2. 개발 외 경력 사항</span>
      </div>
      <div class="sub-body">
        <span>- 중부대학교 교육성과분석센터 : 통계 분석 및 행정 (2018.02~2019.02)<br>교육 만족도 조사, 강의평가 등 각종 성과관리 연구의 통계 조사 지원 (SPSS를 활용한 기초통계 수행, 보고서 작성, 연구 조사 마케팅 등), 센터 행정업무 전반<br><br>- 주식회사 데이터메이커 : AI 데이터 가공 프로젝트 선임 매니저 (2019.08~2021.04)<br>아프리카 가나 아크로퐁 데이터랩 구축 참여 (인사 및 행정체계 구축)<br>
가나 AI 데이터 가공 작업자 전용 플랫폼 기획 참여 (가나 크라우드 시스템 구축 및 크라우드 작업자의 채용 자동화, 프로젝트 원격관리 체계화)<br>대기업과 연구원, 스타트업을 고객으로 이미지 라벨링 프로젝트 수행 (데이터바우처 정부 사업 3건 외 일반 의뢰 9건 수행)</span>
      </div>
      <div class="sub-title">
        <span>3. 개발 외 자격 사항</span>
      </div>
      <div class="sub-body">
        <span>- 사회조사분석사 2급<br>- 컴퓨터활용능력 1급<br>- 전산회계 1급<br>- ITQ OA Master (한글, 엑셀, 파워포인트)<br>- 자동차 운전 면허 1종 보통<br>- 생활스포츠지도사 2급</span>
      </div>
      <div class="sub-title">
        <span>4. 기타 대외 활동</span>
      </div>
      <div class="sub-body">
        <span>- 대전 지역 소모임 운영 및 활동 참여 (2018~2022)<br>사교 모임, 취미 모임 (뮤지컬/연극), 봉사 모임 운영 경험<br>2022년 현재 약 2년 동안 봉사 및 기부 활동 진행<br><br>- 건양대학교 홍보대사 (스마트리더) 활동 (2010~2011)<br>대학 수시/정시 입시박람회 참여<br>교내 행사, 캠페인 참여 및 학교 홍보 영상 촬영<br><br>- 대전 아동청소년 자치회 위원 활동 (2009)<br>대전 지역의 청소년 정책 의제 선정<br>청소년 정책 홍보 및 청소년 문화 행사 개최</span>
      </div>
    </div>
    
    <div class="info-wrap">
      <div class="info-title">COVER LETTER</div>
      <div class="sub-title">
        <span>1. '사람들과 소통하고 교류하는 것을 좋아하는,'</span>
      </div>
      <div class="sub-body">
        <span>학창시절부터 현재까지 항상 다양한 그룹에 참여하거나 리드하는 역할을 맡았습니다. 덕분에 그룹 내 다양한 의견과 니즈를 파악하고, 이를 중재하는 역량을 키울 수 있었습니다. 이로써 사내 개발자 동료 및 타 부서와, 혹은 고객사와 원활한 소통을 꾀할 수 있을 것이라 믿습니다. 아래는 다양한 그룹 활동 경험을 대내와 대외, 기타로 분류한 것입니다.<br><br>1. 학창시절 대내활동 : 학급 내 회의와 토론에서 주도적 역할을 하였습니다. 중학교 3학년 재학 중에는 독서토론모임을 개설해, 독서 과제 배분 및 그에 따른 토론 주제 선정과 진행을 맡기도 하였습니다.<br>2. 학창시절 대외활동 : 아동청소년 정책 의제 선정을 위해 1년 간 고교생 자치회 위원으로 활동하였으며, 대학 입학 후에는 1년 6개월 간 홍보 대사로서 캠페인 촬영, 홍보 박람회 행사 등에 참여하였습니다.<br>3. 사회인 대외활동 : 현재는 약 2년 간 봉사활동을 지속하고 있으며, 선한 영향력을 확대하기 위해 ’일상 가치‘라는 봉사 소모임을 운영하고 있습니다.<br>4. 기타 : 웹개발자 과정 수료 후, 자바 기반의 원리적인 내용을 공부하고 팀프로젝트를 경험하고 싶어 스터디를 모집했습니다. 평소 눈여겨 보고 있던, 능동적인 태도의 학생에게 연락하여 스터디 참여를 권유했습니다.<br><br>위 경험으로 향상된 소통 역량 덕분에 아래와 같은 성과를 낼 수 있었습니다.<br><br>A. 기획자로서, 이전 직장에서 가나 데이터랩 구축 사업의 주요 안건들을 도맡아 회의를 이끌어나갈 수 있었습니다. 이 안건들은 곧, 지구 반대편에 위치한 아프리카 가나에 원격 프로젝트를 성공적으로 도입하는 밑거름이 되었습니다.<br>B. AI 데이터 가공 PM으로서, 고객사의 정확한 요구사항을 파악하고 실현 가능한 방향으로 구체화하였습니다. 이는 곧 고객사로부터 신뢰를 얻어 최대 5회의 지속적인 프로젝트 의뢰를 받는 계기가 되었습니다. 더불어 당사 전담 매니저로서 배정 요청을 받기도 하였습니다.<br>C. 스터디를 통해 학습한 내용으로 코딩에 더욱 흥미를 느낄 수 있었습니다. 학원에서 배운 내용이 단순히 '어떻게 하는지?'일 뿐이었다면, 스터디를 통해 '왜 이렇게 하는지?'를 조금이나마 이해해볼 수 있었던 시간이었습니다. 또한 미숙하지만, 처음부터 끝까지 프로젝트를 직접 설계하고 업무를 분담하며, 동료와 소통하며 개발 과정을 조율해볼 수 있는 아주 귀중한 경험을 쌓았습니다.</span>
      </div>
      <div class="sub-title">
        <span>2. '체계를 기획하고 정리하는 것을 좋아하는'</span>
      </div>
      <div class="sub-body">
        <span>다양한 그룹을 리드하면서 많은 안건을 요약정리하여 메모하는 습관을 가지게 되었고, 이를 조합해 결론 또는 방향을 도출하는 역량을 키울 수 있었습니다.<br>이러한 역량은 실제로 그동안의 직장 생활에서 큰 영향을 끼쳤던 핵심 요인이었으며, 개발자 취업 스터디의 목표와 과정을 계획하고 진행하는 데에도 큰 도움이 되었습니다. 이에, 앞으로는 신입 개발자로서 처음 접하는 업무 내용과 다양한 자료를 어떻게 내 것으로 만드는가에 대해서도 분명 도움이 될 것이라 생각합니다.<br>첫 직장이었던 대학의 신설 연구센터와, 직전에 근무했던 스타트업의 공통점은 체계가 불안정하다는 것이었습니다. 모든 업무에 선례가 없었으며 하나 하나 부딪쳐 가며 만들어나가야 했습니다. 특히 이러한 상황이 두드러졌던 곳은 바로 아프리카 가나였습니다.<br>입사 직후 가나에 도착했을 때, 갓 신설된 데이터랩에는 현지 작업자 채용 및 물리적인 환경만 조성되었을 뿐이었습니다. 따라서 해야할 일을 파악하기 위해, 우선 구전되었던 기존 인수인계 내용을 목차를 나누어 문서화하였습니다. 그리고 아래에는 필요한 시스템별 목차를 우선순위 순으로 추가해두었습니다.<br>이 덕분에 '했던 일'과 '해야할 일'을 명확히 구분할 수 있었습니다. 일정상 급여 지급 체계 확립이 가장 시급함을 인지했고, 본사와 소통하여 해결했습니다. 이후에도 후발 출장자를 위한 생활 가이드를 작성하고, 근태관리 및 복지 체계의 기반을 성공적으로 확립하는 등 만족스러운 성과를 안고 복귀할 수 있었습니다.</span>
      </div>
      <div class="sub-title">
        <span>3. '자기객관화를 통해 상황을 분석하는'</span>
      </div>
      <div class="sub-body">
        <span>자기객관화란 스스로를 제 3자인 관찰자 시점에서 있는 그대로 바라보고자 하는 사고방식입니다. 저는 그동안 연관이 없는 전공과 이력 안에서, 낯설고도 새로운 환경에 계속해서 뛰어들었습니다. 그리고 성공과 실패의 요인을 분석하고 피드백을 받아, 다음 도전에 반영하며 스스로의 역량과 한계를 파악하였습니다.<br>이러한 자기객관화 과정은 업무의 우선순위를 설정하거나 복합적인 문제의 실마리를 푸는 데 큰 도움이 되었습니다. 특히 업무분장이 모호하거나 일정이 시급한 경우, 제가 더 효율적으로 할 수 있는 일과 없는 일을 구별해 최선의 성과를 도출했습니다.<br>가나 출장 당시, 다수의 프로젝트에 투입된 작업자들을 관리할 시스템이 전혀 갖춰지지 않아 일촉즉발의 상황이었습니다. 이 때, 신입이었던 저는 당장 프로젝트 관리에 투입되는 것은 비효율적이라는 것을 인지했습니다. 행정 체계는 경험을 토대로 새롭게 구축할 수 있지만, 프로젝트 관리에 대해서는 플랫폼 사용법과 프로세스를 충분히 숙지할 시간이 부족했기 때문입니다. 그리고 팀장 또한 프로젝트 관리와 체계 구축, 신입 교육까지 병행하기에는 무리가 있다는 판단이 있었습니다. 이에 팀장과 대화하여 즉시 양해를 구한 후 업무 재분장을 건의하였습니다.<br>그 결과 각자 할 수 있는 최선의 업무를 진행할 수 있었고, 데이터랩의 체계를 확립함과 동시에 가나에 투입한 프로젝트도 성공적으로 완료할 수 있었습니다.</span>
      </div>
    </div>
    
    <div class="info-wrap">
      <div class="info-title">CERTIFICATION</div>
      <div class="sub-title">
        <span>1. 교육 수료 사항</span>
      </div>
      <div class="sub-body">
        <span>SBS아카데미 웹개발자 과정 수료 (2021.05. ~ 2021.12.)<br>- Web Publishing 동적 웹페이지 만들기 기초 (HTML, CSS, JS, JQuery)<br>- Java 기초 문법 학습 및 원시 CRUD 기능 만들기 <br>- MySQL DB 생성하여 CRUD 기능 만들기<br>- Spring Servlet과 JSP로 게시판 만들기<br>- SpringBoot와 JSP로 게시판 만들기<br>- Linux CentOS7 기초</span>
      </div>
      <div class="sub-title">
        <span>2. 자격 취득 사항 및 향후 계획</span>
      </div>
      <div class="sub-body">
        <span>- 2021년 1회 정보처리기사 취득 완료<br>- 2022년 9월, 46회차 SQLD 취득을 목표로 함</span>
      </div>
    </div>
  </section>
</article>
<!-- footer.jspf 불러오기 -->
<%@ include file="../common/footer.jspf"%>

<script>
$(document).ready(function(){
	  $(".open-btn").click(function(){
	    $("#etc-wrap").slideDown(1000, function() {
	      $("#etc-wrap").addClass("active");
	    });
	    $(this).removeClass("active");
	    $(".close-btn").addClass("active");
		})
		$(".close-btn").click(function(){
	    $("#etc-wrap").slideUp(1000, function() {
	      $("#etc-wrap").removeClass("active");
	    });
	    $(this).removeClass("active");
	    $(".open-btn").addClass("active"); 
	  })
});
</script>

</body>
</html>