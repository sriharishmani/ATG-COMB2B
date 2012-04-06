<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/servlet/ProfileRepositoryItemServlet"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/Compare"/>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Order Pending Approval Page -->
<!-- Last modified: 15 May 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>Order Pending Approval</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Order Pending Approval"/>
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

    <dsp:droplet name="OrderLookup">
      <dsp:param name="orderId" param="orderId"/>
      <dsp:param name="userId" value="280002"/>
      <dsp:oparam name="output">
              <dsp:setvalue paramvalue="result" param="order"/>
              <b>Order #
                <dsp:valueof param="orderId"/></b>
                             
                <!-- general order info -->
                <br><b>Order placed:</b> <dsp:valueof date="MMMMM d, yyyy" param="order.submittedDate"/> <br>
                <dsp:droplet name="/atg/dynamo/droplet/Switch">
                  <dsp:param name="value" param="order.stateAsString"/>
                  <dsp:oparam name="NO_PENDING_ACTION">
                    <b>Order status:</b> SHIPPED
                  </dsp:oparam>
                  <dsp:oparam name="default">
                    <b>Order status:</b> <dsp:valueof param="order.stateAsString"/>
                  </dsp:oparam>
                </dsp:droplet>
<br>
                    <dsp:droplet name="ProfileRepositoryItemServlet">
                      <dsp:param name="id" param="order.profileId"/>
                      <dsp:oparam name="output">
                        <b>Buyer: </b>
                          <dsp:valueof param="item.firstName"/> 
                          <dsp:valueof param="item.lastName"/> (<dsp:valueof param="item.email">no email address</dsp:valueof>), 
                          <dsp:valueof param="item.parentOrganization.name"/>
                      </dsp:oparam>
                    </dsp:droplet>
<br>
    <br>

<%-- Display Payment Information --%>
<dsp:droplet name="ForEach">
  <dsp:param name="array" param="order.paymentGroups"/>
  

  <dsp:oparam name="output">
  <dsp:param name="pGroup" param="element"/>
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="pGroup.paymentMethod"/>
      <dsp:oparam name="giftCertificate">
      </dsp:oparam>

      <dsp:oparam name="creditCard">
        <b>Payment method <dsp:valueof param="count"/>:</b>
               <dsp:valueof param="pGroup.creditCardType"/>
               <dsp:valueof converter="creditcard" param="pGroup.creditCardNumber"/><br>
        <b>Amount:</b>
          <dsp:valueof param="pGroup.amount" converter="currency">no amount</dsp:valueof><br>
        <b>Billing address:</b><br>
          <nobr><dsp:valueof param="pGroup.billingAddress.companyName"/></nobr><br>
          <nobr><dsp:valueof param="pGroup.billingAddress.address1"/></nobr><br>
          <dsp:droplet name="IsEmpty">
            <dsp:param name="value" param="pGroup.billingAddress.address2"/>
            <dsp:oparam name="false">
              <nobr><dsp:valueof param="pGroup.billingAddress.address2"/></nobr><br>
            </dsp:oparam>
          </dsp:droplet>    
          <dsp:valueof param="pGroup.billingAddress.city"/>,
          <dsp:valueof param="pGroup.billingAddress.state"/>
          <dsp:valueof param="pGroup.billingAddress.postalCode"/>
          <br>
          <dsp:valueof param="pGroup.billingAddress.country"/>
          <br>

      </dsp:oparam>

      <dsp:oparam name="invoiceRequest">
         <b>Payment method <dsp:valueof param="count"/>:</b>
          <dsp:droplet name="IsEmpty">
            <dsp:param name="value" param="pGroup.PONumber"/>
            <dsp:oparam name="false">
              PO Number <dsp:valueof param="pGroup.PONumber"/><br>
            </dsp:oparam>
          </dsp:droplet>
         <b>Amount:</b> <dsp:valueof param="pGroup.amount" converter="currency">no amount</dsp:valueof><br>
         <b>Billing address:</b><br>
           <nobr><dsp:valueof param="pGroup.billingAddress.companyName"/></nobr><br>
           <nobr><dsp:valueof param="pGroup.billingAddress.address1"/></nobr><br>
           <dsp:droplet name="IsEmpty">
             <dsp:param name="value" param="pGroup.billingAddress.address2"/>
             <dsp:oparam name="false">
               <nobr><dsp:valueof param="pGroup.billingAddress.address2"/></nobr><br>
             </dsp:oparam>
           </dsp:droplet>    
           <dsp:valueof param="pGroup.billingAddress.city"/>,
           <dsp:valueof param="pGroup.billingAddress.state"/>
           <dsp:valueof param="pGroup.billingAddress.postalCode"/>
           <br>
           <dsp:valueof param="pGroup.billingAddress.country"/>
           <br><br>
    </dsp:oparam>

   </dsp:droplet><%/*Switch*/%>
  </dsp:oparam>

