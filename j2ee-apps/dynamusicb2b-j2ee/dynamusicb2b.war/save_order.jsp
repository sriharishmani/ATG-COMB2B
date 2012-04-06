<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/gifts/IsGiftShippingGroup"/>
<dsp:importbean bean="/atg/commerce/order/purchase/SaveOrderFormHandler"/>

<%/* expect a order number to be passed in, we could be acceepting a orderid but run the risk of users trying random orderId's and
seeing other people's orders. We might use the obfuscated id generator, but this is safter then even that*/%>

<DECLAREPARAM NAME="orderId" CLASS="java.lang.Integer" DESCRIPTION="number of the saved order">

<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- Save Order Page -->
<!-- Last modified: 20 Apr 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>Save Order</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Save Your Order"/>
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
        
        
<b>Order # <dsp:valueof bean="ShoppingCart.current.id"/></b>

<%-- Start form to name the order --%>



                 
         <P>
         
        <b>Order Contents:</b><br>

        <dsp:droplet name="ForEach">
          <dsp:param bean="ShoppingCart.current.commerceItems" name="array"/>
          <dsp:oparam name="output">
	    <dsp:getvalueof id="currentItem" param="element" idtype="atg.commerce.order.CommerceItem">

	      <%-- Display part number, product name/link, inventory info columns --%>
	      <dsp:include page="cart_line_item.jsp" flush="false">
	        <dsp:param name="item" value="<%=currentItem%>"/>
	      </dsp:include>&nbsp;&nbsp;&nbsp;

	      <%-- Display quantity --%>
              <dsp:valueof param="element.quantity"/>
               &nbsp;&nbsp;&nbsp;

	      <%-- display total list price and any discounted total price --%>
	      <dsp:include page="DisplayAmount.jsp" flush="false">
	        <dsp:param name="item" value="<%=currentItem%>"/>
              </dsp:include><br>


	    </dsp:getvalueof>
          </dsp:oparam>
        </dsp:droplet>

    
<p>
             <b>Subtotal

             <b><dsp:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency" /></b>

         </dsp:form>

 </td>
 </tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/save_order.jsp#8 $$Change: 514668 $--%>
