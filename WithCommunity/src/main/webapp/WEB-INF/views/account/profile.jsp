<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@include file="/WEB-INF/views/include/header.jsp"%>    
<!-- Core JS -->
 <script src="/resources/assets/vendor/libs/jquery/jquery.js"></script>
 <script src="/resources/assets/vendor/libs/popper/popper.js"></script>
 <script src="/resources/assets/vendor/js/bootstrap.js"></script>
 <script src="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
 <script src="/resources/assets/vendor/js/menu.js"></script>
 <script src="/resources/assets/js/main.js"></script>
 <script src="/resources/assets/js/pages-account-settings-account.js"></script>

 <!-- Place this tag in your head or just before your close body tag. -->
 <script async defer src="https://buttons.github.io/buttons.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
		
   }); 
    
     	
		function fileCh(f) {
    		if(f.files && f.files[0]) {
    			
    			var reader = new FileReader();
    			reader.onload = function(event) {
    			$("#uploadedAvatar").attr('src', event.target.result);
    			}
    			reader.readAsDataURL(f.files[0]);
    		}
    	}
		
		$("#submitBtn").click(function() {
			var memberId = $(this).data("member-id");
			var meName = $('#me_name').val();
		    var mePwd = $('#me_pwd').val();
			
		    console.log(meName);
		    console.log(mePwd)
		    
		    if (confirm("정말로 회원 정보를 변경 하시겠습니까?")) {
				$.ajax({
					url : "/account/profileUdt",
					type : "POST",
					data : {
						me_id : memberId,
						me_name: meName,
			            me_pwd: mePwd
					},
					success : function(data) {
						console.log(data);
						alert("회원 변경이 성공적으로 처리되었습니다.");
						location.href = "/home";
					},
					error : function(error) {
						console.log(error);
						alert("요청 처리 중 오류가 발생하였습니다."+error);
					}
				});
			}
		}); 
		
		//회원 탈퇴
		$("#delBtn").click(function() {
			
			if(!$("#accountActivation").prop("checked")) {
		        alert("동의란에 체크해 주십시오.");
		        return;
		    }
			
			var memberId = $(this).data("member-id");

			if (confirm("회원 탈퇴 하시겠습니까?")) {
				$.ajax({
					url : "/account/delete",
					type : "POST",
					data : {
						me_id : memberId,
					},
					success : function(data) {
						alert("회원탈퇴가 성공적으로 처리되었습니다.");
						location.href = "/home";
					},
					error : function(error) {
						console.log(error);
						alert("요청 처리 중 오류가 발생하였습니다."+error);
					}
				});
			}
		});

</script>
<!-- <form action="/account/profileUdt" method="post" id="udtForm" enctype="multipart/form-data"> -->
<div class="container-xxl flex-grow-1 container-p-y">
  <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Account Settings /</span> Account</h4>
  <div class="row">
    <div class="col-md-12">
      <ul class="nav nav-pills flex-column flex-md-row mb-3">
        <li class="nav-item">
          <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> 계정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/account/IndNotice"
            ><i class="bx bx-bell me-1"></i> 계정공지</a
          >
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/account/alram"
            ><i class="bx bx-link-alt me-1"></i> 알림</a
          >
        </li>
      </ul>
       <!-- src="/resources/assets/img/avatars/1.png" -->
       
      <div class="card mb-4">
        <h5 class="card-header">Profile Details</h5>
        <!-- Account -->
   <form action="/account/updateImg" method="post" enctype="multipart/form-data">
       	<input type="hidden" name="me_id" id="me_id" value="${member.me_id }">
         <div class="card-body">
              <div class="d-flex align-items-start align-items-sm-center gap-4">
                <%-- <img
                  src="/image/${member.me_image}" 
                  onerror="${pageContext.request.contextPath }/resources/assets/img/avatars/1.png"
                  alt="user-avatar"
                  class="d-block rounded"
                  height="100"
                  width="100"
                  id="uploadedAvatar"
                /> --%>
                <div class="button-wrapper">
                  <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                    <span class="d-none d-sm-block">Upload new photo</span>
                    <i class="bx bx-upload d-block d-sm-none"></i>
                    <input
                      type="file"
                      id="upload"
                      name="me_image"
                      class="account-file-input"
                      onchange="fileCh(this);"
                      accept="image/png, image/jpeg"
                    />
                  </label>
                  <button type="submit" class="btn btn-outline-secondary account-image-reset mb-4">
                    <i class="bx bx-reset d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">변경</span>
                  </button>
                  <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                </div>
              </div>
            </div>
	</form>        
	<form action="/account/profileUdt" method="post">
        <hr class="my-0" />
        <div class="card-body">
            <div class="row">
              <div class="mb-3 col-md-6">
                <label for="email" class="form-label">이메일</label>
                <input
                  class="form-control"
                  type="text"
                  id="me_email"
                  name="me_email"
                  value="${member.me_email}"
                  placeholder=""
                  readonly
                />
              </div>
              <div class="mb-3 col-md-6">
                <label for="state" class="form-label">회원등급</label>
                <input
                  class="form-control"
                  type="text"
                  id="state"
                  name="state"
                  value="${member.state}"
                  autofocus
                  readonly
                />
              </div>
              <div class="mb-3 col-md-6">
                <label for="me_name" class="form-label">닉네임</label>
                <input class="form-control" type="text" name="me_name" id="me_name" value="${member.me_name}"/>
              </div>
              <div class="mb-3 col-md-6">
                <label for="me_regDate" class="form-label">가입일자</label>
                <input class="form-control" type="text" id="me_regDate" name="me_regDate" value="<fmt:formatDate value="${member.me_regDate}" pattern = "yyyy-MM-dd"/>"readonly>
              </div>
              <div class="mb-3 col-md-6">
                <label for="me_pwd" class="form-label" >비밀번호</label>
                <input class="form-control" type="password" id="me_pwd" name="me_pwd">
              </div>
            <div class="mt-2">
              <button id="submitBtn" type="submit" data-member-id="${member.me_id}" class="btn btn-primary me-2">변경</button>
              <button type="reset" class="btn btn-outline-secondary">취소</button>
            </div>
        </div>
      </div>
   </form>
 <!--    </form> -->
        <!-- /Account -->
      <div class="card">
        <h5 class="card-header"><Strong>회원 탈퇴</Strong></h5>
        <div class="card-body">
          <div class="mb-3 col-12 mb-0">
            <div class="alert alert-warning">
              <h6 class="alert-heading fw-bold mb-1">정말로 이 계정을 삭제하시기를 원하십니까?</h6>
              <p class="mb-0">한번 탈퇴한 계정은 다시 복구 하실 수 없습니다. 다시 한번 확인해 주시기 바랍니다.</p>
            </div>
          </div>
          <form id="formAccountDeactivation" onsubmit="return false">
            <div class="form-check mb-3">
              <input
                class="form-check-input"
                type="checkbox"
                name="accountActivation"
                id="accountActivation"
              />
              <label class="form-check-label" for="accountActivation">회원 탈퇴에 동의합니다.</label>
            </div>
            <button id="delBtn" data-member-id="${member.me_id}" type="button" class="btn btn-danger deactivate-account">회원 탈퇴</button>
          </form>
        </div>
      </div>
      

<%@include file="/WEB-INF/views/include/footer.jsp"%>