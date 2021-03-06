<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/template/footer.jsp" />

<script type="text/javascript">
	$().ready(function() {
		
		$("#searchBtn").click(function() {
			movePage("0");	
		});
		
		$("#startDateYear, #startDateMonth").change(function() {
			var data = $(this);
			if (data.attr("id") == "startDateYear") {
				var year = data.val();
				var month = $("#startDateMonth").val();
			}
			else {
				var year = $("#startDateYear").val();
				var month = data.val();
			}
			$.post("<c:url value="/api/data/max/"/>" + year + "/" + month,
					{},
					function(response) {
						$("#startDateDate").find("option").remove();
						setDate("#startDateDate", parseInt(response));
			});
		});
		
						
		$("#endDateYear, #endDateMonth").change(function() {
			var data = $(this);
			if (data.attr("id") == "startDateYear") {
				var year = data.val();
				var month = $("#startDateMonth").val();
			} else {
				var year = $("#startDateYear").val();
				var month = data.val();
			}
			$.post("<c:url value="/api/data/max/"/>" + year + "/" + month, 
					{}, 
					function(response) {
						$("#startDateDate").find("option").remove();
						setDate("#startDateDate", parseInt(response));
					});
		});

		// 1. 검색 날짜 셋팅
		setYear("#startDateYear", parseInt("${search.startDateYear - 6}"), parseInt("${search.startDateYear}"));

		setYear("#endDateYear", parseInt("${search.endDateYear - 6}"),	parseInt("${search.endDateYear}"));

		setMonth("#startDateMonth");
		setMonth("#endDateMonth");

		setDate("#startDateDate", parseInt("${startDateMaximumDate}"));
		setDate("#endDateDate", parseInt("${endDateMaximumDate}"));

		$("#startDateYear").val("${search.startDateYear}");
		$("#startDateMonth").val("${search.startDateMonth}");
		$("#startDateDate").val("${search.startDateDate}");

		$("#endDateYear").val("${search.endDateYear}");
		$("#endDateMonth").val("${search.endDateMonth}");
		$("#endDateDate").val("${search.endDateDate}");

		function setYear(elementId, startYear, endYear) {
			for (var i = startYear; i <= endYear; i++) {
				$(elementId).append($("<option>", {	value : i,	text : i	}));
					}
		}

		function setMonth(elementId) {
			for (var i = 1; i < 13; i++) {
				var value = (i < 10) ? "0" + i : i;
				$(elementId).append($("<option>", {	value : value, 	text : value}));
			}
		}

		function setDate(elementId, maximumdate) {
			for (var i = 1; i <= maximumdate; i++) {
				var value = (i < 10) ? "0" + i : i;
				$(elementId).append($("<option>", {	value : value, 	text : value}));
			}
		}
	});
</script>

		<form id="searchForm">
			<div>
				요청종류 : 
				<select id="requestType" name="requestType">
					<option value="" > 전체 </option>
					<option value="mbr" > Member </option>
					<option value="com" > Community</option>
					<option value="view" > View </option>
					<option value="upl" > Upload </option>
					<option value="dwn" > Download </option>
				</select>
				
				IP :
				<input type="text" id="ip" name="ip" />
			</div>
			<div>
				EMail : <input type="text" id="email" name="email" />
			</div>
			<div>
				Nickname : <input type="text" id="nickname" name="nickname" />
			</div>
			<div>
				LOG : <input type="text" id="log" name="log" />
			</div>
			<div>
				AS IS : <input type="text" id="asIs" name="asIs" />
			</div>
			<div>
				TO BE : <input type="text" id="toBe" name="toBe" />
			</div>
			<div>
				기간 : 
				<select id="startDateYear" name="startDateYear">
					
				</select> - <select id="startDateMonth" name="startDateMonth">
					
				</select> - <select id="startDateDate" name="startDateDate">
					
				</select> ~
				<select id="endDateYear" name="endDateYear">
					
				</select> - <select id="endDateMonth" name="endDateMonth">
					
				</select> - <select id="endDateDate" name="endDateDate">
					
				</select>
			</div>
			<div>
				<input type="button" id="searchBtn" value="검색" />
			</div>
			
			<table>
				<c:forEach items="${explorer.list}" var="history">
					<tr>
						<td>
							${history.histId}
						</td>
						<td>
							${history.histDate}
						</td>
						<td>
							${history.reqType}
						</td>
						<td>
							${history.ip}
						</td>
						<td>
							${history.log}
						</td>
					</tr>
				</c:forEach>
			</table>
			${explorer.make()}
		</form>