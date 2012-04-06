<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/TableForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentAddressFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>


<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- change billing address -->
<!-- Last modified: 15 Apr 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>Billing Address</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Billing Address"/>
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

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=3>
       
    </td>

    <dsp:include page="common/FormError.jsp" flush="false"></dsp:include>
  </tr>

  <tr>
    <%-- put breadcrumbs here --%>
    <td colspan=3 height=18><span class=small>
       &nbsp; <dsp:a href="cart.jsp">Current Order</dsp:a> &gt; 
     <dsp:a href="shipping.jsp">Shipping</dsp:a> &gt;
     <dsp:a href="billing.jsp">Billing</dsp:a> &gt; Billing Address &nbsp;</span>
    </td>
  </tr>

  <tr>
    <td width=55> </td>
    <td  valign="top" width=745>

    <%--
    This enables the user to change the billing address of any
    PaymentGroup that is a PaymentAddressContainer. Possible billing
    addresses are those found in the Profile.billingAddrs property.
    --%>

    <dsp:form action="billing_address.jsp" method="post">
    <table border=0 cellpadding=4 width=90%>
      <tr><td> </td></tr>
      <tr>
        <td colspan=2><span class="big">Billing Address</span></td>
      </tr>
      <tr>
      <tr><td> </td></tr>
    
      <tr valign="top">
        <td align="right" width=25%><span class=smallb>Select a billing address</span></td>
        <td>
        <dsp:droplet name="TableForEach">
          <dsp:param bean="Profile.billingAddrs" name="array"/>
          <dsp:param name="numColumns" value="3"/>
          <dsp:oparam name="outputStart">
            <table border=0 cellpadding=4 cellspacing=0>
          </dsp:oparam>
          <dsp:oparam name="outputEnd">
            </table>
          </dsp:oparam>
          <dsp:oparam name="outputRowStart"><tr valign=top></dsp:oparam>
          <dsp:oparam name="outputRowEnd"></tr></dsp:oparam>
          <dsp:oparam name="output">
            <dsp:droplet name="Switch">
              <dsp:param bean="Profile.defaultBillingAddress.id" name="value"/>
              <dsp:getvalueof id="elemId" idtype="String" param="element.id">
              <dsp:oparam name="<%=elemId%>">
                <td><dsp:input bean="PaymentAddressFormHandler.addressId" paramvalue="element.id" type="radio" checked="<%=true%>"/></td>
              </dsp:oparam>
              </dsp:getvalueof>
              
              <dsp:oparam name="default">
              <%-- Check to see whether not there id --%>
              <dsp:droplet name="IsEmpty">
                <dsp:param name="value" param="element.id"/>
                <dsp:oparam name="true">
                  <td></td>
                </dsp:oparam>
                <dsp:oparam name="false">
                <td><dsp:input bean="PaymentAddressFormHandler.addressId" paramvalue="element.id" type="radio" checked="<%=false%>"/></td>
              </dsp:oparam>
              </dsp:droplet>
              </dsp:oparam>
            </dsp:droplet>
               
            <%-- Now print the address if it exists. --%>            
            <td>
              <dsp:droplet name="IsEmpty">
                <dsp:param name="value" param="element.id"/>
                <dsp:oparam name="true">
                </dsp:oparam>
                <dsp:oparam name="false">
                  <dsp:getvalueof id="pval0" param="element"><dsp:include page="common/DisplayAddress.jsp" flush="false"><dsp:param name="address" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
              </dsp:oparam>
              </dsp:droplet>            
            </td>
            
          </dsp:oparam>
        </dsp:droplet>


        </td>
      </tr>
      <tr><td> </td></tr>

      <tr>
        <td></td>
        <td colspan=2><br>
        <dsp:input bean="PaymentAddressFormHandler.paymentGroupKey" beanvalue="PaymentAddressFormHandler.paymentGroupKey" type="hidden"/>
        <dsp:input bean="PaymentAddressFormHandler.setAddressSuccessURL" paramvalue="source" type="hidden"/>
        <dsp:input bean="PaymentAddressFormHandler.setAddress" type="submit" value="Continue"/>
       </td>
     </tr>
   </table>
   </dsp:form>
   </td>
  </tr>
</table>
</td></tr></table></font>
</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/billing_address.jsp#10 $$Change: 514668 $--%>
