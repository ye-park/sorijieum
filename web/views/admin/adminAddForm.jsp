<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 추가</title>
<script type="text/javascript">
	$(function(){
		var idTF = "F";
		var pwTF = "F";
		var pwEq = "F";
		
		// 아이디 중복체크 및 유효성 검사
			$("#checkid").click(function(){
				$.ajax({
					url:"/sori/idcheck",
					type:"post",
					data:{userid:$("#userid").val()},
					success: function(chkResponse){
						if(chkResponse == "ok"){
							var idReg = /^(?=admin*[0-9])[a-z0-9]{7}$/;
							if(!idReg.test($("#userid").val())){
								$("#iddiv").html("관리자 아이디는 무조건 admin+(숫자2자리)여야 합니다. (ex.admin00)");
								idTP = "F";
							} else {
								$("#iddiv").html("사용 가능한 아이디입니다.");
								$("#username").focus();
								idTP = "T";
							}
						}else{
							$("#iddiv").html("이미 사용중인 아이디입니다.");
							$("#userid").select();
							idTF = "F";
						}
					}
				});
				return false;
			});
		
		// 첫번째 비밀번호 유효성 검사
		$("#userpwd2").focusin(function(){
			var pwdReg = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{4,20}$/;	// 비밀번호 유효성검사 : 영문자, 숫자 무조건 1개 이상, 4~20자 제한
			if(!pwdReg.test($("#userpwd").val())){
				$("#pwddiv").html("암호는 영어소문자와 숫자로만 가능하며 4~20자리로 입력해야 합니다.");
				pwTF = "F";
			} else {
				$("#pwddiv").html("사용 가능한 암호입니다.");
				pwTF = "T";
			}
			return false;
		});
		
		// 두번째 비밀번호 = 첫번째 비밀번호 동일한지 확인
		$("#userpwd2").keyup(function(){
		      if($("#userpwd").val() != $("#userpwd2").val()){
		         $("#pwddiv2").html("암호가 일치하지 않습니다. 다시 입력하십시오.");
		         pwEq = "F";
		      }else{
		         $("#pwddiv2").html("암호가 일치합니다.");
		         pwEq = "T";
		      }
		      return false;
			});
		
		
		
		// 추가 버튼 클릭 시 위의 조건 2개를 모두 만족했을 때에만 넘어가게 함
		$("#btnsub").click(function(){
		      if(idTF=="T" && pwTF=="T" && pwEq=="T"){
		         return true;
		      }else{
		         alert("입력한 내용을 다시 확인해주세요.");
		         return false;
					}
				});
	});
	
</script>
</head>
<body>


<!-- Content 시작! -->
<% if(loginMember != null &&loginMember.getTypeNumber() == 5) { %>
<section class="contentsection">


	<!--관리자 추가 시작-->
            <i class="big user plus icon"></i><span style="font:black; font-size:17pt; padding:10px;">관리자 추가</span>
            <br><br>
            <div class="lightgreyBox" style="height: 700px; align: center;">
            <form action="/sori/adinsert.ad" method="post">
            	<table class="addform">
					<tr>
						<th width="30%">아이디</th>
						<td><div class="ui input"><input type="text" name="userid" id="userid" placeholder="admin(숫자2자리)만 가능" required></div>
						&nbsp;<button class="mini ui grey button" id="checkid">중복확인</button><div id="iddiv"></div></td>
					</tr>
					
					<tr>
						<th width="30%">이름</th>
						<td><div class="ui input"><input type="text" name="username" id="username" placeholder="관리자 이름 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">비밀번호</th>
						<td><div class="ui input"><input type="password" name="userpwd" id="userpwd" placeholder="영소문자,숫자 조합(4~20자리)" required></div><div id="pwddiv"></div></td>
					</tr>
					
					<tr>
						<th width="30%">비밀번호 확인</th>
						<td><div class="ui input"><input type="password" id="userpwd2" placeholder="입력한 비밀번호와 동일하게 입력" required></div><div id="pwddiv2"></div></td>
					</tr>
					
					<tr>
						<th width="30%">전화번호</th>
						<td><div class="ui input"><input type="text" name="phone" id="phone" placeholder="숫자만 입력(-제외)" onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">이메일</th>
						<td><div class="ui input"><input type="email" name="email" id="email" placeholder="sample@iei.kr 형식"required></div></td>
					</tr>

					<tr>
						<th width="30%">성별</th>
						<td><input type="radio" name="gender" value="F" checked>여성 &nbsp;
							<input type="radio" name="gender" value="M">남성</td>
					</tr>
					
					<tr>
						<th width="30%">생년월일</th>
						<td><div class="ui input"><input type="date" name="birth" id="birth" required></div></td>
					</tr>
					
					<br>
				</table>
				<br><br>
				<center>
					<div class="ui buttons">
						<input type="submit" button class="ui positive button"  style="width:100px" value="추가"></button>
					 	<div class="or"></div>
					  	<input type="reset" class="ui button" style="width:100px"></button>
					</div>
				</center>
			</form>	
            </div>
    <!-- 관리자 추가 끝! -->
    
            </section>
<!-- Content 끝! -->
<%}else{ %>
<%} %>

</body>
</html>