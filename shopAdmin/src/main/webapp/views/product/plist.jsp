<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function adminReview(pcode)
    {
    	open("adminReview?pcode="+pcode,"","width=1000,height=400");
    }
  </script>
</head>
<body>
  <%@ include file="../top.jsp" %>
  <table width="1000" align="center">
    <caption> <h3> <a href="productAdd"> 상품등록 </a></h3>
    <tr>
      <td width="100"> 상품명 </td>
      <td> 상품이미지 </td>
      <td> 상품상세 </td>
      <td> 가격 </td>
      <td> 할인율 </td>
      <td> 수량 </td>
      <td> 배송비 </td>
      <td> 별점 </td>
      <td> 배송기간 </td>
      <td> 적립율 </td>
      <td> 등록일 </td>
      <td> 상품평확인 </td>
      <!-- <td> 삭제 </td> -->
    </tr>
   <c:forEach items="${plist}" var="pvo">
    <tr>
      <td> ${pvo.title} </td>
      <td> <img src="/static/pro/${pvo.pimg}" width="40" height="40"> </td>
      <td> <img src="/static/pro/${pvo.dimg}" width="40" height="40"> </td>
      <td> ${pvo.price} </td>
      <td> ${pvo.halin} </td>
      <td> ${pvo.su} </td>
      <td> ${pvo.bprice} </td>
      <td> ${pvo.star} </td>
      <td> ${pvo.btime} </td>
      <td> ${pvo.juk} </td>
      <td> ${pvo.writeday} </td>
      <td align="center" onclick="adminReview('${pvo.pcode}')"> ${pvo.cnt}(${pvo.singo}) </td>
     <%--  <td> <a href="delete?no=${pvo.no}"> click </a> </td> --%>
    </tr>
   </c:forEach>
  </table>
</body>
</html>