</dsp:droplet><%/*ForEach*/%>
<%-- END: Display Payment Information --%>


<%-- Begin Shipping Info Display --%>

    <br>

<dsp:droplet name="ForEach">
  <dsp:param name="array" param="order.shippingGroups"/>
  

  <dsp:oparam name="output">
<dsp:param name="sGroup" param="element"/>
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="size"/>
<%-- Handle single shipping group --%>
      <dsp:oparam name="1">
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="sGroup.shippingGroupClassType"/>
      <dsp:oparam name="electronicShippingGroup">
        Delivered to <dsp:valueof param="sGroup.emailAddress"/>
      </dsp:oparam>
      <dsp:oparam name="default">
        <b>Shipping address:</b><br>
            <dsp:getvalueof id="pval0" param="sGroup.shippingAddress"><dsp:include page="DisplayAddress.jsp" flush="false"><dsp:param name="address" value="<%=pval0%>"/></dsp:include></dsp:getvalueof><br>
            <b>Shipping method:</b>
            <dsp:valueof param="sGroup.shippingMethod">no shipping method</dsp:valueof><br>
        <b>Items:</b>
                <dsp:droplet name="ForEach">
                  <dsp:param name="array" param="sGroup.CommerceItemRelationships"/>
                  
                  <dsp:oparam name="outputStart"> <ul> </dsp:oparam>
                  <dsp:oparam name="outputEnd"> </ul> </dsp:oparam>
                  <dsp:oparam name="output">
                  <dsp:param name="CiRel" param="element"/>
                      <li><dsp:valueof param="CiRel.commerceItem.quantity"/>
                      <dsp:valueof param="CiRel.commerceItem.auxiliaryData.productRef.displayName"/>
                      <dsp:valueof converter="currency" param="CiRel.commerceItem.priceInfo.amount"/>
                      
                  </dsp:oparam>
                </dsp:droplet><%/*ForEach*/%>


       <b>Shipping:</b> 
            <dsp:getvalueof id="pval0" param="sGroup.priceInfo.amount"><dsp:include page="DisplayCurrencyType.jsp" flush="false"><dsp:param name="currency" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
            <br>
       <b>Sales Tax:</b>
            <dsp:getvalueof id="pval0" param="order.priceInfo.tax"><dsp:include page="DisplayCurrencyType.jsp" flush="false"><dsp:param name="currency" value="<%=pval0%>"/></dsp:include></dsp:getvalueof><br>
       <dsp:droplet name="Compare">
          <dsp:param name="obj1" param="order.priceInfo.amount"/>
          <dsp:param name="obj2" param="order.priceInfo.rawSubtotal"/>
          <dsp:oparam name="equal">
          </dsp:oparam>
          <dsp:oparam name="default">
             <b>Discount:</b>
                <dsp:getvalueof id="pval0" param="order.priceInfo.discountAmount"><dsp:include page="DisplayCurrencyType.jsp" flush="false"><dsp:param name="currency" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
             <br>
          </dsp:oparam>
        </dsp:droplet>
        <b>Total:</b>
            <dsp:getvalueof id="pval0" param="order.priceInfo.total"><dsp:include page="DisplayCurrencyType.jsp" flush="false"><dsp:param name="currency" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
              <br>
      </dsp:oparam>
    </dsp:droplet><%/*Switch on Shipping Group Type*/%>

     </dsp:oparam><%/*Switch on Shipping Group Size 1*/%>

