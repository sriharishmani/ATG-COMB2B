<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>

	<!-- ATG Training -->
	<!-- Creating Commerce Applications -->
	<!-- storefront page to loop through rootCategories property -->
	<!-- Last modified: 3 Apr 06 by KL -->

	<!-- this is a holder page for the chapter 3, Exercise 4 -->
	<!-- for creating a page to display a product -->

	<!-- Title: DynamusicB2C Product Page -->

	<%-- Declare your "id" parameter here --%>
	<DECLAREPARAM NAME="id" CLASS="java.lang.String"
		DESCRIPTION="Repository ID">
	<%-- End parameter declaration--%>

	<HTML>
	<HEAD>
	<TITLE>Dynamusic Product Page</TITLE>
	</HEAD>
	<BODY>
	<dsp:include page="common/header.jsp">
		<dsp:param name="pagename" value="Dynamusic Product Page" />
	</dsp:include>
	<table width="700" cellpadding="8">
		<tr>
			<!-- Sidebar -->
			<td width="100" valign="top"><jsp:include page="navbar.jsp"
				flush="true"></jsp:include></td>
			<!-- Page Body -->
			<td valign="top"><font face="Verdana,Geneva,Arial"
				color="midnightblue"> <%-- Chapter 3, Exercise 4 --%> <%-- Insert ProductLookup droplet --%>
			<dsp:droplet name="/atg/commerce/catalog/ProductLookup">
				<dsp:param name="id" param="itemId" />
				<dsp:oparam name="output">
					<h2><dsp:valueof param="element.itemDisplayName" /></h2>
					<dsp:getvalueof id="img12" param="element.smallImage.url"
						idtype="java.lang.String">
						<dsp:img src="<%=img12%>" />  <br>
					</dsp:getvalueof>
					<dsp:valueof param="element.description" />
                <br><p>
                <dsp:include page="skulist.jsp">
                    <dsp:param name="product" param="element"/>
                </dsp:include>
				</dsp:oparam>
            </dsp:droplet>


			</td>
		</tr>
	</table>
	</BODY>
	</HTML>

</dsp:page>
