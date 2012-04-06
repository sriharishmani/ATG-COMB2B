<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- storefront page to loop through rootCategories property -->
<!-- Last modified: 2 Apr 06 by KL -->

<!-- this is a holder page for the chapter 3 labs -->

<!-- Title: DynamusicB2B Storefront -->

<HTML>
  <HEAD>
    <TITLE>Dynamusic Store</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Dynamusic Store"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <dsp:include page="navbar.jsp">
          </dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="+1" color="midnightblue">

<dsp:importbean bean="/atg/userprofiling/Profile"/>

<%-- Checking to see if the user is logged in --%>
<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param bean="/atg/userprofiling/Profile.transient" name="value"/>
<%-- User is logged in if false --%>
  <dsp:oparam name="false">
  
    <font face="Verdana,Geneva,Arial" size="+2" color="midnightblue"><dsp:valueof bean="Profile.firstName"/>'s Categories</font> 

<%-- Chapter 3, Exercise 7 --%>
<%-- Iterate over all root categories here --%>



<%-- End root categories iteration --%>

  </dsp:oparam>
<%-- User is NOT logged in if true --%>
  <dsp:oparam name="true">
    Please log in or register to see your categories.
  </dsp:oparam>
</dsp:droplet>

<%-- NOTE: The Motorprise application has a scenario to set the
     Profile's Catalog property to the base catalog. This is another
     option. --%>
      
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>


</dsp:page>
