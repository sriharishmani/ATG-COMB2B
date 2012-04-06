<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- Order Status Page -->
<!-- Last modified: 14 Aug 02 by KL -->

<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Order Status</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Order Status"/>
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

      <dsp:droplet name="Switch">
        <dsp:param bean="ShoppingCart.last.state" name="value"/>
        <dsp:oparam name="5000">
           Your order requires approval. A message has been sent to your approver to review your order.<p>

        </dsp:oparam>
        <dsp:oparam name="default">
        </dsp:oparam>
      </dsp:droplet>

        Your order number is <font size=+1># <dsp:valueof bean="ShoppingCart.last.id"/></font>.
        Thank you for your order. Please come back soon!

</body>
</html>

</dsp:page>
