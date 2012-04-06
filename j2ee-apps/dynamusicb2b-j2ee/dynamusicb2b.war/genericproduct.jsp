<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- storefront page to loop through rootCategories property -->
<!-- Last modified: 3 Apr 06 by KL -->

<!-- this is a holder page for the chapter 3, Exercise 4 -->
<!-- for creating a page to display a product -->

<!-- Title: DynamusicB2C Product Page -->

<%-- Declare your "id" parameter here --%>
<DECLAREPARAM NAME="id" CLASS="java.lang.String" DESCRIPTION="Repository ID">
<%-- End parameter declaration--%>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Product Page</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Dynamusic Product Page"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" valign="top">
          <jsp:include page="navbar.jsp" flush="true"></jsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" color="midnightblue">
          <table width="500" cellpadding="8">
            <tr>
              <td width="100" valign="center">
                <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue">

<%-- Chapter 3, Exercise 4 --%>
<%-- Insert ProductLookup droplet --%>

<dsp:droplet name="/atg/commerce/catalog/ProductLookup">
   <dsp:param name="id" param="id"/>  
   <dsp:oparam name="output">

<%-- Chapter 4, Exercise 2: Display Navigation History --%>
<%-- Create Breadcrumb Trail --%>
       <dsp:droplet name="/atg/commerce/catalog/CatalogNavHistoryCollector">
         <dsp:param name="item" param="parentCategory"/>
         <dsp:param name="navAction" param="navAction"/>
         <dsp:param name="navCount" param="navCount"/>
       </dsp:droplet>
       <jsp:include page="breadcrumbs.jsp" flush="true"></jsp:include><p>

     <dsp:valueof param="element.itemDisplayName"/><p>
     <dsp:getvalueof id="img160" param="element.smallImage.url" idtype="java.lang.String">
         <dsp:img src="<%=img160%>"/>
     </dsp:getvalueof><p>
      <font face="Verdana,Geneva,Arial" size="-1" color="midnightblue">
      <dsp:valueof param="element.longDescription"/><P>

<%-- Chapter 3, Exercise 5 --%>
<%-- Display SKU information --%>
      <dsp:include page="skulist.jsp" flush="true">
	 <dsp:param name="product" param="element"/>
      </dsp:include>

<!-- Ch. 4, Ex. 1: Send Item View Notification -->
      <dsp:droplet name="/atg/commerce/catalog/ProductBrowsed">
	<dsp:param name="eventobject" param="element"/>
      </dsp:droplet>    

   </dsp:oparam>
   <dsp:oparam name="error">
         Unable to find product: <dsp:valueof param="id"/>
   </dsp:oparam>
   <dsp:oparam name="empty">
         Unable to find product: <dsp:valueof param="id"/>
   </dsp:oparam>   
</dsp:droplet>
</td></tr></table>
</BODY> </HTML>

</dsp:page>
