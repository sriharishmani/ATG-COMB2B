<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- fragment to loop through a list of SKUs and display SKU info -->
<!-- Last modified: 6 Apr 06 by KL -->

<!-- this is a holder page for the chapter 6 labs -->

<!-- Title: Sku List -->

<%-- Declare the "product" parameter here --%>
<DECLAREPARAM NAME="product" CLASS="atg.repository.RepositoryItem" DESCRIPTION="Product Item">
<%-- End parameter declaration--%>

<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/pricing/priceLists/PriceDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/pricing/priceLists/ComplexPriceDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/For"/>

<%/* This page fragment displays SKU detail. */%>

<dsp:droplet name="ForEach">
  <dsp:param name="array" param="product.childSKUs"/>
  
  <dsp:oparam name="outputStart">
    <p>Skulist: <ul>
  </dsp:oparam>
  <dsp:oparam name="outputEnd">
    </ul>
  </dsp:oparam>
  <dsp:oparam name="output">
  <dsp:param name="sku" param="element"/>
    <li><dsp:valueof param="sku.displayName"/>, 

<%-- Chapter 6, Exercise 1, Part 3 --%>
<%-- Insert the PriceDroplet and ComplexPriceDroplet here --%>
 




    
<%-- Chapter 7, Exercise 1 --%>
<%-- Insert Add to Cart button here --%>


<%-- Chapter 13, Exercise 2: Inventory Lookup --%>


  </dsp:oparam>
  <dsp:oparam name="empty"> 
    None available.
  </dsp:oparam>
</dsp:droplet>




</dsp:page>
