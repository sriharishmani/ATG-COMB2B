<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<declareparam name="init" CLASS="java.lang.String" DESCRIPTION="init variable sent to page"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentAddressFormHandler"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>
<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Initial Billing Page to figure out who gets -->
<!-- which options for billing (CC or Invoice) -->
<!-- Last modified: 15 Apr 06 by KL -->

<HTML>
  <HEAD>
    <TITLE>Billing</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Billing"/>
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


<%--
Dynamusic follows the Motorprise model, in that it extends the Organization and Profile
objects to contain 2 additional properties: invoiceRequestAuthorization and 
creditCardAuthorization. This allows you to Switch on these Booleans to determine
which page to show. Motorprise is much more sophisticated in having its own custom
droplet, but this works for getting you to the pages you need to work on for the 
exercises.The three possible page fragments to display are:
1) billing_invoice.jsp
3) billinc_cc.jsp
2) billing_invoice_cc.jsp

These pages expect an init request parameter. If one exists here, its value is passed along as a droplet
parameter. Otherwise init is passed with the value true.
--%>

<!-- outermost switch on init parameter -->
<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param param="init" name="value"/>
  <dsp:oparam name="unset">
  <dsp:droplet name="/atg/dynamo/droplet/Switch">
    <dsp:param bean="Profile.invoiceRequestAuthorized" name="value"/>
    <dsp:oparam name="true">
    <dsp:droplet name="/atg/dynamo/droplet/Switch">
      <dsp:param bean="Profile.creditCardAuthorized" name="value"/>
      <dsp:oparam name="true">
      <dsp:include page="billing_invoice_cc.jsp" flush="false"><dsp:param name="init" value="true"/></dsp:include>
      </dsp:oparam>
      <dsp:oparam name="false">
      <dsp:include page="billing_invoice.jsp" flush="false"><dsp:param name="init" value="true"/></dsp:include>
      </dsp:oparam>
    </dsp:droplet>

    </dsp:oparam>
    
    <dsp:oparam name="false">
      <dsp:include page="billing_cc.jsp" flush="false"><dsp:param name="init" value="true"/></dsp:include>
    </dsp:oparam>

    <dsp:oparam name="unset">
      <dsp:include page="billing_cc.jsp" flush="false"><dsp:param name="init" value="true"/></dsp:include>       
    </dsp:oparam>
    <dsp:oparam name="default">
      <dsp:include page="billing_cc.jsp" flush="false"><dsp:param name="init" value="true"/></dsp:include>        
    </dsp:oparam>

  </dsp:droplet>

  </dsp:oparam>

 <dsp:oparam name="default">
   <dsp:droplet name="/atg/dynamo/droplet/Switch">
     <dsp:param bean="Profile.invoiceRequestAuthorized" name="value"/>
     <dsp:oparam name="true">
       <dsp:droplet name="/atg/dynamo/droplet/Switch">
         <dsp:param bean="Profile.creditCardAuthorized" name="value"/>
         <dsp:oparam name="false">
           <dsp:getvalueof id="pval1" param="init"><dsp:include page="billing_invoice.jsp" flush="false"><dsp:param name="init" value="<%=pval1%>"/></dsp:include></dsp:getvalueof>
         </dsp:oparam>
         <dsp:oparam name="true">
           <dsp:getvalueof id="pval0" param="init"><dsp:include page="billing_invoice_cc.jsp" flush="false"><dsp:param name="init" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
         </dsp:oparam>
       </dsp:droplet>

     </dsp:oparam>
     <dsp:oparam name="false">
       <dsp:getvalueof id="pval2" param="init"><dsp:include page="billing_cc.jsp" flush="false"><dsp:param name="init" value="<%=pval2%>"/></dsp:include></dsp:getvalueof>
     </dsp:oparam>
     <dsp:oparam name="unset">
       <dsp:getvalueof id="pval3" param="init"><dsp:include page="billing_cc.jsp" flush="false"><dsp:param name="init" value="<%=pval3%>"/></dsp:include></dsp:getvalueof>
     </dsp:oparam>
     <dsp:oparam name="default">
       <dsp:getvalueof id="pval4" param="init"><dsp:include page="billing_cc.jsp" flush="false"><dsp:param name="init" value="<%=pval4%>"/></dsp:include></dsp:getvalueof>
     </dsp:oparam> 
   </dsp:droplet>

  </dsp:oparam>
</dsp:droplet>
         </font>
       </td>
      </tr>
    </table>




</body>
</html>
</dsp:page>