<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
<script type="text/javascript">
</script>

<div class="container-fluid">
	<br>
	<h1 class="h3 mb-2 text-gray-800">환경설정</h1>
	<br/>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
				<ol class="breadcrumb breadcrumb-style2 mb-0">
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">설정</a>
               </li>
               <li class="breadcrumb-item">
                 <a href="javascript:void(0);">환경설정</a>
               </li>
             </ol>
			<br>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<form method="post" id="updateForm" action="/setting/update">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					    <thead>
					        <tr>
					            <th class="text-center" style="width:30%;">공지사항</th>
					            <td class="text-center" style="width:70%;">
					            	 <input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					        <tr>
					            <th class="text-center" style="width:30%;">자유게시판</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					        <tr>
					            <th class="text-center" style="width:30%;">지식인</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					         <tr>
					            <th class="text-center" style="width:30%;">구인/구직</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					         <tr>
					            <th class="text-center" style="width:30%;">이벤트</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					         <tr>
					            <th class="text-center" style="width:30%;">달력</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					         <tr>
					            <th class="text-center" style="width:30%;">운영자 상담</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					         <tr>
					            <th class="text-center" style="width:30%;">운영진 상담</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					         <tr>
					            <th class="text-center" style="width:30%;">파일 게시판</th>
					            <td class="text-center" style="width:70%;">
					            	<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
					            </td>
					        </tr>
					        
					    </thead>
					</table>
			</div>
		</div>
		
		<div class="d-flex justify-content-center align-items-center">
			<button type="submit" class="btn btn-success">수정</button> <br>
		</div> 
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp"%>