<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/pricing/UserPricingModels"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>

<dsp:include page="common/header.jsp" flush="false"><dsp:param name="pagetitle" value=" Checkout"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=3>
      <dsp:include page="navbar.jsp" flush="false"></dsp:include>
    </td>
    <%-- put breadcrumbs here --%>
    <td valign="top" width=745>
    <table border=0 cellpadding=4 width=80%>
    <tr><td colspan=3>
    <dsp:a href="cart.jsp">Current Order</dsp:a>>>
    <dsp:a href="shipping.jsp">Shipping</dsp:a>>>
    <dsp:a href="ship_to_multiple.jsp">Select Multiple Addresses</dsp:a>>>
    Select Shipping Methods &nbsp; </td></tr>

    <dsp:form action="billing.jsp" method="post">
    <%-- put errors here --%>
      <tr>
        <td colspan=3>
<!-- Display form errors. -->
<dsp:droplet name="Switch">
  <dsp:param bean="ShippingGroupFormHandler.formError" name="value"/>
  <dsp:oparam name="true">
    <font color=cc0000><STRONG><UL>
      <dsp:droplet name="ErrorMessageForEach">
        <dsp:param bean="ShippingGroupFormHandler.formExceptions" name="exceptions"/>
        <dsp:oparam name="output">
        <LI> <dsp:valueof param="message"/>
        </dsp:oparam>
      </dsp:droplet>
    </UL></STRONG></font><br>
  </dsp:oparam>
</dsp:droplet>
      </tr>
      
      <%--
      Each ShippingGroup will be assigned a shipping method here.
      --%>
      <dsp:droplet name="ForEach">
        <dsp:param bean="ShoppingCart.current.shippingGroups" name="array"/>
        
        <dsp:oparam name="output">
	<dsp:param name="sGroup" param="element"/>
          <tr valign=top>
            <td colspan=2>
            <table width=100% cellpadding=3 cellspacing=0 border=0>
              <tr>
                <td class=box-top>&nbsp;<font face="Verdana,Geneva,Arial" color="midnightblue" size="4">Shipping Group <dsp:valueof param="count"/></font></td>
              </tr>
            </table>
            </td>
          </tr>
          
          <dsp:droplet name="Switch">
            <dsp:param name="value" param="sGroup.shippingGroupClassType"/>
            <dsp:oparam name="electronicShippingGroup">
              Delivered to <dsp:valueof param="sGroup.emailAddress"/>
            </dsp:oparam>
            <dsp:oparam name="default">
          
            <tr valign=top>
              <td align=right><span class=smallb>Shipping address</span></td>
              <td width=75%>
                <dsp:include page="common/DisplayAddress.jsp" flush="false"><dsp:param name="address" param="sGroup.shippingAddress"/></dsp:include>
              </td>
            </tr>
            <tr valign=top>
              <td align=right><span class=smallb>Items</span></td>
              <td width="75%">
                <table border=0 cellpadding=1  width=75%>
                <dsp:droplet name="ForEach">
                  <dsp:param name="array" param="sGroup.CommerceItemRelationships"/>
                  
                  <dsp:oparam name="output">
                  <dsp:param name="CiRel" param="element"/>
                  <tr valign=top>
                      <td><dsp:valueof param="CiRel.quantity"/>&nbsp;
                      <dsp:a href="../catalog/product.jsp"><dsp:param name="id" param="CiRel.commerceItem.auxiliaryData.productId"/>
                          <dsp:valueof param="CiRel.commerceItem.auxiliaryData.productRef.displayName"/></dsp:a></td>
                    </tr>
                  </dsp:oparam>
                </dsp:droplet><%--ForEach--%>
                </table>
              </td>
            </tr>
            <tr valign=top>
              <td align=right width=25%><span class=smallb>Shipping method</span></td>
              <td align=left>
<%-- Chapter 9, Ex. 1, Step 6: Shipping Methods Select Box --%>
                <%--
                The AvailableShippingMethods servlet bean permits the user to select a
                shipping method that is applied to the current ShippingGroup.
                --%>





              </td>
            </tr>
            </dsp:oparam>
          </dsp:droplet><%--Switch--%>
        </dsp:oparam>
      </dsp:droplet>

      <tr valign="top">
      <td></td>
        <td colspan="2">
        <span class=smallb>
        <dsp:a href="ship_to_multiple.jsp?init=false">Edit shipping groups</dsp:a></span>
        <p>
        <%--
        Pushing the CONTINUE button will apply the properties set here and
        and proceed to the billing.jsp page.
        --%>
        <input type=submit 
               value="Continue">

        </td>
      </tr>
      </dsp:form>
     </td>
    </tr>
    </table>
  </td>
</tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/shipping_method.jsp#11 $$Change: 514668 $--%>
