<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- Order Confirmation Page -->
<!-- Last modified: 14 Aug 02 by KL -->

<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ExpressCheckoutFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Order Confirmation</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Order Confirmation"/>
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

<!-- Ch. 8, Ex. 2: Display order pricing information -->
  <b>Subtotal:</b> <dsp:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency">no price</dsp:valueof><br>
  <b>Shipping:</b> <dsp:valueof bean="ShoppingCart.current.priceInfo.shipping" converter="currency">no shipping</dsp:valueof><br>
  <b>Total:</b> <dsp:valueof bean="ShoppingCart.current.priceInfo.total" converter="currency">no total</dsp:valueof>
<p>

Please click the "Confirm Order" button to finalize your order.<p>
<dsp:form action="orderconfirm.jsp" method="post">
  <dsp:input type="hidden" bean="ExpressCheckoutFormHandler.commitOrder" value="true"/>
  <dsp:input type="hidden" bean="ExpressCheckoutFormHandler.expressCheckoutSuccessURL" value="orderstatus.jsp"/>
  <dsp:input bean="ExpressCheckoutFormHandler.expressCheckout" type="submit" value="Confirm Order"/>
</dsp:form>
</font></td></tr></table>
</body>
</html>

</dsp:page>
