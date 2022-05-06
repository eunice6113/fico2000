<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.galaxia.api.*"%>
<%@include file="/pg/process.jsp" %>
<%
	String serviceId = null;
	String orderId = null;
	String orderDate = null;
	String transactionId = null;
	String responseCode = null;
	String responseMessage = null;
	String detailResponseCode = null;
	String detailResponseMessage = null;

	try {
		request.setCharacterEncoding("euc-kr");
		//����� ������ ����
		response.setHeader("cache-control", "no-cache");
		response.setHeader("pragma", "no-cache");
		response.setHeader("expire", "0");
	
		//��¥���� ���� 
		Calendar today = Calendar.getInstance(); 
		String year = Integer.toString(today.get(Calendar.YEAR));
		String month = Integer.toString(today.get(Calendar.MONTH)+1);
		String date = Integer.toString(today.get(Calendar.DATE));
		String hour = Integer.toString(today.get(Calendar.HOUR));	
		String minute = Integer.toString(today.get(Calendar.MINUTE));
		String second = Integer.toString(today.get(Calendar.SECOND));	
	
		if(today.get(Calendar.MONTH)+1 < 10) month = "0" + month ;	
		if(today.get(Calendar.DATE) < 10) date = "0" + date ;
		if(today.get(Calendar.HOUR) < 10) hour = "0" + hour ;	
		if(today.get(Calendar.MINUTE) < 10) minute = "0" + minute ;	
		if(today.get(Calendar.SECOND) < 10) second = "0" + second ;	
		
		//��� ��û �Ķ����
		serviceId = "glx_api" ; //�׽�Ʈ ���̵� �Ϲݰ��� : glx_api
		orderDate = year + month + date + hour + minute + second ; //��� ��û�Ͻ�
		orderId = "test_" + orderDate ;  //��� ��û��ȣ
		transactionId = "2012100914TT004025";			// ��Ұ��� �ŷ���ȣ

		//���� ���� session�� ����
		session.setAttribute("serviceId", serviceId);
		session.setAttribute("orderId", orderId);
		session.setAttribute("orderDate", orderDate);
		session.setAttribute("transactionId", transactionId);

		Message respMsg = cancelProcess(session, config);
    
  	session.setAttribute("responseMessage", respMsg);
  
		//��ҿ�û�� ���� ���� ��� ����
		responseCode = respMsg.get(MessageTag.RESPONSE_CODE);
		responseMessage = respMsg.get(MessageTag.RESPONSE_MESSAGE);
		detailResponseCode = respMsg.get(MessageTag.DETAIL_RESPONSE_CODE);
		detailResponseMessage = respMsg.get(MessageTag.DETAIL_RESPONSE_MESSAGE);
		transactionId = respMsg.get(MessageTag.TRANSACTION_ID);
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="css/css_admin.css" rel="stylesheet" type="text/css">
<link href="css/css_01.css" rel="stylesheet" type="text/css">
<head>
<!-- Ű ��� �ڵ� -->
<script type="text/javascript" src="js/comm.js"></script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">	
<table width="500" border="0" cellpadding="0"	cellspacing="0">
	<tr> 
	  <td height="25" style="padding-left:10px" class="title01">ī����� &gt; <b>������ Return Url</b></td>
	</tr>
	<!--title-->
	<tr>
		<td height="54" background="images/manager_title01.gif" style="padding-left: 65px; padding-top: 18px"><font size="3"><strong>������ Return Url</strong></font></td>
	</tr>
	<!--title-->
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><!--�������̺� ����--->
		<table width="450" border="0" cellpadding="4" cellspacing="1" bgcolor="#B0B0B0">	
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>������ ���̵�</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=serviceId%></b></td>								
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>�ֹ���ȣ</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=orderId%></b></td>								
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>�ֹ��Ͻ�</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=orderDate%></b></td>								
			</tr>			
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>�ŷ���ȣ</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=transactionId%></b></td>								
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>�����ڵ�</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=responseCode%></b></td>								
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>����޽���</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=responseMessage%></b></td>								
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>�������ڵ�</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=detailResponseCode%></b></td>								
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6"><b>������޽���</b></td>
				<td align="left" bgcolor="#FFFFFF">&nbsp;<b><%=detailResponseMessage%></b></td>								
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
<%
	} catch (Exception ex) {
		ex.printStackTrace();
%>
<script type="text/javascript">
	alert("���� �ڵ� : 0901\n���� �޽��� : ��ҿ�ûâ(cancel)! �����ڿ��� ���� �ϼ���!");
	window.close();
	</script>
<%
	}
%>