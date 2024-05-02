<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
//head 태그 안에 스크립트 선언
        function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays ); 
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
        function closePop() {
            if ( document.pop_form.chkbox.checked ){
                setCookie( "maindiv", "done" , 1 );
            }
            document.all['layer_popup'].style.visibility = "hidden";
        }
</script>
 <script language="Javascript">
    cookiedata = document.cookie;   
    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    else {
        document.all['layer_popup'].style.visibility = "hidden";
    }
</script>

<style type="text/css">
/* 폰트 및 기본 스타일 */
.layerPopup {
    font-family: Arial, sans-serif;
    text-align: center;
}
.layerPopup .layerBox {
    position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    padding: 30px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
.layerPopup .title {
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
    color: #333;
}
.layerPopup .cont {
    margin-bottom: 20px;
}
.layerPopup #check label {
    font-size: 16px;
    color: #666;
}
.layerPopup #close a {
    display: inline-block;
    padding: 8px 20px;
    margin-top: 10px;
    font-size: 16px;
    font-weight: bold;
    color: #fff;
    background-color: #007bff;
    border-radius: 5px;
    text-decoration: none;
}
.layerPopup #close a:hover {
    background-color: #0056b3;
}
</style>

	<!-- layer popup content -->
<div class="layerPopup" id="layer_popup" style="visibility: visible;">
    <div class="layerBox">
        <h4 class="title text-center"> 공지사항</h4>
        <div class="cont">
            <p width="350" height="500">안녕하세요 운영자입니다. 현재 개발중이니 조금만 기다려 주세요.
	<!-- <img src="" width=350 height=500 usemap="#popup" alt="event page"> -->
            </p>
        </div>
          <form name="pop_form">
        <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
        <label for="chkbox">&nbsp;&nbsp;오늘 하루동안 보지 않기</label></div>
		<div id="close" ><a href="javascript:closePop();">닫기</a></div>    
		</form>
	</div>
</div>