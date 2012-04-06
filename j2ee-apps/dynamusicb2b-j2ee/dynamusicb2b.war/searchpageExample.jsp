<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- Simple keyword product search form -->
<!-- Last modified: 13 Aug 02 by KL -->

<dsp:importbean bean="/atg/commerce/catalog/ProductSearch"/>
<dsp:importbean bean="/atg/commerce/catalog/AdvProductSearch"/>
<dsp:importbean bean="/atg/commerce/catalog/RepositoryValues"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

          <font face="Verdana,Geneva,Arial" color="midnightblue">

Search for text:<p><p>

<dsp:form action="searchResults.jsp" method="post">
    <dsp:select bean="AdvProductSearch.propertyValues.genre">
      <dsp:option value=""/>-- Any --
      <dsp:droplet name="RepositoryValues">
        <dsp:param name="itemDescriptorName" value="album"/>
        <dsp:param name="propertyName" value="genre"/>
        <dsp:oparam name="output">
          <dsp:droplet name="ForEach">
            <dsp:param name="array" param="values"/>
            <dsp:param name="sortProperties" value="+id"/>
            <dsp:oparam name="output">
              <dsp:getvalueof id="option140" param="element" idtype="java.lang.String">
<dsp:option value="<%=option140%>"/><dsp:valueof param="element"/> 
</dsp:getvalueof>

            </dsp:oparam>
          </dsp:droplet>
        </dsp:oparam>
      </dsp:droplet>
    </dsp:select>
    <p>

<dsp:input bean="ProductSearch.keywords" size="30" type="text" value=""/>
<dsp:input bean="AdvProductSearch.search" type="submit" value="Search"/>
<dsp:input bean="AdvProductSearch.search" type="hidden" value="Search"/>
</dsp:form>


</BODY> </HTML>

</dsp:page>
