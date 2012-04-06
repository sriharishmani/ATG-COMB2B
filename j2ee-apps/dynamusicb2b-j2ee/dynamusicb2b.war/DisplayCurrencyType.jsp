<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/CurrencyConversionFormatter"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<DECLAREPARAM NAME="currency" CLASS="java.lang.String" DESCRIPTION="currency value of product">

<dsp:droplet name="CurrencyConversionFormatter">
  <dsp:param name="currency" param="currency"/>
  <dsp:param bean="Profile.priceList.locale" name="locale"/>
  <dsp:param bean="Profile.priceList.locale" name="targetLocale"/>
  <dsp:param name="euroSymbol" value="&euro;"/>
  <dsp:oparam name="output">
    <dsp:valueof valueishtml="<%=true%>" param="formattedCurrency">no price</dsp:valueof>  
  </dsp:oparam>
</dsp:droplet>

</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/DisplayCurrencyType.jsp#5 $$Change: 514668 $--%>
