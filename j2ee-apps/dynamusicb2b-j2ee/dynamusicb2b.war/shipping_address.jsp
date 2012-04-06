<%@ taglib uri="dsp" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/TableForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
<dsp:importbean bean="/atg/projects/b2bstore/repository/B2BRepositoryFormHandler"/>


<dsp:include page="../common/HeadBody.jsp" flush="false"><dsp:param name="pagetitle" value=" Checkout"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2>
      <dsp:include page="../common/BrandNav.jsp" flush="false"></dsp:include>
    </td>
  </tr>

  <tr bgcolor="#DBDBDB">
    <%-- put breadcrumbs here --%>
    <td colspan=2 height=18><span class=small>
       &nbsp; <dsp:a href="cart.jsp">Current Order</dsp:a> &gt; 
       <dsp:a href="shipping.jsp">Shipping</dsp:a> &gt; Ship to Another Address &nbsp;</span>
    </td>
  </tr>

  <tr>
    <td width=55><dsp:img src="../images/d.gif" hspace="27"/></td>
  <td  valign="top" width=745>
    
    <dsp:form action="shipping_address.jsp" method="post">
    <table border=0 cellpadding=4 width=90%>
      <tr><td><dsp:img src="../images/d.gif"/></td></tr>
      <tr>
        <td colspan=2><span class="big">Shipping Address</span>
        <dsp:include page="../common/FormError.jsp" flush="false"></dsp:include></td>
      </tr>
      <tr><td><dsp:img src="../images/d.gif"/></td></tr>
      
      <tr valign="top">
        <td align="right"><span class=smallb>Select a shipping address</span></td>
        <td>
            <dsp:input bean="B2BRepositoryFormHandler.repositoryId" beanvalue="Profile.id" type="hidden"/>

            <dsp:droplet name="TableForEach">
          <dsp:param name="numColumns" value="3"/>
          <dsp:param bean="Profile.shippingAddrs" name="array"/>
          <dsp:oparam name="outputStart">
            <table border=0 cellpadding=4 cellspacing=0>
          </dsp:oparam>
          <dsp:oparam name="outputEnd">
            </table>
            <dsp:input bean="B2BRepositoryFormHandler.itemDescriptorName" type="hidden" value="user"/>
          </dsp:oparam>
          <dsp:oparam name="outputRowStart"><tr valign=top></dsp:oparam>
          <dsp:oparam name="outputRowEnd"></tr></dsp:oparam>

          <dsp:oparam name="output">
            <%-- <dsp:getvalueof id="addr" idtype="Object" bean="B2BRepositoryFormHandler.value.defaultShippingAddress">
              id is <%=addr.getRepositoryId()%><br> 
            </dsp:getvalueof> --%>
            
            <dsp:droplet name="Switch">
              <dsp:param name="value" param="element.id"/>
              <dsp:getvalueof id="addressId" idtype="String" bean="Profile.defaultShippingAddress.id">
              <%-- <dsp:oparam name="bean:Profile.defaultShippingAddress.id"> --%>
                <dsp:oparam name="<%=addressId%>">
              
                  <td><dsp:input bean="B2BRepositoryFormHandler.value.defaultShippingAddress.repositoryId" paramvalue="element.id" type="radio" checked="<%=true%>"/></td>
                  <td><dsp:getvalueof idtype="atg.repository.RepositoryItem" id="pval0" param="element"><dsp:include page="../common/DisplayAddress.jsp" flush="false"><dsp:param name="address" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
                  </td>                
                </dsp:oparam>
              </dsp:getvalueof>
              <dsp:oparam name="unset">unset
              </dsp:oparam>
              <dsp:oparam name="default">
                <td><dsp:input bean="B2BRepositoryFormHandler.value.defaultShippingAddress.repositoryId" paramvalue="element.id" type="radio"/></td>
                <td>
                <dsp:getvalueof id="pval0" idtype="atg.repository.RepositoryItem" param="element"><dsp:include page="../common/DisplayAddress.jsp" flush="false"><dsp:param name="address" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
                </td>
               </dsp:oparam>
            </dsp:droplet>
          </dsp:oparam>
        </dsp:droplet>
      
        </td>
      </tr>
      <tr><td><dsp:img src="../images/d.gif"/></td></tr>

      <tr>
        <td></td>
        <td colspan=2><br>
            <dsp:input bean="B2BRepositoryFormHandler.updateSuccessURL" type="hidden" value="shipping.jsp"/>
            <dsp:input bean="B2BRepositoryFormHandler.updateErrorURL" type="hidden" value="shipping_address.jsp"/>
            <dsp:input bean="B2BRepositoryFormHandler.update" type="submit" value="Continue"/>
       </td>
     </tr>
   </table>
   </dsp:form>
   </td>
  </tr>
</table>

</body>
</html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/shipping_address.jsp#9 $$Change: 514668 $--%>
