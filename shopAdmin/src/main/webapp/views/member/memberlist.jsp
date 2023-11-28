<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
 <%@ include file="../top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- member/memberlist.jsp -->
 <table width="1000" align="center">
   <tr>
     <td> 아이디 </td>
     <td> 이 름 </td>
     <td> 전화번호 </td>
     <td> 이메일 </td>
     <td> 등 급 </td>
     <td> 상 태 </td>
     <td> 가입일 </td>
   </tr>
  <c:forEach items="${mlist}" var="mvo">
   <tr>
     <td> ${mvo.userid} </td>
     <td> ${mvo.name} </td>
     <td> ${mvo.phone} </td>
     <td> ${mvo.email} </td>
     <td> 
       <c:if test="${mvo.level == 0}">
         bronze
       </c:if>
       <c:if test="${mvo.level == 30}">
         silver
       </c:if>
       <c:if test="${mvo.level == 60}">
         gold
       </c:if>
       <c:if test="${mvo.level >= 90}">
         diamond
       </c:if>
     </td>
     <td> 
       <c:if test="${mvo.state == 0}">
         정상회원
       </c:if>
       <c:if test="${mvo.state == 1}">
         <a href="memberOut?no=${mvo.no}"> 탈퇴신청중 </a>
       </c:if>
       <c:if test="${mvo.state == 2}">
         탈퇴회원
       </c:if>
     </td>
     <td> ${mvo.writeday} </td>
   </tr>
  </c:forEach>
 </table>
</body>
</html>













