<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/resources/assets/"
  data-template="vertical-menu-template-free"
>

  <head>
  
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon/favicon.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/assets/vendor/fonts/boxicons.css" />
    <link rel="stylesheet" href="/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/assets/css/demo.css" />
    <link rel="stylesheet" href="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="/resources/assets/vendor/libs/apex-charts/apex-charts.css" />
	
	<!-- FullCalendar 2 -->
	<link rel="stylesheet"
		href="/resources/vendor/css/fullcalendar.min.css" />
	<%--  <link rel="stylesheet"
		href="${pageContext.request.contextPath }/resources/vendor/css/bootstrap.min.css" />  --%>
	<link rel="stylesheet"
		href='/resources/vendor/css/select2.min.css' />
	<link rel="stylesheet"
		href='/resources/vendor/css/bootstrap-datetimepicker.min.css' />
	
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	<link rel="stylesheet"
		href="/resources/css/main.css">
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/resources/assets/vendor/js/helpers.js"></script>
    <script src="/resources/assets/js/config.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- socket lib -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
 	<script type="text/javascript">
 		var socket = null;
 		
 		$(document).ready(function() {
 			
 			 // 메뉴 클릭시 css처리
 			$(".menu-item a").each(function() {
 				var href = $(this).attr("href");
 			      if (path === href) {
 			        $(this).closest(".menu-item").addClass("active");
 			      
 			      } else if (path.startsWith(href) && href !== "/") {
 			        // Handle cases where the URL path starts with the menu item's URL
 			        $(this).closest(".menu-item").addClass("active");
 				}
 			});
 			
 			$(".menu-item").click(function() {
 				$(".menu-item").removeClass("active");
 		
 			$(this).addClass("active");	
			
 			
 			}); 
 			
 			// 자유게시판 클릭했을때 list를 get으로 넘겼기 때문에 default로 pageNum & amount를 설정한다.
 			$("#BoardLink").click(function(e) {
 				e.preventDefault();
 			
 				$("#boardForm input[name='pageNum']").val(1);
 				$("#boardForm input[name='amount']").val(10);
 				
 				$("#boardForm").submit();
 			
 				
 			});
 			
 		// 자유게시판 클릭했을때 list를 get으로 넘겼기 때문에 default로 pageNum & amount를 설정한다.
 			$("#NoticeLink").click(function(e) {
 				e.preventDefault();
 			
 				$("#noticeForm input[name='pageNum']").val(1);
 				$("#noticeForm input[name='amount']").val(10);
 				
 				$("#noticeForm").submit();
 			});
 			// 제이쿼리 끝
 		});
 		
 	</script>
 
  </head>

  <body>
  
  <form id="boardForm" action="/board/list" method="post">
  	<input type="hidden" name="pageNum"	value="1">
  	<input type="hidden" name="amount"	value="10">
  </form>
  
   <form id="noticeForm" action="/notice/list" method="post">
  	<input type="hidden" name="pageNum"	value="1">
  	<input type="hidden" name="amount"	value="10">
  </form>
  

    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="/home" class="app-brand-link">
              <span class="app-brand-logo demo">
                <svg
                  width="25"
                  viewBox="0 0 25 42"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                >
                  <defs>
                    <path
                      d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                      id="path-1"
                    ></path>
                    <path
                      d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                      id="path-3"
                    ></path>
                    <path
                      d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                      id="path-4"
                    ></path>
                    <path
                      d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                      id="path-5"
                    ></path>
                  </defs>
                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                          <mask id="mask-2" fill="white">
                            <use xlink:href="#path-1"></use>
                          </mask>
                          <use fill="#696cff" xlink:href="#path-1"></use>
                          <g id="Path-3" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-3"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                          </g>
                          <g id="Path-4" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-4"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                          </g>
                        </g>
                        <g
                          id="Triangle"
                          transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                        >
                          <use fill="#696cff" xlink:href="#path-5"></use>
                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
              </span>
              <span class="app-brand-text demo menu-text fw-bolder ms-2">WithComm</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>
         

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <li class="menu-header small text-uppercase"><span class="menu-header-text">게시판</span></li>
	            <li class="menu-item">
	              <a href="/notice/list" class="menu-link" id="NoticeLink">
	                <i class="menu-icon tf-icons bx bx-dock-top"></i>
	                <div data-i18n="Basic">공지사항</div>
	              </a>
	            </li>
            
           <li class="menu-item">
	              <a href="/board/list" class="menu-link" id="BoardLink">
	                <i class="bx bx-globe"></i>
	                <div data-i18n="Basic">&nbsp;&nbsp;&nbsp;&nbsp;자유 게시판</div>
	              </a>
	            </li>
            
            <li class="menu-item">
	              <a href="/know/list" class="menu-link">
	                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
	                <div data-i18n="Basic">지식인</div>
	              </a>
            </li>
            
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Components</span></li>
            <li class="menu-item">
	              <a href="#" class="menu-link">
	                <i class="bx bxs-user-check"></i>&nbsp;
	                <div data-i18n="Basic">&nbsp;&nbsp;구인/구직</div>
	              </a>
            </li>
            
            <li class="menu-item">
              <a href="#" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">이벤트</div>
              </a>
            </li>

           
            <!-- Tables -->
            <li class="menu-item">
              <a href="/calendar/index" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">달력</div>
              </a>
            </li>
            <!-- Misc -->
           <li class="menu-header small text-uppercase"><span class="menu-header-text">Misc</span></li>
            <li class="menu-item">
              <a href="#" target="_blank" class="menu-link">
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div data-i18n="Documentation">파일 게시판</div>
              </a>
            </li>
          <c:if test="${member.me_email == 'admin@with.com'}">
            <li class="menu-item">
              <a href="/setting/control" class="menu-link">
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div data-i18n="Documentation">환경 설정</div>
              </a>
            </li>
          </c:if>
          </ul>
        </aside>

        <div class="layout-page">
        <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>

                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
                  />
                </div>
              </div>

             <ul class="navbar-nav flex-row align-items-center ms-auto">
				    <!-- User -->
				    <c:if test="${member != null}">
				        <li class="nav-item navbar-dropdown dropdown-user dropdown">
				            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
				                <div class="avatar avatar-online">
				                    <img src="/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
				                </div>
				            </a>
				            <ul class="dropdown-menu dropdown-menu-end">
				                <li>
				                    <a class="dropdown-item" href="#">
				                        <div class="d-flex">
				                            <div class="flex-shrink-0 me-3">
				                                <div class="avatar avatar-online">
				                                    <img src="/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
				                                </div>
				                            </div>
				                            <div class="flex-grow-1">
				                                <span class="fw-semibold d-block">${member.me_name}</span>
				                                <small class="text-muted">${member.state}</small>
				                            </div>
				                        </div>
				                    </a>
				                </li>
				                
				                
				                
				                <li>
				                    <div class="dropdown-divider"></div>
				                </li>
				                
			                <c:if test="${member.state == '관리자'}">
				                <li>
				                    <a class="dropdown-item" href="#">
				                       <i class='bx bxs-slideshow' ></i>
				                        <span class="align-middle">관리자 페이지</span>
				                    </a>
				                </li>
			                </c:if>
			                
				                <li>
				                    <a class="dropdown-item" href="/account/profile">
				                        <i class="bx bx-user me-2"></i>
				                        <span class="align-middle">나의 프로필</span>
				                    </a>
				                </li>
				                <li>
				                    <a class="dropdown-item" href="/inquiry/list">
				                        <span class="d-flex align-items-center align-middle">
				                            <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
				                            <span class="flex-grow-1 align-middle">&nbsp;1:1문의</span>
				                            <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">${inqCnt.inqCount}</span>
				                        </span>
				                    </a>
				                </li>
				                <li>
				                    <a class="dropdown-item" href="/mail/recevMail">
				                        <i class="bx bx-cog me-2"></i>
				                        <span class="align-middle" id="ready">메일</span>
				                    </a>
				                </li>
				                <li>
				                    <a class="dropdown-item" href="/msg/list">
				                        <i class="bx bx-cog me-2"></i>
				                        <span class="align-middle" id="ready">쪽지</span>
				                    </a>
				                </li>
				                <li>
				                    <div class="dropdown-divider"></div>
				                </li>
				                <li>
				                    <a class="dropdown-item" href="/account/logout" id="logoutBtn">
				                        <i class="bx bx-power-off me-2"></i>
				                        <span class="align-middle">Log Out</span>
				                    </a>
				                </li>
				                <li>
				                    <div class="dropdown-divider"></div>
				                </li>
				            </ul>
				        </li>
				        <li class="nav-item">
				            <span class="nav-link" style="color: black;"><strong>${member.me_name}</strong>님, 환영합니다!</span>
				        </li>
				    </c:if>
				    <c:if test="${member == null}">
				        <li class="nav-item">
				            <a href="/account/login" class="btn btn-primary" style="color: white; font-weight: bold;">로그인</a>&nbsp;
				        </li>
				        <li class="nav-item">
				            <a href="/account/register" class="btn btn-success" style="color: white; font-weight: bold;">회원가입</a>
				        </li>
				    </c:if>
				</ul>
            </div>
          </nav>
          
		<div id="spinnerDiv" style="display: none;">
		  <div class="spinner-border spinner-border-lg text-primary" role="status">
		    <span class="visually-hidden">Loading...</span>
		  </div>
		</div>