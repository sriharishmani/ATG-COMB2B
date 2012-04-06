<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/promotion/CouponFormHandler"/>

<dsp:droplet name="/atg/dynamo/droplet/Switch">
<dsp:param bean="CouponFormHandler.formError" name="value"/>
<dsp:oparam name="true">
  <font color=cc0000><STRONG>There was a problem getting this coupon
  <UL>
    <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
      <dsp:param bean="CouponFormHandler.formExceptions" name="exceptions"/>
      <dsp:oparam name="output">
        <LI><dsp:valueof param="message"/>
      </dsp:oparam>
    </dsp:droplet>
    </UL></STRONG></font>
</dsp:oparam>
</dsp:droplet>


<b>If you have a coupon, type its code here:</b><br>
<%-- Chapter 15, Exercise 1, Part 2: Claim Coupon --%>



<%-- Set success and failure handlers--%>




<%-- Get the coupon claim code --%>




</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/CouponClaim.jsp#5 $$Change: 514668 $--%>
