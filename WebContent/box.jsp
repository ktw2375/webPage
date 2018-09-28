<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	    String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있지 않습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/custom.css?ver=1" rel="stylesheet">
<link href="css/bootstrap.css?ver=1" rel="stylesheet">
<title>채팅 & 게시판 사이트</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
  
<script type="text/javascript">
	function getUnread() {
		$.ajax({
			type: "POST",
			url: "./chatUnread",
			data: {
				userID: encodeURIComponent('<%= userID %>'),
			},
			success: function(result){
				if(result >= 1){
					showUnread(result);
				}else{
					showUnread('');
				}
			}
		});
	}
		function getInfiniteUnread(){
			setInterval( function(){
				getUnread();
			}, 4000);
		}
		function showUnread(result){
			$('#unread').html(result);
		}
		
		function chatBoxFunction() {
			var userID = '<%= userID %>'
			$.ajax({
				type: "POST",
				url: "./chatBox",
				data: {
					userID: encodeURIComponent(userID),
				},
				success: function(data){
					if(data == "") return;
					$('#boxTable').html('');
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i = 0; i< result.length; i++){
						if(result[i][0].value == userID){
							result[i][0].value = result[i][1].value;
						}else{
							result[i][1].value = result[i][0].value;
						}
						addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value, result[i][5].value);
					}
				}
			});
		}
		function addBox(lastID, toID, chatContent, chatTime, unread, profile){
		$('#boxTable').append('<tr onclick="location.href=\'chat.jsp?toID=' + encodeURIComponent(toID) + '\'">' +
				'<td style="width: 150px;">' +
				'<img class = "media-object img-circle" style="margin: 0 auto; max-width: 40px; max-height: 40px;" src ="' + profile +'">' +
				'<h5>' +lastID + '</h5></td>' +
			    '<td>' +
			    '<h5>' + chatContent + '</h5>' +
			    '<span class="label label-info">' + unread + '</span>' +
			    '<div class = "pull-right">' + chatTime + '</div>' +
			    '</td>' +
				'</tr>');
		}
		
		function getInfiniteBox() {
			setInterval(function(){
				chatBoxFunction();
			}, 3000);
		}
	
</script>

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
</head>
<body>
	
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
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">Main</a>
				<li><a href="find.jsp">친구찾기</a>
				<li class="active"><a href="box.jsp">메시지함<span id="unread" class="label label-info"></span></a>
				<li><a href="boardView.jsp">자유게시판</a>
				<li><a href="intro.jsp">개발자 정보</a>
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
					   <li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					   data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false">회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
					  <li><a href="update.jsp">회원정보 수정</a></li>
					  <li><a href="profileUpdate.jsp">프로필 수정</a></li>
					   <li><a href="logoutAction.jsp">로그아웃</a></li>
					  
					</ul>
				   
				</li>
			</ul>
			<%
				}
			%>
		</div>
    </nav>
    
    <div class="container">
    	<table class="table" style="margin: 0 auto;">
    		<thead>
    			<tr>
    				<th><h4>주고받은 메시지 목록</h4></th>
    			</tr>
    		</thead>
    		<div style="overflow-y: auto; width: 100%; max-height: 450px;">
    			<table class="table table-bordered table-hover" style="text-align: center; bordered: 1px solid #dddddd; margin: 0 auto;">
    				<tbody id = "boxTable">
    				</tbody>
    			</table>
    		</div>
    	</table>
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
    
    <%
    	if(userID != null){
    %>
    	<script type="text/javascript">
    		$(document).ready(function() {
    			getUnread();
    			getInfiniteUnread();
    			chatBoxFunction();
    			getInfiniteBox();
    		});
    	</script>
    <%
    	}
    %>
</body>
</html>