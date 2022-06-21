<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productInput.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
  'use strict';

  $(function() {
  	$("#product1").change(function() {
    	var product1 = $(this).val();
  		if(product1 == "") {
  			alert("대분류를 선택하세요");
  			return false;
  		}

  		$.ajax({
        type : "post",
        url  : "${ctp}/shop/input/product2",
        data : {product1 : product1},
        success:function(vos) {
          var str = '';
          str += '<option value="">중분류</option>';
          for(let i=0; i<vos.length; i++) {
        	  if(vos[i] == null) break;
            str += '<option>'+vos[i]+'</option>';
          }
          $("#product2").html(str);
        },
        error   : function() {
          alert("전송오류!");
        }
      });
  	});
  });

  $(function() {
  	$("#product2").change(function() {
  		var product1 = $("#product1").val();
  		var product2 = $(this).val();
  		var query = {
  				product1 : product1,
  				product2 : product2
  			};

  		$.ajax({
        type : "post",
        url  : "${ctp}/shop/input/product3",
        data : query,
        success:function(vos) {
          let str = '';
          str += '<option value="">소분류</option>';
          for(let i=0; i<vos.length; i++) {
        	  if(vos[i] == null) break;
            str += '<option>'+vos[i]+'</option>';
          }
          $("#product3").html(str);
        },
        error   : function() {
          alert("전송오류!");
        }
      });
  	});
  });
  
/*   
  function productClose() {
    $("#productInputView").hide();
  }
  
  function productSearch() {
    let oid = $("#oid").val();
    let pwd = $("#pwd").val();
    
    $.ajax({
      type : "post",
      url  : "${ctp}/shop/input/productSearch",
      data : {
        oid : oid,
        pwd : pwd
      },
      success:function(res) {
        let str = "<font size='5' color='red'><b>";
        if(res == "1") {
          alert("인증 성공!!");
          str += "인증 성공!!";
        }
        else {
          alert("인증 실패~~");
          str += "인증 실패~~";
        }
        str += "</b></font>";
        $("#demo2").html(str);
      },
      error : function() {
        alert("전송오류");
      }
    });
  }
   */
  
  function fCheck() {
  	let product = myForm.product.value;
  	let price = myForm.price.value;
  	let title = myForm.title.value;
  	let content = myForm.content.value;
  	
  	if(product == "") {
      alert("상품명을 입력하세요!");
      document.getElementById("product").select();
      document.getElementById("product").focus();
      return false;
    }
  	if(price == "") {
  		alert("상품의 가격을 입력하세요!");
      document.getElementById("price").select();
      document.getElementById("price").focus();
      return false;
  	}
  	
 	  myForm.submit();
  }
 
</script>
 

  

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
  <h2 class="text-center">상 품 등 록</h2>
  <br/>
  <br/>
  <form name="myForm">
    <table class="table table-hover text-center">
      <tr>
        <td colspan="2">
          <b>대분류 : </b>
          <select name="product1" id="product1">
            <option value="">대분류선택</option>
            <c:forEach var="vo" items="${vos}">
              <option value="${vo}">${vo}</option>
            </c:forEach>
          </select> &nbsp;&nbsp;
          <b>중분류 : </b>
          <select name="product2" id="product2">
            <option value="">중분류선택</option>
          </select> &nbsp;&nbsp;
          <b>소분류 : </b>
          <select name="product3" id="product3">
            <option value="">소분류선택</option>
          </select>
        </td>
      </tr>
      <tr>
        <th>Product</th>
        <td><input type="text" class="form-control" name="product" id="product" placeholder="상품명을 입력하세요." required /></td>
      </tr>
      <tr>
        <th>Price</th>
        <td><input type="text" class="form-control" name="price" id="price" placeholder="상품의 가격을 입력하세요." required /></td>
      </tr>
      <tr>
        <th>Title</th>
        <td><input type="text" class="form-control" name="title" id="title" placeholder="상품 제목을 입력하세요."/></td>
      </tr>
      <tr>
        <th>Content</th>
        <td><textarea rows="5" class="form-control" name="content" id="content" placeholder="상품의 상세사항을 입력해주세요."></textarea></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="돌아가기" onclick="location.href='${ctp}/shop/input/productMenu';" class="btn btn-secondary btn-sm"/> &nbsp;&nbsp;
          <input type="button" value="상품등록" onclick="fCheck()" class="btn btn-secondary btn-sm" />
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>