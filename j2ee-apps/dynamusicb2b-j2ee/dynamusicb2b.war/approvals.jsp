<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/Compare"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/commerce/approval/ApprovalRequiredDroplet"/>

<%/*
  Display all the pending approvals of the given user.  ApprovalRequiredDroplet takes
  user id and state giving all the approvals for the user with the given state. Also
  the various output params of ApprovalRequiredDroplet are used to allow page navigation.
*/%>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Approvals Page -->
<!-- Last modified: 5 Jun 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>My Approvals</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="My Approvals"/>
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
<b>Orders Requiring Approval</b>
          <table border=0 width=100%>

            <%/* Pass profile id and state values to ApprovalRequiredDroplet to get all
              the orders*/%>
<%-- Chapter 12, Ex. 1, Part 2: Insert the ApprovalRequiredDroplet --%>              



              <dsp:oparam name="output">
                     
                <tr valign=top>
                  <td width=33%><span class="small"><b>Order #</b></span></td>
                  <td width=33%><span class="small"><b>Date ordered</b></span></td>
                  <td width=33%><span class="small"><b>Status</b></span></td>
                </tr>
                <tr>
                 <td colspan=3><hr size=1 color="#666666"></td>
                </tr>
                <%/* Iterate through each order and display order info */%>
                
<%-- Insert a ForEach to iterate over the result parameter --%>               



                  <dsp:oparam name="output">

                    <tr>
                      <td><dsp:a href="order_pending_approval.jsp">
                          <dsp:param name="orderId" param="element.id"/>
                          <dsp:valueof param="element.id"/></dsp:a>
                      </td>
                      <td><dsp:valueof date="MMMMM d, yyyy" param="element.submittedDate"/></td>
                      <td><dsp:valueof param="element.state"/></td>
                    </tr>
                  </dsp:oparam>
                  <dsp:oparam name="outputEnd">

                    <tr>
                      <td colspan=3>
                      <hr size=1 color="#666666">

                      <%/* see if paging thru results is necessary */%>
                      <dsp:droplet name="Compare">
                        <dsp:param name="obj1" param="totalCount"/>
                        <dsp:param name="obj2" bean="ApprovalRequiredDroplet.defaultNumOrders"/>
                      
                        <dsp:oparam name="default">
                          <dsp:droplet name="Switch">
                            <dsp:param name="value" param="totalCount"/> 
                            <dsp:oparam name="1"> 
                              There is 1 order requiring approval.
                            </dsp:oparam>
                            <dsp:oparam name="default">
                               There are <dsp:valueof param="totalCount"></dsp:valueof>
                               orders requiring approval.                        
                            </dsp:oparam>
                          </dsp:droplet>
                        </dsp:oparam>  

                        <%/* page through results if there are more than 10.*/%>
                        <dsp:oparam name="greaterthan">
                          Now viewing orders
                          <dsp:valueof param="startRange"></dsp:valueof> - 
                          <dsp:valueof param="endRange"></dsp:valueof> out of 
                          <dsp:valueof param="totalCount"></dsp:valueof>

                          &nbsp; &nbsp;
                          <dsp:droplet name="IsEmpty">
                            <dsp:param name="value" param="previousIndex"/>
                            <dsp:oparam name="false">
                              <dsp:a href="approvals.jsp">
                                <dsp:param name="startIndex" param="previousIndex"/>
                                &lt;&lt; Previous</dsp:a>
                            </dsp:oparam>
                          </dsp:droplet>
                          <dsp:droplet name="IsEmpty">
                            <dsp:param name="value" param="nextIndex"/>
                            <dsp:oparam name="false">
                              <dsp:a href="">
                                <dsp:param name="startIndex" param="endRange"/>
                                Next &gt;&gt;</dsp:a>
                            </dsp:oparam>
                          </dsp:droplet>
                        </dsp:oparam> 
                      </dsp:droplet><%/* End Compare droplet */%>


                      </td>
                    </tr>
                  </dsp:oparam><%/* End outputEnd oparam of ForEach */%>
                </dsp:droplet><%/* End  ForEach Droplet */%>
              </dsp:oparam><%/* End output OPARAM of ApprovalRequiredDroplet */%>
              <dsp:oparam name="empty">
                <tr><td colspan=3>
                  There are no orders that require your approval.
                  </td>
                </tr>
              </dsp:oparam>
              <dsp:oparam name="error">
                <dsp:valueof param="errorMsg"/>
              </dsp:oparam>
            </dsp:droplet><%/* End ApprovalRequiredDroplet droplet */%>
            <%/* End Printing out Each order to be approved */%>
           </table>
           </td>
         </tr>


</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/approvals.jsp#6 $$Change: 514668 $--%>
