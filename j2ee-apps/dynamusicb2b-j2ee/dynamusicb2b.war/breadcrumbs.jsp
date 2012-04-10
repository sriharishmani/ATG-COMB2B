<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/catalog/CatalogNavHistory"/>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- storefront page to loop through rootCategories property -->
<!-- Last modified: 4 Apr 06 by KL -->

<!-- this is a holder page for the chapter 4, Exercise 2 -->
<!-- for creating a page to display a category -->
<!-- This fragment shows a "bread crumb trail", showing the user's navigation 
     history, and allowing them to link to the previous products and categories
     they have viewed. -->
<!-- Title: Breadcrumbs -->

<font face="Verdana,Geneva,Arial" size="1" color="midnightblue">

<%-- Chapter 4, Exercise 2 --%>
<%-- Insert ForEach droplet to iterate through the navHistory --%>
<dsp:droplet name="/atg/dynamo/droplet/ForEach">
    <dsp:param name="array" bean="/atg/commerce/catalog/CatalogNavHistory.navHistory"/>
  <dsp:oparam name="output"> 
      <dsp:getvalueof id="templateURL"
                      idtype="java.lang.String"
                      param="element.template.url">
          <dsp:a href="<%=templateURL%>">
              <dsp:param name="id" param="element.repositoryId"/>
              <dsp:param name="navAction" value="pop"/>
              <dsp:param bean="/atg/commerce/catalog/CatalogNavHistory.navCount" name="navCount"/>
              <dsp:valueof param="element.displayName"/>
          </dsp:a>
                      </dsp:getvalueof> ->
  </dsp:oparam>
  <dsp:oparam name="empty"> 
        No history
  </dsp:oparam>
</dsp:droplet>


</font>
</dsp:page>
