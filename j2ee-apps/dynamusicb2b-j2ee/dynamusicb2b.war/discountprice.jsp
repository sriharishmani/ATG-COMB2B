<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Fragment for displaying a SKU's discounted price -->
<!-- Last modified: 4 Apr 06 by KL -->

<!-- Title: Discount Price Page -->

<%-- Chapter 5, Exercise 1 --%>

<dsp:droplet name="/atg/commerce/pricing/PriceItem">
  <dsp:param name="item" param="sku"/>
  <dsp:param name="product" param="product"/>
  <dsp:oparam name="output">
  <dsp:param name="pricedItem" param="element"/>
		<br>
    <b>*Discount Price:</b> <dsp:valueof converter="currency" param="pricedItem.priceInfo.amount">no price</dsp:valueof>
  </dsp:oparam>
</dsp:droplet>

</dsp:page>

