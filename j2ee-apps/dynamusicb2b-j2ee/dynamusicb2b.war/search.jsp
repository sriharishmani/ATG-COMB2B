<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  SEARCH
  
  User can search for a song, using a fragment of its title.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Search"/>
  </dsp:include>    
  </table>
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
          
            <i> Please enter the name (or first few characters) of the song you're looking for: </i>
            <p>&nbsp;<br> 
            
            <dsp:form action="search.jsp" method="post">
            
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
            
              <dsp:input bean="SongSearchFormHandler.keywordInput" size="24" type="text"/><br>
              <dsp:input bean="SongSearchFormHandler.successURL" type="hidden" value="searchResults.jsp"/>
              <dsp:input bean="SongSearchFormHandler.search" type="submit" value="Search"/>
            
            </dsp:form>

            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>