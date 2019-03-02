<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<style>
		body {
            padding-top : 100px;
            padding-left:100px;
            padding-right:100px;
        }
    
        .thumbnail{
        	width:400px;
        	height:300px;
        }
</style>
<script type="text/javascript">


	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase?buyerId=${param.buyerId}").submit();
		
	}
	
	
	$(function() {
		
		$("h3").on("click",function(){
			
			var tranNo=$(this).data('param1');
			var tranCode=$(this).data('param2');
			var i=$(this).text().trim();

			if(tranCode=="2  "){
				alert("��� ���� ��ǰ�� ���� ������ �Ұ����մϴ�.");
			}else if(tranCode=="3  "){
				alert("��� �Ϸ�� ��ǰ�� ���� ������ �Ұ����մϴ�.");
			}else{
				self.location="/purchase/getPurchase?tranNo="+tranNo;
				/* $.ajax(
						{
							url : "/purchase/json/getPurchase/"+tranNo,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								
								var displayValue = "<h3>"
								
									+"��ǰ��ȣ : "+JSONData.purchaseProd.prodNo+"<br/>"
									+"������ ���̵� "+JSONData.buyer.userId+"<br/>"
									+"���Ź�� : "+JSONData.paymentOption+"<br/>"
									+"������ �̸� : "+JSONData.receiverName+"<br/>"
									+"������ ����ó : "+JSONData.receiverPhone+"<br/>"
									+"������ �ּ� : "+JSONData.divyAddr+"<br/>"
									+"���ſ�û����: "+JSONData.divyRequest+"<br/>"
									+"��������: "+JSONData.receiverDate+"<br/>"
									+"�ֹ���: "+JSONData.orderDate+"<br/><br/>" 
									+"<a href='/purchase/updatePurchase?tranNo="+JSONData.tranNo+"'>[����]</a>"
									+"</h3>";
									
								$("h3").remove();
								$("#"+i+"").html(displayValue);
							}
					
				}); */
			}
		})
		
		$("p:contains('ȸ�� ID')").on("click",function(){
			var userId=$(this).data('param1');
			self.location="/user/getUser?userId="+userId;
		})
		
		$("p:contains('���ǵ���')").on("click",function(){
			var tranNo=$(this).data('param1');
			var userId=$(this).data('param2');
			self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3&buyerId="+userId;
		})
		

	});
	
	
</script>
</head>

<body>

<div class="row">

<div class="col-xs-12">
<jsp:include page="/layout/toolbar.jsp" />
<div>

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ����  ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
		<td align="center" data-param1="${purchase.tranNo}" data-param2="${purchase.tranCode}">
			<!--<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${ i }</a>-->
			${ i }			
		</td>
		<td></td>
		<td align="left" data-param1="${purchase.buyer.userId}">
			<!--<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>-->
			${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
		<td align="left">
		
		<c:if test="${purchase.tranCode=='1  '}">
			���� ���ſϷ� �����Դϴ�.
		</c:if>
		<c:if test="${purchase.tranCode=='2  '}">
			���� ����� �����Դϴ�.
		</c:if>
		<c:if test="${purchase.tranCode=='3  '}">
			���� ��ۿϷ� �����Դϴ�.
		</c:if>
	
		</td>
		<td></td>
		<td id="tranCode3" align="left" data-param1="${purchase.tranNo}" data-param2="${user.userId}">
		
		<c:if test="${purchase.tranCode=='2  '}">
			���ǵ���
		</c:if>
		<c:if test="${purchase.tranCode=='3  '}">
			
		</c:if>
		
		
		</td>
	</tr>
	<tr>
		<td id="${i}"colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
	</c:forEach>
</table> --%>

<br/>
<div class="col-xs-9">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">

<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />

 <div class="bs-example" data-example-id="thumbnails-with-custom-content">
  <div class="col-sm-6 col-md-4">
  <div class="thumbnail">
 		<h3 align="center" data-param1="${purchase.tranNo}" data-param2="${purchase.tranCode}">${ i }</h3>
	<div class="caption">
	<p align="center" data-param1="${purchase.buyer.userId}">ȸ�� ID : ${purchase.buyer.userId}</p>
	<p align="center">������ �̸� : ${purchase.receiverName}</p>
	<p align="center">������ �ּ� : ${purchase.receiverPhone}</p>
	<p align="right">
	<br/>
		<c:if test="${purchase.tranCode=='1  '}">
			���� ���ſϷ� �����Դϴ�.
		</c:if>
		<c:if test="${purchase.tranCode=='2  '}">
			���� ����� �����Դϴ�.
			<br/>
			<a id="tranCode3" data-param1="${purchase.tranNo}" data-param2="${user.userId}"class="btn btn-primary" role="button">
			���ǵ���
			</a>
		</c:if>
		<c:if test="${purchase.tranCode=='3  '}">
			���� ��ۿϷ� �����Դϴ�.
		</c:if>
	</p>
	
	<%-- <p align="right">
  	<a id="tranCode3" data-param1="${purchase.tranNo}" data-param2="${user.userId}"class="btn btn-primary" role="button">
  		<c:if test="${purchase.tranCode=='2  '}">
			���ǵ���
		</c:if>
  	</a></p> --%>
	
</div>
</div>
</div>
</div>
	
	
</c:forEach>












<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		 
			<jsp:include page="../common/pageNavigator.jsp"/>
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>