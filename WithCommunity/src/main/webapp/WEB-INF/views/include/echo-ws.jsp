<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
    //var socket = null;

    $(document).ready(function() {
    	
        /* // WebSocket 연결 및 이벤트 초기화
        if (!isEmpty($("#session_id").val())) {
            connectWS();
        }

        // 채팅 시작 버튼 클릭 이벤트
        $('.chat_start_main').click(function() {
            $(this).hide();
            $('.chat_main').show();
        });		

        // 채팅 헤더 클릭 이벤트 (팝업 닫기)
        $('.chat_main .modal-header').click(function() {
            $('.chat_main').hide();
            $('.chat_start_main').show();
        });

        // 채팅 폼 제출 이벤트
        $("#chatForm").submit(function(event) {
            event.preventDefault();
            if (socket) {
                socket.send($("#message").val());
                $("#message").val('').focus();
            }
        });
    });

    function connectWS() {
        var sock = new SockJS("/echo");
        socket = sock;

        sock.onopen = function() {
            console.log('info: connection opened.');
        };

        sock.onmessage = function(e) {
            $('#chat').append(e.data + "<br/>");
        };

        sock.onclose = function() {
            $("#chat").append("연결 종료");
        };

        sock.onerror = function(err) {
            console.log('Errors:', err);
        };
    }

    function isEmpty(value) {
        return !value || value.trim().length === 0;
    } */
</script>

<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8"/>
    <style>
    /* 팝업 스타일 */
    .chat_main {
        display: none; /* 기본적으로 숨김 상태 */
        position: fixed;
        bottom: 10px; /* 화면의 아래쪽에서 약간 떨어지도록 조정 */
        right: 10px;
        width: 300px;
        height: 400px;
        background-color: #fff;
        border: 1px solid #ccc;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        z-index: 1000;
        overflow: hidden;
        box-sizing: border-box; /* 패딩과 보더를 포함한 총 높이 설정 */
    }
    .chat_start_main {
        position: fixed;
        bottom: 10px;
        right: 10px;
        width: 100px;
        height: 40px;
        background-color: #007bff;
        color: #fff;
        text-align: center;
        line-height: 40px;
        cursor: pointer;
        z-index: 1001;
    }
    .modal-header, .modal-footer {
        background-color: #007bff;
        color: #fff;
        padding: 10px;
        box-sizing: border-box; /* 패딩과 보더를 포함한 총 높이 설정 */
    }
    .modal-header {
        height: 60px; /* 헤더 높이 설정 */
    }
    .modal-footer {
        height: 60px; /* 푸터 높이 설정 */
        display: flex; /* 내용 정렬을 위한 Flexbox 사용 */
        align-items: center; /* 내용 중앙 정렬 */
    }
    .modal-content {
        height: calc(100% - 120px); /* 전체 높이에서 헤더와 푸터의 높이를 제외한 높이 */
        padding: 10px;
        overflow-y: auto;
        box-sizing: border-box; /* 패딩과 보더를 포함한 총 높이 설정 */
    }
</style>

</head>
<body>
	 <div class="chat_start_main">상담 CHAT</div>
    
    <div class="chat_main">
        <div class="modal-header">
            상담 CHAT
        </div>
        <div class="modal-content" id="chat">
            <!-- 채팅 내용이 여기에 추가됩니다 -->
        </div>
        <div class="modal-footer">
            <form id="chatForm">
                <input type="text" id="message" class="form-control" placeholder="메세지를 입력하세요"/>
            </form>
        </div>
    </div>
</body>
</html>
