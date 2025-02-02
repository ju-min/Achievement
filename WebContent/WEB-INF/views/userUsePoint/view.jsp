<%@page import="dto.RefundPoint"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/bootHeader.jsp" %>
<%@ include file="/WEB-INF/views/layout/bootNavigation.jsp" %>
<%RefundPoint refundPoint = (RefundPoint)request.getAttribute("refundPoint"); %>
<div class="container">
<script type="text/javascript">
$(document).ready(function() {
	//포인트 사용 동작 버튼
	
	$("#btnPoint").click(function() {
		$("form").submit();
	});

	$("#btnList").click(function(){
		$(location).attr("href","/user/use/point/list");
		
	})
})
</script>
<style type="text/css">
td{
	height:80px;
	vertical-align:middle !important;
}
talbe, th, td{
	border: none !important;
	font-size: 20px;
}
input{
	text-align:center;
}
</style>

<div class="container">
<form method="post" action="user/use/point/write">
<table class="table table-responsive"  style="text-align: center;">
	<tr><td colspan="3">포인트 사용하기</td></tr>
	<tr><td colspan="3"><img src="/upload/<%=refundPoint.getChStoredName() %>" width="400" height="300"/></td></tr>
	<tr><td colspan="2">챌린지 번호</td><td><input type="text" name="chNo" value="<%=refundPoint.getChNo()%>" readonly/></td></tr>
	<tr><td colspan="2">챌린지 제목</td><td><input type="text" name="chTitle" value="<%=refundPoint.getChTitle()%>" readonly/></td></tr>
	<tr><td colspan="2">환불 가능 금액</td><td><input type="text" name="refundableAmount" value="<%=refundPoint.getRefundableAmount()%>" readonly/></td></tr>
	<tr><td colspan="2">사용 가능 포인트</td><td><input type="text" name="refundablePoint" value="<%=refundPoint.getRefundableAmount()/100%>" readonly/></td></tr>
	<tr><td colspan="2">예금주</td><td><input type="text" name="paybRefundHolder" value="<%=refundPoint.getPaybRefundHolder()%>" readonly/></td></tr>
	<tr><td colspan="2">은행이름</td><td><input type="text" name="paybRefundBank" value="<%=refundPoint.getPaybRefundBank()%>" readonly/></td></tr>
	<tr><td colspan="2">계좌번호</td><td><input type="text" name="paybRefundAccount" value="<%=refundPoint.getPaybRefundAccount()%>" readonly/></td></tr>
	<tr><td colspan="2">포인트 사용</td><td><input type="number" name="refundPoint" min=0 value=0 step=10 /></td></tr>
</table>
</form>
<div class="text-center">
<button id="btnPoint" class="btn btn-info">포인트 사용</button>
<button id="btnList" class="btn btn-primary">목록</button>
</div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>