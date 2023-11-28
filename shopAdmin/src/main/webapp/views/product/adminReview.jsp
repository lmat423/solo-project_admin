<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
     .cont {
       width:500px;
       height:50px;
       overflow:auto;
     }
     table {
       border-spacing:0px;
     }
     table tr td {
       border-bottom:1px solid green;
     }
  </style>
  <script>
    function reviewDel(no)
    {
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		//alert(chk.responseText);
    		// 현재문서를 새로고침
    		location.reload();
    	}
    	chk.open("get","reviewDel?no="+no);
    	chk.send();
    }
  </script>
  
</head>
<body>  <!-- product/adminReview.jsp -->
   <section>
     <table width="1060" align="center" >
       <tr align="center">
         <td width="80"> 사용자 </td>
         <td width="40"> 별점 </td>
         <td width="200"> 한 줄요약 </td>
         <td width="500"> 내 용 </td>
         <td width="80"> 신고건수 </td>
         <td width="100"> 등록일 </td>
         <td> 삭제 </td>
       </tr>
      <c:forEach items="${rlist}" var="rvo">
       <tr align="center">
         <td> ${rvo.userid} </td>
         <td> ${rvo.star} </td>
         <td> ${rvo.title} </td>
         <td align="left"> <div class="cont"> ${rvo.content} </div></td>
         <td> ${rvo.singo}건 </td>
         <td> ${rvo.writeday} </td>
         <td> <a href="javascript:reviewDel(${rvo.no})"> click </a> </td>
       </tr>  
      </c:forEach>
     </table>
   </section>
</body>
</html>






