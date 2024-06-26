<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@include file="/WEB-INF/views/include/header.jsp"%>    
    
<div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Account Settings /</span> Alram</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link" href="/account/profile"><i class="bx bx-user me-1"></i> 계정</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="/account/IndNotice"
                        ><i class="bx bx-bell me-1"></i> 계정공지</a
                      >
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="/account/alram"
                        ><i class="bx bx-link-alt me-1"></i> 알림</a
                      >
                    </li>
                  </ul>
                  <div class="card mb-4">
                    <h5 class="card-header">알림 (준비중)</h5>
                    <!-- Account -->
                   <%--  <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="/resources/assets/img/avatars/1.png"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
                          width="100"
                          id="uploadedAvatar"
                        />
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">Upload new photo</span>
                            <i class="bx bx-upload d-block d-sm-none"></i>
                            <input
                              type="file"
                              id="upload"
                              class="account-file-input"
                              hidden
                              accept="image/png, image/jpeg"
                            />
                          </label>
                          <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                            <i class="bx bx-reset d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">Reset</span>
                          </button>

                          <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                        </div>
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" method="POST" onsubmit="return false">
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
                            <input class="form-control" type="text" name="me_name" id="me_name" value="${member.me_name}" readonly />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="state" class="form-label">가입일자</label>
                            <input class="form-control" type="text" id="me_regDate" name="me_regDate" value="<fmt:formatDate value="${member.me_regDate}" pattern = "yyyy-MM-dd"/>"readonly>
                          </div>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">Save changes</button>
                          <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
                  <div class="card">
                    <h5 class="card-header">Delete Account</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">Are you sure you want to delete your account?</h6>
                          <p class="mb-0">Once you delete your account, there is no going back. Please be certain.</p>
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
                          <label class="form-check-label" for="accountActivation"
                            >I confirm my account deactivation</label
                          >
                        </div>
                        <button type="submit" class="btn btn-danger deactivate-account">Deactivate Account</button>
                      </form>
                    </div>--%>
                  </div>
                </div>
              </div> 
            </div>
        
        
        
<%@include file="/WEB-INF/views/include/footer.jsp"%>