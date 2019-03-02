<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script type="text/javascript" src="../javascript/calendar.js"></script>

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
            padding-left:200px;
            padding-right:200px;
        }
</style>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<form name="updatePurchase" action="/updatePurchaseView.do?tranNo=${purchase.tranNo}" method="post">

<%-- ������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${product.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${user.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>

		<c:if test="${purchase.paymentOption=='1'}">
		���ݱ���
		</c:if>
		
		<c:if test="${purchase.paymentOption=='2'}">
		�ſ뱸��
		</c:if>
				
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${user.userName}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${user.phone}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${user.addr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.divyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.receiverDate}</td>
		<td></td>
	</tr>
</table> --%>

<div class="container">

	<div class="page-header">
	       <h3 class=" text-info">������ ���� ���Ű� �Ǿ����ϴ�.</h3>
	</div>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ID</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">
			<c:if test="${purchase.paymentOption=='1'}">
			���ݱ���
			</c:if>
			
			<c:if test="${purchase.paymentOption=='2'}">
			�ſ뱸��
			</c:if>		
			</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
	</div>
	
	<hr/>

	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ����ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverDate}</div>
	</div>
	
	<hr/>

</div>
</form>

</body>
</html>