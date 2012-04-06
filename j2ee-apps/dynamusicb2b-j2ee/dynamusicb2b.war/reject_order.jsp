<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/approval/ApprovalFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<DECLAREPARAM NAME="orderId" CLASS="java.lang.String" DESCRIPTION="The id of the order to reject">

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Reject Order Page -->
<!-- Last modified: 5 Jun 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>Reject Order</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Reject Order"/>
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

<dsp:include page="ApprovalFormHandlerErrorMessages.jsp" flush="false"></dsp:include><br>
        <b>Order <dsp:valueof param="orderId">No Order</dsp:valueof></b><br>

        <%-- Get the order using OrderLookup, get the profile id of the order and display the info.
          regarding the buyer of the order using PersonLookup --%>
        <dsp:droplet name="OrderLookup">
          <dsp:param name="orderId" param="orderId"/>
          <dsp:oparam name="output">
            Order placed <dsp:valueof date="M/dd/yyyy K:mm a" param="result.submittedDate">No Submit Date</dsp:valueof>
            <br>
          </dsp:oparam>
        </dsp:droplet>
<br>

	<dsp:form action="order_pending_approval.jsp" method="post">
            <dsp:input bean="ApprovalFormHandler.orderId" paramvalue="orderId" type="hidden"/>
            <span class=help>Enter a message.</span><br>
            <dsp:textarea bean="ApprovalFormHandler.approverMessage" rows="7" cols="50"></dsp:textarea><p>
				    <input name="orderId" type="hidden" value="<dsp:valueof param="orderId"/>">
            <dsp:input bean="ApprovalFormHandler.rejectOrderSuccessURL" type="hidden" value="reject_confirm.jsp"/>
            <dsp:input bean="ApprovalFormHandler.rejectOrderErrorURL" type="hidden" value="reject_order.jsp"/>
            <dsp:input bean="ApprovalFormHandler.rejectOrder" type="submit" value="Reject order"/> &nbsp;
            <input type="submit" value="Cancel"> &nbsp;
            </dsp:form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/reject_order.jsp#6 $$Change: 514668 $--%>
