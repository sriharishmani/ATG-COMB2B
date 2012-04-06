<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>


<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CreateInvoiceRequestFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- page to accept POs -->
<!-- Last modified: 20 Apr 06 by KL -->

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

<%-- Error Handling --%>

<p>
<dsp:droplet name="Switch">
  <dsp:param bean="CreateInvoiceRequestFormHandler.formError" name="value"/>
  <dsp:oparam name="true">
    <FONT COLOR=cc0000><STRONG><UL>
    <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
      <dsp:param bean="CreateInvoiceRequestFormHandler.formExceptions" name="exceptions"/>
      <dsp:oparam name="output">
        <LI> <dsp:valueof param="message"/>
      </dsp:oparam>
    </dsp:droplet>
    </UL></STRONG></FONT>
  </dsp:oparam>
</dsp:droplet>

<p>

<%-- Chapter 10, Exercise 1, Part 2: Fill in the PaymentGroupDroplet. --%>



<%/* Display available purchase order numbers. */%>
<p>Available PO Numbers: &nbsp;
<dsp:droplet name="ForEach">  
  <dsp:param bean="PaymentGroupDroplet.paymentGroupMapContainer.paymentGroupMap" name="array"/>
  <dsp:oparam name="output">
    <dsp:valueof param="element.PONumber"/> &nbsp;
  </dsp:oparam>
</dsp:droplet>


<%/* Default action is the error URL. */%>
<dsp:form formid="po" action="payment_methods.jsp?init=true" method="POST">

  <dsp:droplet name="Switch">

    <!-- Check whether the current user is authorized for invoice requests. -->


    <dsp:oparam name="true">
      <p>Enter additional purchase order numbers you wish to use for this order.
      <p>New PO number:

      <!-- Set the PONumber of the invoiceRequest for the CreateInvoiceRequestFormHandler. -->



      <dsp:input bean="CreateInvoiceRequestFormHandler.NewInvoiceRequestSuccessURL" type="hidden" value="payment_methods.jsp?init=false"/>

      <!-- Submit the form and call newInvoiceRequest handle method. -->



    </dsp:oparam>
    <dsp:oparam name="default">
      You are not authorized to pay by invoice.
    </dsp:oparam>
  </dsp:droplet>
</dsp:form>


<%/* Go on to the next step of the purchase process. */%>
<dsp:form formid="split" action="split_payment.jsp?init=true" method="POST">
  <input type=submit value=" Continue ">
</dsp:form>

</BODY>
</HTML>

</dsp:page>
