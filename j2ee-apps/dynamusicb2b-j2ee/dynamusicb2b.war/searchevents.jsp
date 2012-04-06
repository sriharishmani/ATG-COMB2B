<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/EventSearchFormHandler"/>
<html>
<head>
   <title>Dynamusic Events</title>
</head>
<body>
       <dsp:include page="common/header.jsp">
          <dsp:param name="pagename" param="Search Events"/>
       </dsp:include>

       <table CELLPADDING=8 WIDTH="700" >
          <tr>
             <!-- Sidebar -->
             <td width="100" bgcolor="ghostwhite" valign="top">
                 <dsp:include page="common/sidebar.jsp"></dsp:include>
				     </td>

             <!-- Page Body -->
            <td VALIGN=TOP>
            <dsp:form action="searchevents.jsp" method="post">
            
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
            
              Search for concerts: <dsp:input type="text" bean="EventSearchFormHandler.keywordInput" size="24"/>
              <dsp:input bean="/dynamusic/EventSearchFormHandler.successURL" type="hidden" value="eventSearchResults.jsp"/>
              <dsp:input bean="EventSearchFormHandler.search" type="submit" value="Search"/>
            
            </dsp:form>
            <!-- *** Start page content *** -->
            <font face="Verdana,Geneva,Arial" size=-1>

          </font>
              <!-- *** End real content *** --></td>
           </tr>
         </table>


</body>
</html>
</dsp:page>