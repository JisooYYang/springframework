<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxTest4.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  	'use strict';  
    // 개별검색(vo 사용)
    function idCheck() {
    	let oid = myForm.oid.value;
    	if(oid == "") {
    		alert("아이디를 입력하세요!");
    		myForm.oid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/study/ajax/ajaxTest4",
    		data : {oid : oid},
    		success:function(vo) {
    			let str = '<b>전송결과</b><hr/>';
    			if(vo != '') {
  				  str += 'ID : '+vo.oid+'<br/>';
  				  str += 'Name : '+vo.name+'<br/>';
  				  str += 'Password : '+vo.pwd+'<br/>';
  				  str += 'Keyidx : '+vo.keyIdx+'<br/>';
  			  }
  			  else {
  				  str += '<font color="red"><b>찾는 자료가 없습니다</b></font>';
  			  }
  			  
  			  $("#demo").html(str);
  		  },
  		  error   : function() {
  			  alert("전송오류!");
  		  }
  	  });
    }
    
    // 전체검색 (vos 사용)
    function idList() {
    	let oid = myForm.oid.value;
    	if(oid == "") {
    		alert("아이디를 입력하세요!");
    		myForm.oid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/study/ajax/ajaxTest5",
    		data : {oid : oid},
    		success:function(vos) {
    			let str = '<b>전송결과</b><hr/>';
    			if(vos != '') {
  				  str += '<table class="table table-hover text-center">';
  				  str += '<tr class="table-dark text-dark">';
  				  str += '<th>ID</th><th>Name</th><th>Password</th><th>KeyIdx</th>';
  				  str += '</tr>';
  				  for(let i=0; i<vos.length; i++) {
    				  str += '<tr>';
    				  str += '<td>' + vos[i].oid + '</td>';		// vos(i)
    				  str += '<td>' + vos[i].name + '</td>';
    				  str += '<td>' + vos[i].pwd + '</td>';
    				  str += '<td>' + vos[i].keyIdx + '</td>';
    				  str += '</tr>';
  				  }
  				  str += '</table>';
  			  }
  			  else {
  				  str += '<font color="red"><b>찾는 자료가 없습니다</b></font>';
  			  }
  			  
  			  $("#demo").html(str);
  		  },
  		  error   : function() {
  			  alert("전송오류!");
  		  }
  	  });
    }
    
    
    
    
    
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
  <form name="myForm">
    <h2>aJax를 활용한 '회원 아이디' 검색하기</h2>
    <hr/>
    <p> ID
      <input type="text" name="oid" autofocus/> &nbsp;
      <input type="button" value="ID matcing Search" onclick="idCheck()" class="btn btn-secondary"/> &nbsp;
      <input type="button" value="ID portion Search" onclick="idList()" class="btn btn-secondary"/> &nbsp;
      <input type="reset" value="Reset" class="btn btn-secondary"/> &nbsp;
      <input type="button" value="Back" onclick="location.href='${ctp}/study/ajax/ajaxMenu';" class="btn btn-secondary"/> &nbsp;
    </p>
    <hr/>
    <p id="demo"></p>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>