<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/SaveOrderFormHandler"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- Cart Page -->
<!-- Last modified: 1 May 07 by RM -->

<HTML>
  <HEAD>
    <TITLE>Dynamusic Shopping Cart</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Your Shopping Cart"/>
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
          
<%-- Chapter 7, Exercise 4, Step 3: Reprice the order when the page is loaded --%>

<%-- Chapter 7, Exercise 3, Step 1: Error Handling --%>




<%-- Chapter 7, Exercise 2 --%>
<%-- Loop through CommerceItems to display each Commerce Item --%>
<p>
<dsp:form method="post" action="cart.jsp">



</font><p>
  <hr size="0">
  <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue">Shopping Cart Subtotal:</font><p>
  <font face="Verdana,Geneva,Arial" color="midnightblue">

<%-- Chapter 7, Exercise 4: Display Order Subtotal and Recalculate Button --%>
  <!-- Order Subtotal -->


  <!-- Recalculate Button -->


<%-- Chapter 9, Exercise 1, Step 4: Test ShippingGroup Address --%>


<%-- Chapter 7, Exercise 3, Step 2: Add Checkout Button --%>



</dsp:form>
<p>
<%-- Chapter 7, Optional Exercise 7: Display User's Promotions --%>




<%-- Chapter 11, Exercise 1: Create Save Order Form --%>

</font>
</td></tr>
</table>
</body>
</html>


</dsp:page>
