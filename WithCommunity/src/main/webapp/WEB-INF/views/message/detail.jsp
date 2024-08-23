<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%@include file="../include/header.jsp"%>

<div class="container mt-4">
    <div class="card shadow-sm">
        <div class="card-header">
            <h5 class="mb-0">쪽지 상세 보기</h5>
        </div>
        <div class="card-body">
            <form role="form" method="post" name="readForm">
                <input type="hidden" id="rowNo" name="rowNo" value="${detail.rowNo}" />
                <input type="hidden" id="msg_id" name="msg_id" value="${detail.msg_id}" />
                <input type="hidden" id="recev_name" name="recev_name" value="${member.me_email}"/>

                <div class="row">
                    <div class="col-lg-12">
                        <table class="table table-bordered table-hover">
                            <tbody>
                                <tr>
                                    <th scope="row" style="width: 20%;">제목</th>
                                    <td>${detail.msg_title}</td>
                                </tr>
                                <tr>
                                    <th scope="row">발신자</th>
                                    <td>${detail.sender_name}</td>
                                </tr>
                                <tr>
                                    <th scope="row">수신자</th>
                                    <td>${detail.recev_name}</td>
                                </tr>
                                <tr>
                                    <th scope="row">작성일</th>
                                    <td>${detail.create_dt}</td>
                                </tr>
                                <tr>
                                    <th scope="row">내용</th>
                                    <td>${detail.msg_content}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="button" class="btn btn-primary" onclick="window.history.back();">뒤로가기</button>
                    <button type="submit" class="btn btn-danger">삭제</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="../include/footer.jsp"%>