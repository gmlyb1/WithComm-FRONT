<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../include/header.jsp"%>

<link href="./resources/css/message_list.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/fofnt-awesome.css" type="text/css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>

<div class="msg-container">
	<div class="messaging">
		<div class="inbox_msg">
			<!-- 메시지 목록 영역 -->
			<div class="inbox_people">
				<div class="headind_srch">
					<div class="recent_heading">
						<h4>Recent</h4>
					</div>
					
					<!-- 메시지 검색 -->
					<div class="srch_bar">
						<div class="stylish-input-group">
							<input type="text" class="search-bar" placeholder="Search">
							<span class="input-group-addon">
								<button type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
							</span>
						</div>
					</div>
					
					<!-- 메시지 리스트 -->
					<div class="inbox_chat">
					
					</div>
				</div>
				
				
				<!-- 메세지 내용 영역 -->
				<div class="mesgs">
					<!-- 메시지 내용 목록 -->
					<div class="msg_history" name="contentList">
						<!-- 메세지 내용이 올자리 -->
					</div>
					<div class="send_message">
					</div>
					<!-- 메세지 입력란이 올 자리 -->
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	const FirstMessageList = function(){ 
		$.ajax({
			url:"/msg/list",
			method:"get",
			data:{
				
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				//메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click',function(){
					let room = $(this).attr('msg_room');
					let other_nick = $(this).attr('other-nick');
				
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					$('.chat_list_box'+room).addclass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";	
					send_msg += "		<div class='col-11'>";	
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력...'/>";
					send_msg += "		</div>"
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa-fa-paper-plane-o' aria-hidden='true'></i></button>";	
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
					
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						sendMessage(room, other_nick);
					});

					messageContentList(room);
				});
				
				$('.chat_list_box:first').addClass('active_chat');
			}
		})
	};
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const MessageContentList = function(msg_room) {
		$.ajax({
			url:"/msg/msg_content_list",
			method:"GET",
			data:{
				msg_room: msg_room,
			},
			success: function(data) {
				console.log('메세지 내용 가져오기 성공');
				
				$('.msg_history').html(data);
				
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
			},
			error : function() {
				alert(' 서버 에러 ');
			}
		
		})
		
		$('.unread'+msg_room).empty();
	};
	
	// 메세지를 전송하는 함수


</script>



















<%@include file="../include/footer.jsp"%>