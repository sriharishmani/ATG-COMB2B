<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/VenueFormHandler"/>

<%-- requires itemID: a venue repository item --%>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Concert</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Add Venue"/>
    </dsp:include>    
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
                <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          <dsp:form action="newVenue.jsp" method="post">
               
                 <!-- Default form error handling support -->
                 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                   <dsp:oparam name="output">
                     <b><dsp:valueof param="message"/></b><br>
                   </dsp:oparam>
                   <dsp:oparam name="outputStart">
                     <LI>
                   </dsp:oparam>
                   <dsp:oparam name="outputEnd">
                     </LI>
                   </dsp:oparam>
                 </dsp:droplet>
      
              <table cellpadding="10">
                <tr>
                  <td valign="middle">
                     Venue Name:
                  </td>
                  <td valign="middle">
                     <dsp:input bean="VenueFormHandler.value.name" required="<%=true%>" size="40"/>
                  </td>
                </tr>               

                <tr>
                  <td>
                     Image Path:
                  </td>
                  <td>
                     <dsp:input bean="VenueFormHandler.value.imageURL" size="40" type="text" />
                  </td>
                </tr>
                <tr>
                  <td>
                      Address:
                  </td>
                  <td>
                     <font size="-2">Street</font> <dsp:input bean="VenueFormHandler.value.street1" size="24" type="text"/><br>
                     <font size="-2">Street</font> <dsp:input bean="VenueFormHandler.value.street2" size="24" type="text"/><br>
                     <font size="-2">City</font> <dsp:input bean="VenueFormHandler.value.city" size="10" type="text"/>
                     <font size="-2">State</font> <dsp:input bean="VenueFormHandler.value.state" size="2" type="text"/>
                     <font size="-2">Zip</font> <dsp:input bean="VenueFormHandler.value.zip" size="5" type="text"/>
                  </td>
                </tr>
                <tr>
                   <td>
                     Type:
                   </td>
                   <td>
                	<dsp:input type="checkbox"
				bean="VenueFormHandler.value.type" 
				value="concert" checked="<%=true%>"/>Concerts<br>
			<dsp:input type="checkbox"
				bean="VenueFormHandler.value.type" 
				value="sport" />Sporting Events<br>
			<dsp:input type="checkbox" 
				bean="VenueFormHandler.value.type" 
				value="theater" />Plays and Musicals<br>
			<dsp:input type="checkbox" 
				bean="VenueFormHandler.value.type" 
				value="dance" />Dance Performances<br>
			<dsp:input type="checkbox"
				bean="VenueFormHandler.value.type" 
				value="other" />Other<br>
		   </td>
                <tr>
                   <td>
                     Description:
                   </td>
                   <td>
                      <dsp:textarea 
                        bean="VenueFormHandler.value.description" 
                        cols="40" rows="4" 
                         wrap="SOFT" />
                   </td>
                 </tr>
              </table>

               
                 <!-- defines the URL to go to on success (relative to 'action')-->
                 <dsp:input bean="VenueFormHandler.createSuccessURL" type="hidden" value="venues.jsp"/>
                 <dsp:input bean="VenueFormHandler.create" type="Submit" value="Add New Venue"/>
                 <dsp:input bean="VenueFormHandler.cancel" type="Submit" value="Cancel"/>
               </dsp:form>

            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>

</dsp:page>

