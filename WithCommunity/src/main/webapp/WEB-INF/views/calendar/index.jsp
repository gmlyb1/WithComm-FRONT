<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	var msg = "${msg}";
	console.log(msg);
	if(msg != "") {
		alert(msg);
	};

</script>
 <style>
        /* Calendar container */
        .calendar {
            width: 100%;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        
        /* Navigation */
        .navigation {
            text-align: center;
            padding: 10px;
            background-color: #A0D9E2;
            color: #fff;
            font-weight: bold;
        }
        
        /* Month and Year */
        .this_month {
            font-size: 18px;
            margin: 0 10px;
        }
        
        /* Calendar table */
        .calendar_body {
            width: 100%;
        }
        
        .day {
            text-align: center;
            padding: 10px;
            font-weight: bold;
            border-bottom: 1px solid #ccc;
        }
        
        /* Days of the week */
        .sun, .sat {
            color: red;
        }
        
        /* Today button */
        .today_button_div {
            margin: 20px auto;
            text-align: center;
        }
        
        /* Schedule links */
        .date_subject {
            text-decoration: none;
        }
        
        .date_subject:hover {
            text-decoration: underline;
        }
    </style>
<%@ include file="../include/header.jsp"%>
<!--------------------------------- 캘린더 영역 ------------------------------>
<form name="calendarFrm" id="calendarFrm" action="" method="GET">
	<input type="hidden" name="year" value="${today_info.search_year}"/>
	<input type="hidden" name="month" value="${today_info.search_month-1}"/>
	
	<div class="calendar">
		<div class="navigation">
			<a class="before_after_year" href="/calendar/index?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
			&lt;&lt;
			</a>
			<a class="before_after_month" href="/calendar/index?year=${today_info.before_year}&month=${today_info.before_month}">
			&lt;
			</a>
			<!-- 이전 달 -->
			<span class="this_month">&nbsp;${today_info.search_year}. <c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}</span>
			<a class="before_after_month" href="/calendar.index?year=${today_info.after_year}&month=${today_info.after_month}">
			&gt;
			</a>
			<a class="before_after_year" href="/calendar/index?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
				&gt;&gt;
			</a>
		</div>
		
		<div class="today_button_div">
			<button type="button" class="buttonstyle" onclick="javascript:location.href='/calendar/index'" style="height: 30px; width: 80px;">Today</button>
			<button type="button" class="buttonstyle board_move openMask_board_move pointer" style="height: 30px; width: 130px;">Add Schedule</button>
		</div>
		
		<table class="calendar_body">
			<thead>
				<tr bgcolor="#A0D9E2">
					<td class="day sun">Sun</td>
					<td class="day">Mon</td>
					<td class="day">Tue</td>
					<td class="day">Wed</td>
					<td class="day">Thu</td>
					<td class="day">Fri</td>
					<td class="day">Sat</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
						<c:choose>
							<c:when test="${dateList.value == 'today'}">
								<c:if test="${date_status.index % 7 == 0 }">
											
				</tr>
					</c:if>
					<td class="today">
						<div class="date">
							</c:when>
							<c:when test="${date_status.index % 7 == 6}">
						<td class="sat_day">
							<div class="sat">
								</c:when>
								<c:when test="${date_status.index % 7 == 0}">
				</tr>
				<tr>
					<td class="sun_day">
						<div class="sun">
							</c:when>
							<c:otherwise>
					<td class="normal_day">
						<td class="normal_day">
							<div class="date">
								</c:otherwise>
								</c:choose>
								${dateList.date}
							</div> 
							<div>
								<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status">
									<a href="schedule_show?shcedule_idx=${shceduleList.shcedule_idx}" onclick="window.open(this.href, '_blank', 'width=550,height=660, left=680%, top=200%, toolbars=no, scrollbars=no'); return false;" class="date_subject" style="color:${scheduleList.schedule_mycolor}">${scheduleList.schedule_subject}</a>
									<br>
								</c:forEach>							
							</div>
						</td>
					</c:forEach>				
			</tbody>
		</table>
</form>
<!--------------------------------- 캘린더 영역 ------------------------------>
<%@ include file="../include/footer.jsp"%>