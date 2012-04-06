<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- Simple keyword product search form -->
<!-- Last modified: 13 Aug 02 by KL -->

<dsp:importbean bean="/atg/commerce/catalog/ProductSearch"/>

<HTML> 
<HEAD>
<TITLE>Search Page</TITLE>
<BODY BGCOLOR="silver"><font face="arial">
</HEAD>
<dsp:include page="navbar.jsp" flush="true"></dsp:include>

Search for keywords:
<dsp:form action="searchResults.jsp" method="post">
<dsp:input bean="ProductSearch.keywords" size="50" type="text" value=""/>
<dsp:input bean="ProductSearch.search" type="submit" value="Search"/>
<dsp:input bean="ProductSearch.search" type="hidden" value="Search"/>
</dsp:form>

</BODY> </HTML>

</dsp:page>
