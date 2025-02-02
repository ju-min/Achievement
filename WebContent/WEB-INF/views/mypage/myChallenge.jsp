<%@page import="dto.Challenge"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 유저의 챌린지 정보를 가진 세션 객체
	List<Challenge> list =(List)session.getAttribute("challList");
%>


<script type="text/javascript">
	/* 슬라이드 영역 자바스크립트 */
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");

	  
	  if (n > slides.length) {
		  slideIndex = 1
		  } // 전체 길이 초과시 다시 처음으로 이동    
	  if (n < 1) {
		  slideIndex = slides.length
		  } // 0보다 작으면 마지막 페이지로
		  
		  
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	 
	  slides[slideIndex-1].style.display = "block";  

	}
	/*-------------------------------------------------  */
</script>

<!-- 구글 차트 로직  -->
<script type="text/javascript">
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ["Element", "좋아요", { role: "style" } ],
    
    <%for(int i = 0; i < list.size(); i++) {%>
			<% if(i % 2 == 0){ %>
			["<%=list.get(i).getChTitle() %>", <%=list.get(i).getChLikes() %>, "#A8201A"],	
			 <% } else { %> 
			["<%=list.get(i).getChTitle() %>", <%=list.get(i).getChLikes() %>, "#EC9A29"],
			<% } %>	
    <% } %>
    ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "챌린지별 좋아요 수",
    width: 600,
    height: 400,
    bar: {groupWidth: "80%"},
    legend: { position: "none" },
    animation: {
        duration: 2000,
        easing: 'out',
       	startup: true
    }
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
  chart.draw(view, options);
}
</script>
<!-- --------------------------------------------->

<style type="text/css">  
	
/* --------슬라이드 적용 css---------   */	


/* 슬라이드 전체 컨테이너  */
.slideshow-container {
  box-sizing: border-box;
  max-width: 630px;
  position: relative;
  margin: auto;
}

/* 안보이는 이미지 설정 */
.mySlides {
  display: none;
}

/* 버튼 옵션  */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}


/* 슬라이드 텍스트 */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 3px 12px;
  position: absolute;
  bottom: 5px;
  background-color: #143642;
  width: 96.3%;
  text-align: center;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
/* ------------------------   */	
</style>


<!-- 슬라이드 부분  html  -->
<h2>개인목표</h2>	
<div id="challDiv">
<div class="slideshow-container">
<%for(int i = 0; i < list.size(); i++) {%>
<div class="mySlides fade">
    <img src="/resources/img/logoRed.png" style="width:100%">
    <div class="text">
    	<h3><%=list.get(i).getChTitle() %></h3>
    	
    	<%-- 출력내용의 문자열 길이에 따른 다른 출력 --%>
    	<% String content = list.get(i).getChContent();%>
    	<% int contentLen = content.length(); %>
    	
    	<%if(contentLen > 15){ %>
    		<p><%= content.substring(0, 12) %> ...</p>
    	<% } else { %>
    		<p><%= content.substring(0, contentLen) %></p>
    	<% } %>
    	<%---------------------------------------------- --%>
    	챌린지일정: <%=list.get(i).getChStartDate() %> ~ <%=list.get(i).getChEndDate() %>
    </div>
  </div>
<% } %>

  <!-- 좌우 이동 버튼 -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>


<!------------------------------------  --> 

<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
 
</div> 
 