<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.text.* "%>
<%@ page import="java.util.* "%>
<%@ page import="com.galaxia.api.util.*"%>
<%
	String serviceId = null;
	String orderId = null;
	String orderDate = null;
	String userId = null;
	String userName = null;
	String itemName = null;
	String itemCode = null;
	String amount = null;
	String userIp = null;
	String returnUrl = null;
	String checkSum = null;
	
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
		
		//���� ��û �Ķ����
		serviceId = "glx_api" ; //�׽�Ʈ ���̵� �Ϲݰ��� : glx_api
		orderDate = year + month + date + hour + minute + second ; //�ֹ��Ͻ�
		orderId = "test_" + orderDate ;  //�ֹ���ȣ
		userId = "testid" ; 
		userName = "ȫ�浿";
		itemName = "�׽�Ʈ��ǰ��";
		itemCode = "TEST_CD1";
		amount = "1000";
		userIp = "127.0.0.1";
		returnUrl = "http://50.10.10.161:8080/credit-jsp-link/return.jsp";
	
		String temp = serviceId + orderId + amount;
		checkSum = ChecksumUtil.genCheckSum(temp);
%>
<html>
<head>
<title>������û</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="css/css_admin.css" rel="stylesheet" type="text/css">
<link href="css/css_01.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function checkSubmit(){
	var HForm = document.payment;
	HForm.target = "payment";
	
	//�׽�Ʈ URL 
	HForm.action = "http://tpay.billgate.net/credit/certify.jsp";
	//��� URL 
	//HForm.action = "https://pay.billgate.net/credit/certify.jsp";

	var option ="width=500,height=477,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,left=150,top=150";
	var objPopup = window.open("", "payment", option);

	if(objPopup == null){	//�˾� ���ܿ��� Ȯ��
		alert("�˾��� ���ܵǾ� �ֽ��ϴ�.\n�˾������� �����Ͻ� �� �ٽ� �õ��Ͽ� �ֽʽÿ�.");
	}

	HForm.submit();
}
</script>
</head>
<!--Header��-->
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="payment" method="post">
<table width="500" border="0" cellpadding="0" cellspacing="0">
	<tr> 
	  <td height="25" background="images/top_bg02.gif" style="padding-left:10px" class="title01"><img src="images/top_icon01.gif" align="absmiddle">�ſ�ī�� ���� &gt; <b>������û �׽�Ʈ</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
		<!--�������̺� ����--->
		<table width="450" border="0" cellpadding="5" cellspacing="1" bgcolor="#B0B0B0">
			<tr>
				<td colspan="2" height="30" align="left" bgcolor="#F6F6F6"><b>�������� �����Է�</b></td>
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">���񽺾��̵�</td>
				<td bgcolor="#FFFFFF">&nbsp;<%=serviceId%><input type="hidden" name="SERVICE_ID" value="<%=serviceId%>"></td>
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">���� �ݾ�</td>
				<td bgcolor="#FFFFFF">&nbsp;<%=amount%><input type="hidden"	name="AMOUNT" value="<%=amount%>"></td>
			</tr>	
			<tr>						
				<td width="100" align="center" bgcolor="#F6F6F6">�ֹ���ȣ</td>
				<td bgcolor="#FFFFFF">&nbsp;<%=orderId%><input type="hidden" name="ORDER_ID" class="input" value="<%=orderId%>"></td>
			</tr>				
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">�ֹ��Ͻ�</td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text"	name="ORDER_DATE" size=20 class="input" value="<%=orderDate%>"></td>
			</tr>				
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">�� IP</td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text"	name="USER_IP" size=20 class="input" value="<%=userIp%>"></td>
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">��ǰ��</td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="ITEM_NAME" size=20 class="input" value="<%=itemName%>"></td>
			</tr>				
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">��ǰ�ڵ�</td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="ITEM_CODE" size=20 class="input" value="<%=itemCode%>"></td>	
			</tr>
		  <tr>
		  	<td width="100" align="center" bgcolor="#F6F6F6">�� ���̵�</td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="USER_ID" size=20 class="input" value="<%=userId%>"></td>
			</tr>				
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">����</td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="USER_NAME" size=20 class="input" value="<%=userName%>"></td>
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">�Һΰ�����</td>
				<td bgcolor="#FFFFFF" colspan="3">&nbsp;<input type="text"	name="INSTALLMENT_PERIOD" size=30 class="input" value="0:3:6:9:12"></td>
			</tr>
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">ī��缱��</td>
				<td bgcolor="#FFFFFF">&nbsp; 
					<select name="CARD_TYPE" >
						<option value="0000">---ī��� ����---</option>
							<option value="0052">��ī��(BC card)</option>
							<option value="0050">����ī��(KB card)</option>
							<option value="0073">����ī��(Hyundai card)</option>
							<option value="0054">�Ｚī��(Samsung card)</option>
							<option value="0053">����(LG)ī��(Shinhan(LG) card)</option>
							<option value="0055">�Ե�ī��(Lotte card)</option>
							<option value="0089">��������(savings bank)</option>
							<option value="0051">��ȯī��(Yes card)</option>
							<option value="0076">�ϳ�(Hana card)</option>
							<option value="0079">����(e-jeju bank)</option>
							<option value="0080">����(kjbank)</option>
							<option value="0073">����(����)(cu(Hyundai))</option>
							<option value="0075">����(suhyup)</option>
							<option value="0081">����(jbbank)</option>
							<option value="0078">����(NH card)</option>
							<option value="0084">��Ƽ(Citi card)</option>
					</select>
				</td>
			</tr>							
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">Return Url</td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="RETURN_URL" size=50 class="input" value="<%=returnUrl%>"></td>
			</tr>				
			<tr>
				<td width="100" align="center" bgcolor="#F6F6F6">Check Sum</td>
				<td bgcolor="#FFFFFF">&nbsp;<%=checkSum%><input type="hidden" name="CHECK_SUM" class="input" value="<%=checkSum%>"></td>
			</tr>				
		</table>
		<table width="450" border="0" cellpadding="5" cellspacing="1" bgcolor="#B0B0B0">	
			<tr>
				<td align="center" bgcolor="#FFFFFF" colspan="2"><img src="images/bt_submit01.gif" OnClick="javascript:checkSubmit();" style="cursor: hand;"></td>
			</tr>
		</table>
		<!--�������̺� ��--->
		</td>
	</tr>
	<tr>
		<td align="center"></td>
	</tr>
</table>
</form>
</body>
</html>
<%
	} catch (Exception ex) {
		ex.printStackTrace();
%>
<script type="text/javascript">
	alert("���� �ڵ� : 0901\n���� �޽��� : �����Է�â(pay)! �����ڿ��� ���� �ϼ���!");
	window.close();
	</script>
<%
	}
%>