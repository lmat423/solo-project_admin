<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
  section  input[type=button] {
      margin-top:5px;
      width:80px;
      height:24px;
      border:1px solid green;
      background:white;
      border-radius:5px;
     
    }
   section {
      position:relative;
   }
   section #layer {
      position:absolute;
      visibility:hidden;
      border:1px solid green;
      width:200px;
      height:60px;
      background:white;
   }
 </style>
 <script>
   function getProduct(pcode)
   {
	   var x=event.pageX;
	   var y=event.pageY;
	   //alert(x+" "+y);
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   //alert(chk.responseText);
		   var data=JSON.parse(chk.responseText);
		   //alert(data.title);
		   document.getElementById("layer").style.visibility="visible";
		   document.getElementById("layer").style.left=x+"px";
		   document.getElementById("layer").style.top=y+"px";
		   document.getElementById("layer").innerText=data.title;
		   
	   }
	   chk.open("get","getProduct?pcode="+pcode);
	   chk.send();
   }
   function getBaesong(no)
   {
	   var x=event.pageX;
	   var y=event.pageY;
	   
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   //alert(chk.responseText);
		   var data=JSON.parse(chk.responseText);
		   //var juso=data.juso.substring(0,data.juso.indexOf(" "));
		   //alert(juso); // "제주특별자치도 서귀포시 몰라동 그래리"
		   var juso=data.juso.split(" ");
		   //alert(juso[0]);
		   document.getElementById("layer").style.visibility="visible";
		   document.getElementById("layer").style.left=x+"px";
		   document.getElementById("layer").style.top=y+"px";
		   document.getElementById("layer").innerText=juso[0];
	   }
	   chk.open("get","getBaesong?no="+no);
	   chk.send();
   }
 </script>
</head>
<body> <!-- gumaeState.jsp -->
  <section>
    <div id="layer"></div>
    <table width="1000" align="center">
      <caption> <h3> 구매 내역 </h3></caption>
      <tr>
        <td> 상품코드 </td>
        <td> 구매자 </td>
        <td> 결제금액 </td>
        <td> 수량 </td>
        <td> 주문일 </td>
        <td> 배송상태 </td>
        <td> 변경하기 </td>
      </tr>
    <c:forEach items="${glist}" var="gvo">
      <tr>
        <td onclick="getProduct('${gvo.pcode}')"> ${gvo.pcode} </td>
        <td onclick="getBaesong(${gvo.baeno})"> ${gvo.userid} </td>
        <td> <fmt:formatNumber value="${gvo.chongprice}" type="number"/>원 </td>
        <td> ${gvo.su} </td>
        <td> ${gvo.writeday} </td>
        <td>
          <c:choose>
               <c:when test="${gvo.state==0}">
                [결제완료]
               </c:when>
               <c:when test="${gvo.state==1}">
                [배송중]
               </c:when>
               <c:when test="${gvo.state==2}">
                [배송완료]
               </c:when>
               <c:when test="${gvo.state==3}">
                [취소신청]
               </c:when>
               <c:when test="${gvo.state==4}">
                [취소완료]
               </c:when>
               <c:when test="${gvo.state==5}">
                [교환신청]
               </c:when>
               <c:when test="${gvo.state==6}">
                [교환완료]
               </c:when>
               <c:when test="${gvo.state==7}">
                [반품신청]
               </c:when>
               <c:when test="${gvo.state==8}">
                [반품완료]
               </c:when>
               <c:otherwise>
                [이상해요]
               </c:otherwise>
             </c:choose>
        </td>
        <td>
          <c:if test="${gvo.state != 0}">
           <input type="button" value="배송중" disabled>
          </c:if>
          <c:if test="${gvo.state == 0}">
           <input type="button" value="배송중" onclick="location='stateChange?state=1&no=${gvo.no}'">
          </c:if>
          
          <c:if test="${gvo.state != 1}">
           <input type="button" value="배송완료" disabled>
          </c:if>
          <c:if test="${gvo.state == 1}">
           <input type="button" value="배송완료" onclick="location='stateChange?state=2&no=${gvo.no}'">
          </c:if>
          
           <c:if test="${ !(gvo.state==3 || gvo.state==5 || gvo.state==7) }">
           <input type="button" value="승인하기" disabled>
          </c:if>
          <c:if test="${gvo.state==3 || gvo.state==5 || gvo.state==7}">
            <c:if test="${gvo.state==3}"> <!-- state가 3일때 취소신청 => 4 -->
               <c:set var="aa" value="4"/>
               <c:set var="bb" value="취소"/>
            </c:if>
            <c:if test="${gvo.state==5}"> <!-- state가 5인 경우 교환신청 => 6 -->
               <c:set var="aa" value="6"/>
               <c:set var="bb" value="교환"/>
            </c:if>
            <c:if test="${gvo.state==7}"> <!-- state가 7인경우 반품신청 => 8 -->
               <c:set var="aa" value="8"/>
               <c:set var="bb" value="반품"/>
            </c:if>
           <input type="button" value="${bb}승인"  onclick="location='stateChange?state=${aa}&no=${gvo.no}'">
          </c:if>
        </td>
      </tr>
    </c:forEach>

    </table>
  </section>
</body>
</html>



