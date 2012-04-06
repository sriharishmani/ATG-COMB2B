<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/approval/ApprovalFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<DECLAREPARAM NAME="orderId" CLASS="java.lang.String" DESCRIPTION="The id of the order to reject">

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Reject Order Confirmation Page -->
<!-- Last modified: 5 Jun 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>Reject Order Confirmation</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Reject Order Confirmation"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <jsp:include page="navbar.jsp" flush="true"></jsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" color="midnightblue">

<dsp:include page="ApprovalFormHandlerErrorMessages.jsp" flush="false"></dsp:include>
       
The order has been rejected:<P>
        <dsp:droplet name="OrderLookup">
          <dsp:param bean="ApprovalFormHandler.orderId" name="orderId"/>
          <dsp:oparam name="output">
             Order number: <b><dsp:valueof bean="ApprovalFormHandler.orderId">No order Id</dsp:valueof></b><br>
             Order placed: <b><dsp:valueof date="M/dd/yyyy K:mm a" param="result.submittedDate">No Submit Date</dsp:valueof></b><br>
             Message: <b><dsp:valueof bean="ApprovalFormHandler.approverMessage">no message sent.</dsp:valueof></b><p>
            <p><dsp:a href="approvals.jsp">Back to approvals</dsp:a>
          </dsp:oparam>
        </dsp:droplet>

    </td>
  </tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/reject_confirm.jsp#6 $$Change: 514668 $--%>
