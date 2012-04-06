<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- Simple search results list (with links to products found) -->
<!-- Last modified: 13 Aug 02 by KL -->

<dsp:importbean bean="/atg/commerce/catalog/ProductSearch"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Search Results</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Dynamusic Search Results"/>
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
              <jsp:include page="searchpageExample.jsp" flush="true"></jsp:include>
<ul>
<dsp:droplet name="/atg/dynamo/droplet/ForEach">
   <dsp:param bean="ProductSearch.searchResults" name="array"/>
   <dsp:oparam name="output">
     <li><dsp:getvalueof id="templateURL" param="element.template.url" idtype="java.lang.String">
     <dsp:a href="<%=templateURL%>">
       <dsp:param name="id" param="element.repositoryId"/>
       <dsp:param name="navAction" value="jump"/>    
       <dsp:valueof param="element.displayName"/>
     </dsp:a></dsp:getvalueof>
   </dsp:oparam>
   <dsp:oparam name="empty">
     No products matched your search. Please try again.<p>
   </dsp:oparam>
</dsp:droplet>
</ul>

</BODY> </HTML>

</dsp:page>
