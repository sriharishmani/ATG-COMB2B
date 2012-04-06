<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- page to gather shipping and payment information for express checkout -->
<!-- Last modified: 10 Apr 06 by KL -->

<!-- Title: Purchase Information Page -->

<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ExpressCheckoutFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Purchase Information</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Purchase Information"/>
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


<!-- Error handling -->
<dsp:droplet name="/atg/dynamo/droplet/Switch">
<dsp:param bean="ExpressCheckoutFormHandler.formError" name="value"/>
<dsp:oparam name="true">
  <font color=cc0000><STRONG><UL>
    <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
      <dsp:param bean="ExpressCheckoutFormHandler.formExceptions" name="exceptions"/>
      <dsp:oparam name="output">
	<LI> <dsp:valueof param="message"/>
      </dsp:oparam>
    </dsp:droplet>
    </UL></STRONG></font>
</dsp:oparam>
</dsp:droplet>
<!-- Start of form to capture shipping and billing information -->
<dsp:form action="purchaseinfo.jsp" method="post">

<%-- Chapter 8, Ex. 1, Step 1: Insert hidden inputs --%>
  <dsp:input type="hidden" bean="ExpressCheckoutFormHandler.commitOrder" value="false"/>
  <dsp:input type="hidden" bean="ExpressCheckoutFormHandler.paymentGroupNeeded" value="false"/>
  <dsp:input type="hidden" bean="ExpressCheckoutFormHandler.shippingGroupNeeded" value="false"/>
  <dsp:input type="hidden" bean="ExpressCheckoutFormHandler.expressCheckoutSuccessURL" value="orderconfirm.jsp"/>

  <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue">Shipping Method</font><br>
<%-- Chapter 9, Ex. 1: Shipping Methods Select Box --%>

  <p>
  <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue">Shipping Information</font><br>
<%-- Chapter 8, Ex. 1, Step 2: Insert Name and address information here --%>
  <b>First Name:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.firstName" beanvalue="Profile.firstName" size="30" type="text"/><br>
  <b>Middle Name:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.middleName" beanvalue="Profile.middleName" size="30" type="text"/><br>
  <b>Last Name:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.lastName" beanvalue="Profile.lastName" size="30" type="text"/><br>
  <b>Address 1:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.address1" beanvalue="Profile.shippingAddress.address1" size="30" type="text"/><br>
  <b>Address 2:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.address2" beanvalue="Profile.shippingAddress.address2" size="30" type="text"/><br>
  <b>City:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.city" beanvalue="Profile.shippingAddress.city" size="30" type="text" required="<%=true%>"/><br>
  <b>State:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.state" maxsize="2" beanvalue="Profile.shippingAddress.state" size="2" type="text" required="<%=true%>"/><br>
  <b>Postal Code:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.postalCode" beanvalue="Profile.shippingAddress.postalCode" size="10" type="text" required="<%=true%>"/><br>
  <b>Country:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.country" beanvalue="Profile.shippingAddress.country" size="10" type="text"/><br>
  <b>Email:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.email" beanvalue="Profile.email" size="30" type="text" required="<%=true%>"/><br>
  <b>Phone:</b> <dsp:input bean="ExpressCheckoutFormHandler.shippingGroup.shippingAddress.phoneNumber" beanvalue="Profile.daytimeTelephoneNumber" size="12" type="text"/><P>

<!-- Billing information -->  
  <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue">Billing Information</font><br>
  Please enter your name as it appears on your credit card.<br>
  <b>First Name:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.firstName" beanvalue="Profile.firstName" size="30" type="text" required="<%=true%>"/><br>
  <b>Middle Name:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.middleName" beanvalue="Profile.middleName" size="30" type="text"/><br>
  <b>Last Name:<b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.lastName" beanvalue="Profile.lastName" size="30" type="text" required="<%=true%>"/><br>
  <b>Address 1:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.address1" beanvalue="Profile.billingAddress.address1" size="30" type="text"/><br>
  <b>Address 2:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.address2" beanvalue="Profile.billingAddress.address2" size="30" type="text"/><br>
  <b>City:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.city" beanvalue="Profile.billingAddress.city" size="30" type="text" required="<%=true%>"/><br>
  <b>State:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.state" maxsize="2" beanvalue="Profile.billingAddress.state" size="2" type="text" required="<%=true%>"/><br>
  <b>Postal Code:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.postalCode" beanvalue="Profile.billingAddress.postalCode" size="10" type="text" required="<%=true%>"/><br>
  <b>Country:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.billingAddress.country" beanvalue="Profile.billingAddress.country" size="10" type="text"/><br>
<p>
  <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue">Credit Card Type:</font><br>
  <dsp:select bean="ExpressCheckoutFormHandler.paymentGroup.creditCardType" required="<%=true%>">
    <dsp:option value="Visa"/>Visa
    <dsp:option value="MasterCard"/>Master Card
    <dsp:option value="American Express"/>American Express
  </dsp:select><br>
  <b>Number:</b> <dsp:input bean="ExpressCheckoutFormHandler.paymentGroup.creditCardNumber" maxsize="20" size="20" type="text" value="4111111111111111" required="<%=true%>"/><br>
  <b>Expiration Date:</b>
  Month: <dsp:select bean="ExpressCheckoutFormHandler.paymentGroup.expirationMonth">
    <dsp:option value="1"/>January
    <dsp:option value="2"/>February
    <dsp:option value="3"/>March
    <dsp:option value="4"/>April
    <dsp:option value="5"/>May
    <dsp:option value="6"/>June
    <dsp:option value="7"/>July
    <dsp:option value="8"/>August
    <dsp:option value="9"/>September
    <dsp:option value="10"/>October
    <dsp:option value="11"/>November
    <dsp:option value="12"/>December
  </dsp:select>
  Year: <dsp:select bean="ExpressCheckoutFormHandler.paymentGroup.expirationYear">  
    <dsp:option value="2006"/>2006
    <dsp:option value="2007"/>2007
    <dsp:option value="2008"/>2008
    <dsp:option value="2009"/>2009
    <dsp:option value="2010"/>2010
    <dsp:option value="2011"/>2011
    <dsp:option value="2012"/>2012
    <dsp:option value="2013"/>2013
    <dsp:option value="2014"/>2014
  </dsp:select>
<p>  

<%-- Chapter 8, Ex. 1, Step 3: Create submit button --%>
  <dsp:input bean="ExpressCheckoutFormHandler.expressCheckout" type="submit" value="Confirm Order"/>
</dsp:form>
</font>
</td></tr></table>
</body>
</html>

</dsp:page>
