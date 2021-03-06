<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<%@ include file="/../inc/top.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$("li.question").click(function() {
		$(this).next().slideToggle("fast")
				.siblings(".answer:visible").slideUp("fast");
		$(this).toggleClass("active")
				.siblings("li.question").removeClass("active");
		});
});

<% if(loginMember.getTypeNumber()==1 || loginMember.getTypeNumber()==2){ %>
var audio= new Audio("/sori/resources/mp3/faq/faq_main.mp3");
window.onload = function(){
	audio.play();
}
	
window.onkeyup = function(){
	if(event.keyCode == 49){
		audio.pause();
		audio = new Audio("/sori/resources/mp3/faq/faq_1.mp3");
		audio.play();
	}
	else if(event.keyCode == 50){
		audio.pause();
		audio = new Audio("/sori/resources/mp3/faq/faq_2.mp3");
		audio.play();
	}
	else if(event.keyCode == 51){
		audio.pause();
		audio = new Audio("/sori/resources/mp3/faq/faq_3.mp3");
		audio.play();
	}
	else if(event.keyCode == 48){
		audio.pause();
		audio = new Audio("/sori/resources/mp3/faq/faq_main.mp3");
		audio.play();
	}
	else if(event.keyCode == 57){
		location.href="/sori/index.jsp";
	}
	else if(event.keyCode == 27){
		audio.pause();
		audio.currentTime = 0;
	}
}
<% } %>
</script>
<!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
 
</head>
<body>
<!-- Content 시작! -->
	<section class="my-section">
	<!--공지사항 시작-->
	<div class="my-content" style="height:900px;">
		<a class="massive ui yellow label" style="font-size: 30px">FAQ</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 자주 묻는 질문 게시판입니다</span>
		<br><br>
	<!-- 공지사항 목록 시작 -->

	<div id="box_faq">
	<nav>
		<ul>
		    <li class="question"><i class="bullhorn icon"></i>도서제작 하려면 어떻게 해야하나요?</li>

		    <li class="answer">• 도서제작 메뉴를 눌러 제작해야할 도서 목록에서 제작하실 도서를 클릭하신 후, 도서정보 하단의 제작하기를 누르시고 제작방법을 반드시 숙지하신 후 도서입력 및 편집을 하시면 됩니다.</li>
		
			<li class="question"><i class="bullhorn icon"></i>도서제작 과정이 궁금해요.</li>
		
		    <li class="answer">• 도서제작 과정은 먼저 이용자분들이 원하시는 도서를 신청받고, 도서 정보가 등록되면 제작자분들의 참여로 최대한 빠르게 도서를 제작, 검토 하여 이용자분들이 이용하실 수 있도록 만들어집니다!</li>
		
			<li class="question"><i class="bullhorn icon"></i>제작된 도서는 이용자들이 어떻게 이용하나요?</li>
		
		    <li class="answer">• 자원봉사자 여러분은 각자 관심 있는 책을 골라 화면에 표시된 원본 이미지를 보면서 문자 인식결과를 페이지 단위로 수정합니다.<br>
								• 책 편집이 시작되면 신청한 시각장애인 이용자에게 알림이 전달되고, 편집이 완료된 페이지는 즉시 온라인에서 읽어볼 수 있게 제공됩니다.<br>
								• 물론 신청자 뿐만 아니라 다른 시각장애인 이용자들도 읽을 수 있습니다.<br>
								• 입력편집활동과 동시에 실시간으로 시각장애인 이용자분이 읽을 수 있도록 서비스가 제공되오니 완성도있는 양질의 도서 제작을 부탁드립니다</li>
		
			<li class="question"><i class="bullhorn icon"></i>봉사시간은 지급가능한가요?</li>
		
		    <li class="answer">• 소리지음은 제작자 분들의 재능기부로 이루어지는 시각장애인용 도서제작 사이트입니다.<br>
		    					• 봉사시간이 필요하신 분들께서는 관련사이트 안내로 봉사사이트 링크를 들어가시기 바랍니다.</li>
		
			<li class="question"><i class="bullhorn icon"></i>도서제작시 오류가 났는데 어떻게 해야하나요?</li>
		
		    <li class="answer">• 크롬 브라우저를 사용해 주세요.<br>
								• 인터넷 사용 데이터를 지워보세요.<br>
								• Q&A 게시판에 글을 남겨주시거나 담당자에게 메일(admin01@iei.kr)로 보내주시기 바랍니다.<br>
								• 오류 화면을 캡쳐후 첨부하시면, 보다 빠르게 처리해 드립니다.</li>

			<li class="question"><i class="bullhorn icon"></i>사이트 이용이 너무 어려워요.</li>
		
		    <li class="answer">• sorijieum@sori.com 으로 메일을 보내주시거나,
		    					02-876-5432 번호로 전화를 주시면 담당자가 사이트 이용에 도움을 드리겠습니다.
		</ul>
		</nav>
		</div>
		
	<!--공지사항 목록 끝-->
	

	</div>
	<!--공지사항 끝-->

	</section>
	<!-- Content 끝! -->
</body>
</html>