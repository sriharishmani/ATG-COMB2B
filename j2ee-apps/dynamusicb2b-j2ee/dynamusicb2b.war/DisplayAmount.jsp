<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/dynamo/droplet/Compare"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<DECLAREPARAM NAME="item" CLASS="atg.commerce.order.CommerceItem"
    DESCRIPTION="item to display the total amount for">

<dsp:droplet name="IsNull">
 <dsp:param name="value" param="item.priceInfo"/>
 <dsp:oparam name="false">
  <dsp:droplet name="Compare">
    <dsp:param name="obj1" param="item.priceInfo.amount"/>
    <dsp:param name="obj2" param="item.priceInfo.rawTotalPrice"/>
      <dsp:oparam name="equal">

        <dsp:valueof param="item.priceInfo.amount" converter="currency"/>
      </dsp:oparam>
      <dsp:oparam name="default">

        <dsp:valueof param="item.priceInfo.amount" converter="currency"/>
      </dsp:oparam>
      </dsp:droplet>
    </dsp:oparam>
  </dsp:droplet>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/DisplayAmount.jsp#7 $$Change: 514668 $--%>
