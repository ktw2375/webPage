<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/custom.css?ver=1" rel="stylesheet">
<link href="css/bootstrap.css?ver=1" rel="stylesheet">
<title>채팅 & 게시판 사이트</title>
<style>
port url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
*{
   font-family : 'Nanum Gothic';
}
h5{
	font-family : 'Nato Sans KR';
	font-size: 15px;
}

h4{
	font-family : 'Nato Sans KR';
	
}

h3{
	font-family : 'Hanna';
	
}

h2{
	font-family : 'Hanna';
	
}

h1{
	font-family : 'Hanna';
	
}

thead th {
 background-color: #006DCC;
 color: white;
 text-align: center;
}
tr td:first-child,
tr th:first-child {
 border-top-left-radius: 6px;
 border-bottom-left-radius: 6px;
}
tr td:last-child,
tr th:last-child {
 border-top-right-radius: 6px;
 border-bottom-right-radius: 6px;
}
.portlet {
    margin-bottom: 15px;
}

.btn-white {
    border-color: #cccccc;
    color: #333333;
    background-color: #ffffff;
}

.portlet {
    border: 1px solid;
}

.portlet .portlet-heading {
    padding: 0 15px;
}

.portlet .portlet-heading h4 {
    padding: 1px 0;
    font-size: 16px;
}

.portlet .portlet-heading a {
    color: #fff;
}

.portlet .portlet-heading a:hover,
.portlet .portlet-heading a:active,
.portlet .portlet-heading a:focus {
    outline: none;
}

.portlet .portlet-widgets .dropdown-menu a {
    color: #333;
}

.portlet .portlet-widgets ul.dropdown-menu {
    min-width: 0;
}

.portlet .portlet-heading .portlet-title {
    float: left;
}

.portlet .portlet-heading .portlet-title h4 {
    margin: 10px 0;
}

.portlet .portlet-heading .portlet-widgets {
    float: right;
    margin: 8px 0;
}

.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
    display: inline;
}

.portlet .portlet-heading .portlet-widgets .divider {
    margin: 0 5px;
}

.portlet .portlet-body {
    padding: 15px;
    background: #fff;
}

.portlet .portlet-footer {
    padding: 10px 15px;
    background: #e0e7e8;
}

.portlet .portlet-footer ul {
    margin: 0;
}

.portlet-green,
.portlet-green>.portlet-heading {
    border-color: #16a085;
}

.portlet-green>.portlet-heading {
    color: #fff;
    background-color: #16a085;
}

.portlet-orange,
.portlet-orange>.portlet-heading {
    border-color: #f39c12;
}

.portlet-orange>.portlet-heading {
    color: #fff;
    background-color: #f39c12;
}

.portlet-blue,
.portlet-blue>.portlet-heading {
    border-color: #2980b9;
}

.portlet-blue>.portlet-heading {
    color: #fff;
    background-color: #2980b9;
}

.portlet-red,
.portlet-red>.portlet-heading {
    border-color: #e74c3c;
}

.portlet-red>.portlet-heading {
    color: #fff;
    background-color: #e74c3c;
}

.portlet-purple,
.portlet-purple>.portlet-heading {
    border-color: #8e44ad;
}

.portlet-purple>.portlet-heading {
    color: #fff;
    background-color: #8e44ad;
}

.portlet-default,
.portlet-dark-blue,
.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    border-color: #34495e;
}

.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    color: #fff;
    background-color: #34495e;
}

.portlet-basic,
.portlet-basic>.portlet-heading {
    border-color: #333;
}

.portlet-basic>.portlet-heading {
    border-bottom: 1px solid #333;
    color: #333;
    background-color: #fff;
}

@media(min-width:768px) {
    .portlet {
        margin-bottom: 30px;
    }
}

.text-green {
    color: #16a085;
}

.text-orange {
    color: #f39c12;
}

.text-red {
    color: #e74c3c;
}
.vertical-alignment-helper{
	display: table;
	height: 100%;
	width: 100%;
	pointer-events: none;
}

.vertical-align-center{
	display: table-cell;
	vertical-align: middle;
	pointer-events: none;
}
.modal-content{
	width: inherit;
	height: inherit;
	margin: 0 auto;
	pointer-events: all;
	}                
