<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/approval/ApprovalFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<%--
  Approves the given order using ApprovalFormHandler. Also uses PersonLookup to display
  information about the buyer of the order.
--%>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Order Pending Approval Page -->
<!-- Last modified: 30 Apr 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>Order Approval Page</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Order Approval Page"/>
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


          <dsp:form action="approvals.jsp" method="post">

<%-- Set the orderId property of the ApprovalFormHandler. --%>



            <b>Enter a message.</b><br>
            <dsp:textarea bean="ApprovalFormHandler.approverMessage" rows="7" cols="50"></dsp:textarea><p>
            <%-- page to be redirected if the order approval is successful --%>
            <dsp:input bean="ApprovalFormHandler.approveOrderSuccessURL" type="hidden" value="approve_confirm.jsp"/>
            <%-- page to be redirected if the order approval fails --%>
            <dsp:input bean="ApprovalFormHandler.approveOrderErrorURL" type="hidden" value="approve_order.jsp"/>


<!-- Submit the form and call the approveOrder handle method. -->



            <input type="submit" value="Cancel"> &nbsp;
            </dsp:form>
          </td>
        </tr>
      </table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/approve_order.jsp#6 $$Change: 514668 $--%>
