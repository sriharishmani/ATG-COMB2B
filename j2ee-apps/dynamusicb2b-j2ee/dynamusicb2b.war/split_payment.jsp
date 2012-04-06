<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/BeanProperty"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- page to split payment -->
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


<%/* Check for errors */%>
<dsp:droplet name="Switch">
  <dsp:param bean="PaymentGroupFormHandler.formError" name="value"/>
  <dsp:oparam name="true">
    <font color=cc0000><STRONG><UL>
      <dsp:droplet name="ErrorMessageForEach">
        <dsp:param bean="PaymentGroupFormHandler.formExceptions" name="exceptions"/>
        <dsp:oparam name="output">
        <LI> <dsp:valueof param="message"/>
        </dsp:oparam>
      </dsp:droplet>
    </UL></STRONG></font>
  </dsp:oparam>
</dsp:droplet>

<dsp:droplet name="PaymentGroupDroplet">

  <dsp:oparam name="output">

    <!-- Set the listId property of the PaymentGroupFormHandler. -->


    <dsp:include page="payment_table_hdr.jsp" flush="true"></dsp:include>

                  <dsp:droplet name="ForEach">

                  <!-- Iterate over the currentList of OrderPaymentInfo objects -->


                    <dsp:oparam name="output">                      
                      <dsp:form formid="split" action="split_payment.jsp?init=true" method="post">

                      <tr valign=top>
                        <td><dsp:valueof converter="currency" param="element.amount"/></td>
                        <td>&nbsp;</td>


                        <td>$<!-- Input the split amount. -->
                  	
                        </td>

                        <td>&nbsp;</td>
                        <td>
                          
                           <dsp:getvalueof id="payMethod" idtype="String" param="element.paymentMethod" >
                          <!-- Select the payment method. -->
			
                            <%@ include file="payment_select_list.jspf" %>
                          

                          </dsp:getvalueof>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                          <!-- Preserve the listId. -->


                          <!-- Set the split payment success URL. -->

                          
                          <!-- Submit the form to split payment infos. -->


                        </td>
                      </tr>
                      </dsp:form>
                    </dsp:oparam>
                  </dsp:droplet>
                 <dsp:include page="payment_tbl_footer.jsp" flush="true"></dsp:include>
<br>
            <dsp:form formid="save" action="split_payment.jsp?init=false" method="post">

             <!-- Set the apply payment groups success URL. --> 

            
            <!-- Submit the form to apply payment groups to order. -->


            </dsp:form>
    </div> </td></tr></table>
  </dsp:oparam>
</dsp:droplet>
</BODY>
</HTML>

</dsp:page>
