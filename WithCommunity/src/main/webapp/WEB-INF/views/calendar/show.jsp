<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="mask_board_move"></div>
<div class="normal_move_board_modal">
	<script type="text/javascript">
		$(function)() {
			$("#testDatepicker")
			.datepicker(
				{
					dateFormat: 'yy-mm-dd',
					changeMonth: true,
					changeYear: true,
					dayNames: ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
					dayNamesMin: ['월','화','수','목','금','토','일'],
					monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
			});
		});
		
		function scheduleAdd() {
			var schedule_add_form = document.schedule_add;
			if(schedule_add_form.schedule_date.value == "" || schedule_add_form.schedule_date.value == null) {
				alert("날짜를 입력해 주세요");
				schedule_add_form.schedule_date.focus();
				return false;
			}else if(schedule_add_form.schedule_subject.value == "" || schedule_add_form.schedule_subject.value == null) {
				alert("제목을 입력해 주세요.");
				schedule_add_form.schedule_date.focus();
				return false;
			}
			
			schedule_add_form.submit();
		}
		
		function wrapCreateBoardByMask() {
			
			//화면의 높이와 너비
			var maskHeight = $(document).height();
			var maskWidth = ${document}.width();
			
			// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다
			$("#mask_board_move").css({
				'width': maskWidth,
				'height': maskHeight
			});
			
			$('#mask_board_move').fadeTo("slow",0.7);
			$('.normal_move_board_modal').show();
			
			$(function(){ 
				$('.openMask_board_move').click(function(e){
					console.log("모달 켭니다").
					e.preventDefault();
					wrapCreateBoardByMask();
				});
				
				$('.normal_move_board_modal .top .close').click(function(e){
					e.preventDefault();
					$('#mask_board_move, .normal_move_board_modal').hide();
				});
				
				$('#mask_board_move').click(function() {
					$(this).hide();
					$('.normal_move_board_modal').hide();
				});
			});
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function(){ 
			var formObj = $("form");
			
			$('button').on("click",function(e){
				e.preventDefault();
			
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'delete') {
					formObj.attr("action","/delete");
				}else if(opertion === 'modify') {
					formObj.attr("action","/modify");
				}
				formObj.submit();
			});
		});
	</script>
	<div class="top" style="">
		<div class="close">x</div>
		<div class="subject">Add Schedule</div>
	</div>	
	
	<div class="bottom">
		<div class="info">* 순번은 해당 날짜안에서 순서대로 입력이 됩니다. (하루에 최대 4개의 스케줄만 등록할 수 있습니다.)</div>
		<form name="schedule_add" action="/calendar/add">
			<input type="hidden" name="year" value="${today_info.search_year}"/>
			<input type="hidden" name="month" value="${today_info.search_month-1}"/>
			
			<div class="contents">
				<ul>
					<li>
						<div class="text_subject">순번 :</div>
						<div class="text_desc">
							<input type="text" name="schedule_num" class="text_type1"/>
						</div>
					</li>
					
					<li>
						<div class="text_subject">날짜 :</div>
						<div class="text_desc">
							<input type="text" name="schedule_date" class="text_type1" id="testDatepicker" readonly/>
						</div>
					</li>
					
					<li>
						<div class="text_subject">공유 :</div>
							<input class="radio" type="radio" name="schedule_share" value="1" checked>공개
							<input class="radio" type="radio" name="schedule_share" value="2"        >비공개
					</li>				
					
					<li>
						<div class="text_subject">색상 :</div>
							<input class="colorbox" type='color' name='schedule_mycolor' value='${shcedule_show.schedule_mycolor}'/>
					</li>
					
					<li class="button_li">
						<div class="managebutton">
							<button type="submit" data-oper='modify' class="buttonstyle board_manage_go pointer">Modify</button>
							<button type="submit" data-oper='delete' class="buttonstyle2 board_manage_go pointer">Delete</button>
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</div>

