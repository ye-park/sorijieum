<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, likebook.model.vo.LikeBookLB"%>
<%
	ArrayList<LikeBookLB> lblist = (ArrayList<LikeBookLB>)request.getAttribute("lblist");
	int beginPage = (Integer)request.getAttribute("beginPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int maxPage = (Integer)request.getAttribute("maxPage");
	int listcount = (Integer)request.getAttribute("listCount");
	String keyword = (String)request.getAttribute("keyword");
	String type = (String)request.getAttribute("type");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 관심도서</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/memberSide.jsp"%>
<script type="text/javascript">
$(function(){	
	//체크박스 전체 선택
	$("#allChk").click(function(){
		if($(this).is(":checked")){
			$(".chkbox").prop("checked", true);
		} else {
			$(".chkbox").prop("checked", false);
		}
	});
	
	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
	$(".chkbox").click(function(){
		if($("input[name='delChk']:checked").length == <%= lblist.size() %>){
			$("#allChk").prop("checked", true);
		}else{
			$("#allChk").prop("checked", false);
		}	
	});
	
	<% if(lblist.size() == 0){ %>
		$("#pagebox").css("display","none");
	<% } %>
});


</script>
</head>
<body>
<div class="hy-div">
<section class="hy-section2" >
<div style="display:flex;justify-content:space-between;">
<div>
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/likebook.my?userid=<%= loginMember.getUserId() %>">관심도서</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">내가 저장한 관심도서 목록</span><br><br>
</div>
<!-- 검색창 시작 -->
<div style="margin-top:20px;">
<form action="/sori/lbsearch.my" method="post">
<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>">
<% if(type == null || type.equals("title")){ %>
	<select class="ui mini simple dropdown" name="type" id="type" style="border-radius:5px;">
		<option value="title" selected>도서명</option>
		<option value="author">저자명</option>
	</select>
<% }else{ %>
	<select class="ui mini simple dropdown" name="type" id="type" style="border-radius:5px;">
		<option value="title">도서명</option>
		<option value="author" selected>저자명</option>
	</select>
<% } %>
<% if(keyword != null) { %>
	<input type="text" name="keyword" id="keyword" value="<%= keyword %>" style="width:200px;">
<% }else{ %>
	<input type="text" name="keyword" id="keyword" placeholder="검색하실 내용을 입력하세요" style="width:200px;">
<% } %>		
	<input class="ui tiny basic black button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
</form>
</div>
<!-- 검색창 끝 -->
</div>
<br><br>
<!-- 관심도서 목록 출력 -->
내 신청도서: <%= listcount %> 개
<form action="/sori/lbdel.my" method="post">
<table class="hy-listTable" align="center">
	<tr>
		<th width="5%"><input type="checkbox" class="chkbox" id="allChk"></th>
		<th width="25%"></th>
		<th width="70%"></th>
	</tr>
	<% if(lblist.size() > 0){ %>
	<% for(int i=0; i<lblist.size(); i++){  %>
	<%	LikeBookLB lb = lblist.get(i); %>
	<tr>
		<td><input type="checkbox" class="chkbox" name="delChk" value="<%= lb.getBookcode() %>"></td>
		<td class="bimg" id="<%= lb.getBookcode() %>">
		<a href="/sori/bsdetail?bookcode=<%= lb.getBookcode() %>&userid=<%= loginMember.getUserId() %>" style="color:#6d6d6d;">
			<div style="width:100%;height:300px;">
				<img src="/sori/resources/book_upfiles/<%= lb.getBookrimg() %>" alt="<%= lb.getBooktitle() %>" style="width:100%;height:100%;">
			</div>
		</a>
		</td>
		<td style="text-align:left;">
			<div class="content">
				<div style="font-size:16pt;">
					<%= lb.getBooktitle() %>
				</div>
				<div class="meta">
					<%= lb.getAuthor() %> 저 | <%= lb.getPublisher() %> | <%= lb.getPublishdate() %>
				</div>
			</div>
		</td>
	</tr>
	<% }}else{ %>
	<tr>
	<td colspan="3">신청 내역이 존재하지 않습니다.</td>
	</tr>
	<% } %>	
</table>
<!-- 관심도서 출력 끝 -->
<br>
<!-- 선택한 관심도서 삭제 버튼 -->
<input type="hidden" name="userid"	value="<%= loginMember.getUserId() %>">
<input type="hidden" name="currentPage" value="<%= currentPage %>">
<div align="left">
<button class="mini ui black button" style="font-size:9pt;" onclick="chkDel()">삭제</button></div>
</form>
<!-- 페이징 시작 -->
<% if(keyword == null){ %>
	<div id="pagebox" align="center" style="display:block;">
		<a href="/sori/likebook.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
		<a href="/sori/likebook.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/likebook.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/likebook.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/likebook.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/likebook.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/likebook.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/likebook.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
<% }else{ %> <!-- 검색시 페이징 -->
	<div id="pagebox" align="center" style="display:block;">
		<a href="/sori/lbsearch.my?page=1&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
		<a href="/sori/lbsearch.my?page=1&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/lbsearch.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/lbsearch.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/lbsearch.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/lbsearch.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/lbsearch.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/lbsearch.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
<% } %>	
<!-- 페이징 끝 -->
</section>
</div>
</body>
</html>