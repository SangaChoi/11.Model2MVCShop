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
        
         .ui-datepicker {
			width: 300px;
		 	margin: 5px auto 0;
		  	font: 12pt;
		  	-webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
		  	-moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
		  	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
		  	background-color:white;
		}

		.ui-datepicker table {
		  	width: 100%;
		}
		
		.ui-datepicker-title {
		  	text-align: center;
		}
		
		.ui-datepicker-prev {
			  float: left;
			  background-position: center -30px;
		}
		
		.ui-datepicker-next {
		  	float: right;
		 	background-position: center 0px;
		}
</style>
<script type="text/javascript">

$(function() {
	$("button.btn.btn-primary").bind("click",function(){
		var tranNo=$(this).data('param1');
		$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo="+tranNo).submit();
	})
	
	
	$("a[href='#' ]").on("click" , function() {
		var buyerId=$(this).data('param1');
		self.location="/purchase/listPurchase?buyerId="+buyerId;
	});
});

$( function() {
    $( "#datepicker" ).datepicker({
        dateFormat: 'yy-mm-dd',
       	monthNames: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
       	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
        
    });
});

</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />

<form name="updatePurchase">

<%-- <table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif"  width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매정보수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자아이디</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.buyer.userId}</td>
		<input type="hidden" name="buyerId" value="${purchase.buyer.userId}">
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매방법</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="paymentOption" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자이름</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverName" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverName}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자 연락처</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverPhone" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverPhone}" />
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자주소</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="divyAddr" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.divyAddr}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매요청사항</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="divyRequest" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.divyRequest}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">배송희망일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td width="200" class="ct_write01">
			<input type="text" readonly="readonly" name="receiverDate" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20"/>
				<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
							onclick="show_calendar('document.updatePurchase.receiverDate', document.updatePurchase.receiverDate.value)"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table> --%>

<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;" data-param1="${purchase.tranNo}">
					<!--<input type="submit" value="수정"/>-->
					수정
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- <a href="javascript:history.go(-1)">취소</a>-->
					취소
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table> --%>

<div class="container">

	<div class="page-header">
	       <h3 class=" text-info">구매정보수정</h3>
	</div>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 ID</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}
			<input type="hidden" name="buyerId" value="${purchase.buyer.userId}">
			</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
	<div class="col-xs-8 col-md-4">
	<select name="paymentOption" class="form-control">
			<option value="1">현금구매</option>
			<option value="2">신용구매</option>
	</select>
	</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 이름</strong></div>
			<div class="col-xs-8 col-md-4">
			<input type="text" name="receiverName" 	class="form-control" value="${user.userName}" />
			</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 연락처</strong></div>
			<div class="col-xs-8 col-md-4">
			<input 	type="text" name="receiverPhone" class="form-control" value="${user.phone}" />
			</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 주소</strong></div>
			<div class="col-xs-8 col-md-4">
			<input 	type="text" name="divyAddr" class="form-control" value="${user.addr}" />
			</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">
			<input type="text" name="divyRequest" class="form-control" value="${purchase.divyRequest}"/>
			</div>
	</div>
	
	<hr/>
	
	<div class="row">
		    <div class="col-xs-4 col-md-2"><strong>배송희망일자</strong></div>
		    <div class="col-xs-8 col-md-4">
		      <input type="text" class="form-control" id="datepicker" name="receiverDate" value="${purchase.receiverDate}">		 
		    </div>
	</div>
	
	<hr/>
	
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" data-param1="${purchase.tranNo}">수정</button>
			  <a class="btn btn-primary btn" href="#" role="button" data-param1="${user.userId}">취소</a>
		    </div>
	</div>
	
	
</div>
</form>

</body>
</html>