/* 전체 링크 관련 영역 */
a {
 color: #000000;
 text-decoration: none;
}
a:hover {
color: #bbbbbb;
text-decoration: none;
cursor: pointer;
}
/*네이게이션 영역*/
.navbar-default { /*네비게이션바 배경 색상 */
background-color: #006DCC;
border-color: #006DCC;
border-bottom-color: #dddddd;
border-bottom-width: 3px;
border-raidus: 0px;
}

.navbar-default .navbar-brand{ /*네비게이션 제목 색상 */
color: #ffffff;
padding-top: 25px;
font-family: 'Hanna';
}
.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus {/* 네비게이션 제목에 마우스를 올렸을때 */
color: #dddddd;
background-color: transparent;
}
.navbar-default .navbar-nav > .active > a,
.navbar-default .navbar-nav > .active > a:hover,
.navbar-default .navbar-nav > .active > a:focus { /*선택된 네비게이션 마우스 색상 이벤트 */
 color: #ffffff;
 background-color: #1456b8;
}
.navbar-default .navbar-nav > li > a{/*네비게이션 글자 기본 폰트 변경 */
color: white;
font-family: 'Noto Sans KR';
}
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus { /*네비게이션 글자에 마우스를 올렸을 때*/
color: #dddddd;

}
.navbar-default .navbar-nav > .open > a,
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus { /*열린 드랍다운 마우스 색상 이벤트*/
color: #006DCC;
text-decoration: none;
background-color: #ffffff;
}
.navbar-default .navbar-toggle:hover,
.navbar-default .navbar-toggle:focus { /*토글에 마우스를 올렸을 때*/
background-color: #1456b8;
}
.navbar-default .navbar-toggle .icon-bar{ /*토글 아이콘 바 색상 */
background-color: #dddddd;
}
@media (max-width: 767px){ /*작은 화면일떄 드랍다운 아이템에 마우스를 올렸을떄*/
.navbar-default .navbar-nav .open .dropdown-menu> li > a{
  color: #ffffff;
}
	.navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,
	.navbar-default .navbar-nav .open .dropdown-menu > li > a:focus{
		color: #eeeeee;
	}
}
/* 네비게이션 길이 수정 */
.navbar-fixed-top{
	min-height: 70px;
}
.navbar-nav > li > a{
	padding-top: 0px;
	padding-bottom: 0px;
	line-height: 70px;
}
@media (max-width: 767px){
.navbar-default .navbar-brand {
	padding-top: 15px;
}
.navbar-nav > li > a{
	padding-top: 0px;
	padding-bottom: 0px;
	line-height: 40px;
}
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	function registerCheckFunction(){
		var userID = $('#userID').val();
		$.ajax({
			type: 'POST',
			url: './UserRegisterCheckServlet',
			data: {userID: userID},
			success: function(result){
				
				if(result == 1){
					$('#checkMessage').html('사용할 수 있는 아이디 입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				} else{
					$('#checkMessage').html('사용할 수 없는 아이디 입니다.');
					$('#checkType').attr('class', 'modal-content pannel-warning');
				}
				$('#checkModal').modal("show");
			}
		});
	}
	function passwordCheckFunction(){
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if(userPassword1 != userPassword2){
			$('#passwordCheckMessage').html('비밀번호가 서로 다릅니다.');
		}  else{
			$('#passwordCheckMessage').html('');
		}
		
	}
	
</script>
</head>
<body>
	<%
	    String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID != null){
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있는 상태입니다.");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">채팅 사이트</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">Main</a>
				<li><a href="find.jsp">친구찾기</a>
			<li><a href="box.jsp">메시지함<span id="unread" class="label label-info"></span></a>
				<li><a href="boardView.jsp">자유게시판</a>
			</ul>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					   data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false">접속하기<span class="caret"></span>
					</a>
				    <ul class="dropdown-menu">
					   <li><a href="login.jsp">로그인</a></li>
					   <li  class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>

		</div>
    </nav>
    <div class="container">
    	<form method="post" action="./userRegister">
    		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
    			<thead>
    				<tr>
    					<th colspan="3"><h4>회원 가입 양식</h4></th>
    				</tr>
    			</thead>
    			<tbody>
    				<tr>
    					<td style = "width: 110px;"><h5>아이디</h5></td>
    					<td><input class="form-control" type="text" id="userID" name="userID" maxlength="20" placeholder="아이디를 입력하세요."></td>
    					<td style="width: 110px;"><button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복체크</button></td>
    				</tr>
    				<tr>
    					<td style = "width: 110px;"><h5>비밀번호</h5></td>
    					<td colspan="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword1" type="password" name="userPassword1" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
    					
    				</tr>
    				<tr>
    					<td style = "width: 110px;"><h5>비밀번호 확인</h5></td>
    					<td colspan="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword2" type="password" name="userPassword2" maxlength="20" placeholder="비밀번호를 다시 입력하시오"></td>
    					
    				</tr>
    				<tr>
    					<td style = "width: 110px;"><h5>이름</h5></td>
    					<td colspan="2"><input class="form-control" id="userName" type="text" name="userName" maxlength="20" placeholder="이름을 입력하시오"></td>
    					
    				</tr>
    				<tr>
    					<td style = "width: 110px;"><h5>나이</h5></td>
    					<td colspan="2"><input class="form-control" id="userAge" type="number" name="userAge" maxlength="20" placeholder="나이를 입력하시오"></td>
    				</tr>
    				<tr>
    					<td style = "width: 110px;"><h5>성별</h5></td>
    					<td colspan="2">
    						<div class="form-group" style="text-align: center; margin: 0 auto;">
    							<div class="btn-group" data-toggle="buttons">
    								<label class="btn btn-primary active">
    									<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
    								</label>
    							</div>
    							<div class="btn-group" data-toggle="buttons">
    								<label class="btn btn-primary">
    									<input type="radio" name="userGender" autocomplete="off" value="여자">여자
    								</label>
    							</div>
    							
    						</div>
    					</td>
    					
    				</tr>
    				<tr>
    					<td style = "width: 110px;"><h5>Email</h5></td>
    					<td colspan="2"><input class="form-control" id="userEmail" type="email" name="userEmail" maxlength="20" placeholder="email을 입력하시오"></td>
    					
    				</tr>
    				<tr>
    					<td style="text-align: left;" colspan="3"><h5 style="color: red;" id="passwordCheckMessage"></h5><input class ="btn btn-primary pull-right" type="submit" value="등록"></td>
    				</tr>
    			</tbody>
    		</table>
    	</form>
    </div>
    <%
    	String messageContent = null;
    	if(session.getAttribute("messageContent") != null){
    		messageContent = (String)session.getAttribute("messageContent");
    	}
    	String messageType = null;
    	if(session.getAttribute("messageType") != null){
    		messageType = (String)session.getAttribute("messageType");
    	}
    	if(messageContent != null){
    %>
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
    	<div class="vertical-alignment-helper">
    		<div class="modal-dialog vertical-align-center">
    			<div class="modal-content <%if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
    				<div class="modal-header panel-heading">
    					<button type="button" class="close" data-dismiss="modal">
    					 	<span aria-hidden="true">&times</span>
    					 	<span class="sr-only">Close</span>
    					</button>
    					<h4 class="modal-tile">
    						<%=messageType %>
    					</h4>
    				</div>
    				<div class="modal-body">
    					<%= messageContent %>
    				</div>
    				<div class="modal-footer">
    					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
    				</div>
    				
    			</div>
    		</div>
    	</div>
    </div>
    <script>
    	$('#messageModal').modal("show");
    </script>
    <%
    	session.removeAttribute("messageContent"); //서버로받은 세션값인데 이걸 이제 다시 파기하는것 리다이렉트로 다시 join으로 되돌려보냄
    	session.removeAttribute("messageType");
    	}
    %>
    <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidde="true">
    	<div class="vertical-alignment-helper">
    		<div class="modal-dialog vertical-align-center">
    			<div id="checkType" class="modal-content panel-info">
    				<div class="modal-header panel-heading">
    					<button type="button" class="close" data-dismiss="modal">
    					 	<span aria-hidden="true">&times</span>
    					 	<span class="sr-only">Close</span>
    					</button>
    					<h4 class="modal-tile">
    						확인 메시지
    					</h4>
    				</div>
    				<div id="checkMessage" class="modal-body">
    				
    				</div>
    				<div class="modal-footer">
    					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
    				</div>
    				
    			</div>
    		</div>
    	</div>
    
    </div>
</body>
</html>