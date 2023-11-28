<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section {
      font-size:13px;
      margin-top:50px;
    }
    .cont {
      width:650px;
      height:60px;
      overflow:auto;
    } 
    table {
      border-spacing:0px;
    }
    table tr th {
      border-bottom:3px solid green;
      padding-bottom:10px;
    }
    table tr td {
      border-bottom:1px solid green;
      padding:8px;
      text-align:center;
    }
  </style>
</head>
 <%@ include file="../top.jsp" %>
<body> <!-- answer/answerlist.jsp -->
  <section>
    <table width="1080" align="center">
      <tr>
        <th width="60"> 문의자 </th>
        <th width="120"> 상품명 </th>
        <th width="80"> 문의분류 </th>
        <th> 문의내용 </th>
        <th width="90"> 등록일 </th>
        <th width="80"> 답변달기 </th>
      </tr>
     <c:forEach items="${mapall}" var="map"> 
      <c:set var="bb" value=""/>
      <c:if test="${map.seq==1}">
         <c:set var="bb" value="style='background:#eeeeee'"/>
      </c:if>
      
      <c:if test="${map.title==0}"> 
          <c:set var="title" value="상품관련"/>
      </c:if>
      <c:if test="${map.title==1}"> 
          <c:set var="title" value="결제관련"/>
      </c:if>
      <c:if test="${map.title==2}"> 
          <c:set var="title" value="배송관련"/>
      </c:if>
      <c:if test="${map.title==3}"> 
          <c:set var="title" value="그 외"/>
      </c:if>
      
      <tr ${bb}>
        <td> ${map.userid} </td>
        <td> ${map.ptitle} </td>
        <td> ${title} </td>
        <td style="text-align:left;"> <div class="cont"> ${map.content} </div> </td>
        <td> ${map.writeday} </td>
        
       <c:if test="${map.seq==0 and map.cnt==0}"> <!-- 질문인지, 답변이 있는지 -->
        <td onclick="questOk(${map.title},'${map.pcode}',${map.grp})"> click </td>
       </c:if>
       <c:if test="${map.seq==1 || map.cnt==1}">
        <td> &nbsp;</td>
       </c:if>
      </tr>
     </c:forEach>
    </table>
    
    <div id="qform">
     <form name="qform" method="post" action="questOk">
      <input type="hidden" name="title">
      <input type="hidden" name="pcode">
      <input type="hidden" name="grp">
      <textarea name="content"></textarea> <p>
      <input type="submit" value="답변달기">
     </form>
    </div>
  </section>
  <style>
    #qform {
      position:absolute;
      visibility:hidden;
    }
    #qform textarea {
      width:300px;
      height:120px;
    }
  </style>
  <script>
    function questOk(title,pcode,grp)
    {
    	document.qform.title.value=title;
    	document.qform.pcode.value=pcode;
    	document.qform.grp.value=grp;
    	
    	// 레이어 보이기
    	document.getElementById("qform").style.visibility="visible";
    	// 레이어 위치 이동(마우스 근처)
    	var x=event.clientX;
    	var y=event.clientY;
    	document.getElementById("qform").style.left=(x-400)+"px";
    	document.getElementById("qform").style.top=(y-60)+"px";
    }
  </script>
  
</body>
</html>






