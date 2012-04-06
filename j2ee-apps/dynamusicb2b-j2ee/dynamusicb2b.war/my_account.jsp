<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/userdirectory/droplet/HasFunction"/>
<dsp:importbean bean="/atg/commerce/approval/ApprovalRequiredDroplet"/>
<dsp:importbean bean="/atg/commerce/approval/ApprovedDroplet"/>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Customer Account Page -->
<!-- Last modified: 30 Apr 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>My Account</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="My Account"/>
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

        <table border=0 cellpadding=4 cellspacing=0>
  
          <!--  display link if user has approver role -->
          <dsp:droplet name="HasFunction">
            <dsp:param bean="Profile.id" name="userId"/>
            <dsp:param name="function" value="approver"/>
            <dsp:oparam name="true">
              <tr valign=top>
                <td><dsp:a href="approvals.jsp">Approval requests</dsp:a></td>
                <td>
                <dsp:droplet name="ApprovalRequiredDroplet">
                  <dsp:param bean="Profile.id" name="approverid"/>
                  <dsp:param name="state" value="open"/>
                  <dsp:oparam name="output">
                    <nobr><dsp:valueof param="totalCount"/> &nbsp;</nobr>
                  </dsp:oparam>
                  <dsp:oparam name="empty">
                    0
                  </dsp:oparam>
                </dsp:droplet>
                 </td>
                <td>Orders requiring your approval.</td>
              </tr>
            </dsp:oparam>
          </dsp:droplet>
            
         
          <!-- only buyers who require approval see rejected orders -->
          <dsp:droplet name="HasFunction">
            <dsp:param bean="Profile.id" name="userId"/>
            <dsp:param name="function" value="buyer"/>
            <dsp:oparam name="true">
              <dsp:droplet name="Switch">
                <dsp:param bean="Profile.approvalRequired" name="value"/>
                <dsp:oparam name="true">
                  <tr valign=top>
                    <td><dsp:a href="orders_rejected.jsp"><nobr>Rejected orders</nobr></dsp:a></td>
                    <td>
                    <dsp:droplet name="OrderLookup">
                      <dsp:param bean="Profile.id" name="userId"/>
                      <dsp:param name="state" value="failed_approval"/>
                      <dsp:param name="queryTotalOnly" value="true"/>
                      <dsp:oparam name="output">
                        <dsp:valueof param="total_count"/>
                      </dsp:oparam>
                      <dsp:oparam name="empty">
                        0
                      </dsp:oparam>
                    </dsp:droplet>
                    </td>
                    <td>Orders requiring approval that were returned to you by the approver.</td>
                  </tr>
                </dsp:oparam>
              </dsp:droplet>
            </dsp:oparam>
          </dsp:droplet>


<%--          <tr valign=top>
            <td><dsp:a href="scheduled_orders.jsp"><nobr>Scheduled orders</nobr></dsp:a></td>
            <td></td>
            <td>Orders that are submitted automatically based on a pre-defined
               schedule.</td>
          </tr> --%>
          <tr valign=top>
            <td><dsp:a href="saved_orders.jsp">Saved orders</dsp:a></td>
            <td></td>
            <td>If you are building an order and are not yet ready to place it you
             can save the order and place it at a later time.</td>
          </tr>

        </table>
        </td>
      </tr>
    </table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/my_account.jsp#8 $$Change: 514668 $--%>