<%-- END: Handle single shipping group--%>

<%-- Handle multiple shipping group --%>
     <dsp:oparam name="default">
       <b>Shipping Group <dsp:valueof param="count"/></b><br>
       <dsp:droplet name="Switch">
         <dsp:param name="value" param="sGroup.shippingGroupClassType"/>
         <dsp:oparam name="electronicShippingGroup">
           Delivered to <dsp:valueof param="sGroup.emailAddress"/>
         </dsp:oparam>
         <dsp:oparam name="default">

          <b>Shipping address</b>:<br>
             <dsp:getvalueof id="pval0" param="sGroup.shippingAddress"><dsp:include page="DisplayAddress.jsp" flush="false"><dsp:param name="address" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
          <br>
          <b>Shipping method:</b>
           <dsp:valueof param="sGroup.shippingMethod">no shipping method</dsp:valueof> <br>  
          <b>Items:</b>
                <dsp:droplet name="ForEach">
                  <dsp:param name="array" param="sGroup.CommerceItemRelationships"/>
                  
                  <dsp:oparam name="outputStart"> <ul> </dsp:oparam>
                  <dsp:oparam name="outputEnd"> </ul> </dsp:oparam>
                  <dsp:oparam name="output">
                  <dsp:param name="CiRel" param="element"/>
                      <li><dsp:valueof param="CiRel.commerceItem.quantity"/>
                      <dsp:valueof param="CiRel.commerceItem.auxiliaryData.productRef.displayName"/>
                      <dsp:valueof converter="currency" param="CiRel.commerceItem.priceInfo.amount"/>
                      
                  </dsp:oparam>
                </dsp:droplet><%/*ForEach*/%>

         <b>Shipping:</b>
            <dsp:valueof param="sGroup.priceInfo.amount" converter="currency"/>
 <br><hr><br> 
              <dsp:droplet name="Compare">
                  <dsp:param name="obj1" param="size"/>
                  <dsp:param name="obj2" param="count"/>
                  <dsp:oparam name="equal">

<b>Sales Tax:</b>

            <dsp:valueof param="order.priceInfo.tax" converter="currency"/>
<br>
              <dsp:droplet name="Compare">
                <dsp:param name="obj1" param="order.priceInfo.amount"/>
                <dsp:param name="obj2" param="order.priceInfo.rawSubtotal"/>
                <dsp:oparam name="equal">
                </dsp:oparam>
                <dsp:oparam name="default">
                    <b>Discount:</b>
                    <dsp:valueof param="order.priceInfo.discountAmount" converter="currency"/>
                     <br>
                </dsp:oparam>
              </dsp:droplet>

<b>Total:</b>
            <dsp:valueof param="order.priceInfo.total" converter="currency"/>
<p>
              </dsp:oparam>
              </dsp:droplet>         
         
         </dsp:oparam><%/*Switch on Shipping Group Type Default */%>
       </dsp:droplet><%/*Switch*/%>
     </dsp:oparam>
<%-- END: Handle multiple shipping group --%>

   </dsp:droplet><%/*Switch on Shipping Group Size*/%>
  </dsp:oparam><%/*ForEach Oparam*/%>
</dsp:droplet><%/*ForEach*/%>
<%-- END: Shipping Info Display --%>
 

<dsp:a href="approve_order.jsp">Approve order
                      <dsp:param name="orderId" param="order.id"/></dsp:a>
                 | 

<dsp:a href="reject_order.jsp">Reject order
                      <dsp:param name="orderId" param="order.id"/></dsp:a>

        </dsp:oparam>
      </dsp:droplet>
    </td>
  </tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/order_pending_approval.jsp#7 $$Change: 514668 $--%>
