<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/EventSearchFormHandler"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Search Results</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
         <dsp:param name="pagename" value="Concert Search Results"/>
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
          
            <p>The following events match your criteria: <p>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param bean="EventSearchFormHandler.searchResults" name="array"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
              <dsp:oparam name="output">

                 <li>
                    <dsp:a href="concertDetails.jsp">
                      <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.name"/>
                    </dsp:a>


              </dsp:oparam>
              <dsp:oparam name="empty">
                Sorry, no concerts matched your search criteria.
              </dsp:oparam>
            </dsp:droplet>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>