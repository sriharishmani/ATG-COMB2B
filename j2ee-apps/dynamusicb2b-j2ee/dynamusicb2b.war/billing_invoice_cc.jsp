<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentAddressFormHandler"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>

<%--
Reprice the Order total so that we can assign PaymentGroups to any CommerceIdentifier.
--%>
<dsp:droplet name="RepriceOrderDroplet">
  <dsp:param name="pricingOp" value="ORDER_TOTAL"/>
</dsp:droplet>

<%--
The PaymentGroupDroplet is used here to initialize the user's CreditCard PaymentGroups
and an InvoiceRequest PaymentGroup, as well as an OrderPaymentInfo object to associate
a PaymentGroup with the Order.
--%>
<dsp:droplet name="PaymentGroupDroplet">
  <dsp:param name="clear" param="init"/>
  <dsp:param name="paymentGroupTypes" value="creditCard,invoiceRequest"/>
  <dsp:param name="initPaymentGroups" param="init"/>
  <dsp:param name="initOrderPayment" param="init"/>
  <dsp:oparam name="output">

    <dsp:setvalue beanvalue="/atg/commerce/order/purchase/InvoiceRequestInitializer.invoiceRequestName" param="invoiceRequestName"/>
    <table border=0 cellpadding=0 cellspacing=0 width=800>
    
      <tr>
        <%/* put breadcrumbs here */%>
        <td colspan=3 height=18><span class=small>
           &nbsp; <dsp:a href="cart.jsp">Current Order</dsp:a> &gt;
		   <dsp:a href="shipping.jsp">Shipping</dsp:a> &gt; Billing &nbsp;</span>
        </td>
      </tr>
    
      <tr>
      <td width=55> </td>
        <td  valign="top" width=745>
    
        <dsp:form action="billing.jsp" method="post">
        <table border=0 cellpadding=4 width=80%>
          <tr><td> </td></tr>
          <tr>
            <td colspan=2>
            <dsp:include page="common/FormError.jsp" flush="false"></dsp:include></td>
          </tr>
         <tr><td> </td></tr>
          <tr valign=top>
            <td align=right width=25%><span class=smallb><b>Payment method <font size="1"><br>(names are credit cards)</font></b></span></td>
            <td>
            <dsp:setvalue bean="PaymentGroupFormHandler.ListId" paramvalue="order.id"/>
            <dsp:input bean="PaymentGroupFormHandler.ListId" beanvalue="PaymentGroupFormHandler.ListId" priority="<%=(int) 9%>" type="hidden"/>            <dsp:droplet name="ForEach">
              <dsp:param name="array" param="paymentGroups"/>
              <dsp:oparam name="output">

                <%-- we only expect this to have 1 element at [0], but we put this in a ForEach to be safe --%>
                <dsp:droplet name="ForEach">
                  <dsp:param bean="PaymentGroupFormHandler.CurrentList" name="array"/>
                  <dsp:oparam name="output">
                    <dsp:input bean="PaymentGroupFormHandler.CurrentList[param:index].paymentMethod" paramvalue="key" type="radio"/><dsp:valueof param="key"/><br>
                  </dsp:oparam>
                </dsp:droplet>
              </dsp:oparam>
            </dsp:droplet></td>
          </tr>
    
          <dsp:setvalue bean="PaymentGroupFormHandler.PaymentGroupId" paramvalue="invoiceRequestName"/>
          <dsp:input bean="PaymentGroupFormHandler.PaymentGroupId" beanvalue="PaymentGroupFormHandler.PaymentGroupId" priority="<%= (int) 9%>" type="hidden"/>
          <tr valign=top>
            <td align="right"><span class=smallb>PO number</span></td>
            <td><dsp:input bean="PaymentGroupFormHandler.CurrentPaymentGroup.PONumber" type="text" maxlength="40"/><br></td>
          </tr>

          <dsp:droplet name="IsEmpty">
            <dsp:param bean="PaymentGroupDroplet.defaultPaymentGroup.billingAddress" name="value"/>
            <dsp:oparam name="false">
              <tr valign="top">
                <td align="right"><span class=smallb>Billing Address</span></td>
                <td><dsp:getvalueof id="pval0" bean="PaymentGroupDroplet.defaultPaymentGroup.billingAddress"><dsp:include page="common/DisplayAddress.jsp" flush="false"><dsp:param name="address" value="<%=pval0%>"/></dsp:include></dsp:getvalueof><br>
                    <dsp:droplet name="IsEmpty">
                      <dsp:param bean="Profile.billingAddrs" name="value"/>
                      <dsp:oparam name="false">
                        <span class=smallb><dsp:a bean="PaymentAddressFormHandler.paymentGroupKey" href="billing_address.jsp" paramvalue="invoiceRequestName"><dsp:param name="source" value="billing.jsp?init=false"/>Change billing address</dsp:a></span>
                      </dsp:oparam>
                    </dsp:droplet></td>
              </tr>
            </dsp:oparam>
          </dsp:droplet>


         <tr valign=top>
            <td align=right><span class=smallb>Multiple payment methods</span></td>
            <td><span class=smallb>
            <dsp:a href="payment_methods.jsp?link=split_payment_order.jsp&init=true">Split order by dollar amount</dsp:a><br>
            </span>
            </td>
    
          </tr>  
          <tr>
            <td></td>
            <td colspan=2><br>
            <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsSuccessURL" type="hidden" value="orderconfirm.jsp"/>
            <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsErrorURL" type="hidden" value="billing.jsp?init=true"/>
            <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroups" type="submit" value="Continue"/>
           </td>
         </tr>
       </table>
       </dsp:form>
       </td>
      </tr>
    </table>

  </dsp:oparam>
</dsp:droplet>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/billing_invoice_cc.jsp#9 $$Change: 514668 $--%>
