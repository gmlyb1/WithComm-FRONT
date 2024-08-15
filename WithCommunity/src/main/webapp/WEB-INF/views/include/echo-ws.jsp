<%@ page session="true" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
		<title>Home</title>
		<meta charset="UTF-8"/>
	</head>
	
	<body>
		<form id="chatForm">
			<div class="chat_start_main">
				상담 CHAT			
			</div>
			<div class="chat_main" style="display:non;">
				<div class="modal-header" style="height:20%;">
					상담 CHAT
				</div>
				<div class="modal-content" id="chat" style="height:60%;">
					
				</div>
				<div class="modal-footer">
					<input type="text" id="message" class="form-control" style="height:20%;" placeholder="메세지를 입력하세요"/>
				</div>
			</div>
		</form>
	</body>
	
	<script type="text/javascript">
		var socket = null;
		
		$(document).ready(function() {
			if(!isEmpty($("#session_id").val()))
			connectWS();
		});
		
		$('.chat_start_main').click(function() {
			$(this).css("display","none");
			$(".chat_main").css("display","inline");
		});
	</script>
</html>