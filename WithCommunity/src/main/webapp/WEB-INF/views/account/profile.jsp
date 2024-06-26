<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@include file="/WEB-INF/views/include/header.jsp"%>    
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
	 /* $("#submitBtn").click(function() {
	
		 
	 });  */
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
		
		//회원 탈퇴
		$("#delBtn").click(function() {
			
			if(!$("#accountActivation").prop("checked")) {
		        swal.fire("동의란에 체크해 주십시오.");
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
						swal.fire("회원탈퇴가 성공적으로 처리되었습니다.");
						location.href = "/home";
					},
					error : function(error) {
						console.log(error);
						swal.fire("요청 처리 중 오류가 발생하였습니다."+error);
					}
				});
			}
		});

</script>
<form action="/account/profileUdt" method="post" id="udtForm" enctype="multipart/form-data">
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
         <div class="card-body">
			<div class="d-flex align-items-start align-items-sm-center gap-4">
			  <img
			    src="${pageContext.request.contextPath}/resources/upload/mem_Image/${member.me_image}"
			    alt="profile-pic"
			    class="d-block rounded"
			    height="100"
			    width="100"
			   <%--  onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'" --%>
			  />
			  <div class="button-wrapper">
			    <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
			      <span class="d-none d-sm-block">Upload new photo</span>
			      <input class="account-file-input" type="file" id="upload" name="me_image" accept="image/gif, image/jpeg, image/png" onchange="fileCh(this);" />
              </label>
              <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                <i class="bx bx-reset d-block d-sm-none"></i>
                <span class="d-none d-sm-block">Reset</span>
              </button>

              <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
               <input type="hidden" name="default_file" value="${member.me_image}"/>            
            
            </div>
          </div>
        </div>
        <hr class="my-0" />
        <div class="card-body">
            <div class="row">
              <div class="mb-3 col-md-6">
                <label for="email" class="form-label">이메일</label>
                <input
                  class="form-control"
                  type="text"
                  id="email"
                  name="email"
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
                <input class="form-control" type="text" name="me_name" id="me_name" value="${member.me_name}[${member.state}]" readonly />
              </div>
              <div class="mb-3 col-md-6">
                <label for="me_regDate" class="form-label">가입일자</label>
                <input class="form-control" type="text" id="me_regDate" name="me_regDate" value="<fmt:formatDate value="${member.me_regDate}" pattern = "yyyy-MM-dd"/>"readonly>
              </div>
              <div class="mb-3 col-md-6">
                <label for="me_pwd" class="form-label">비밀번호</label>
                <input class="form-control" type="text" id="me_pwd" name="me_pwd">
              </div>
            <div class="mt-2">
              <button id="submitBtn" type="submit" class="btn btn-primary me-2">변경</button>
              <button type="reset" class="btn btn-outline-secondary">취소</button>
            </div>
        </div>
       </div>
      </div>
    </form>
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