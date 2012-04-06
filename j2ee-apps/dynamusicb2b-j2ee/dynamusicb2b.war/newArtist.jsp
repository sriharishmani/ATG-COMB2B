<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/ArtistFormHandler"/>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  NEW ARTIST
  
  Add description of an artist and her/his list of albums.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="New Artist"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
           <dsp:include page="common/sidebar.jsp">
           </dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          <dsp:form action="newArtist.jsp" method="post">
          
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
                   Name:
		            </td>
                <td valign="middle">
                   <dsp:input bean="/dynamusic/ArtistFormHandler.value.name" name="name" size="24" type="text" required="<%=true%>"/><br>
                </td>
	            </tr>
              <tr>
                <td valign="middle">
                   Image Path:
                </td>
                <td valign="middle">
                  <dsp:input bean="/dynamusic/ArtistFormHandler.value.photoURL" name="photoURL" size="24" type="text"/><br>
	        </td>
             </tr>
             <tr>
                 <td valign="middle">
                      Description:
                 </td>
                 <td valign="middle">
                      <dsp:textarea bean="/dynamusic/ArtistFormHandler.value.description" 
                         name="description" cols="60" rows="10" 
                         wrap="SOFT"/>
                 </td>
             </tr>
             <tr>
                <td> </td>
                <td>
                   <!-- defines the URL to go to on success (relative to 'action')-->
                   <dsp:input bean="/dynamusic/ArtistFormHandler.create" type="Submit" value="Create Artist Entry"/>
                   <dsp:input bean="/dynamusic/ArtistFormHandler.createSuccessURL" type="hidden" value="artists.jsp"/>
                 </td>
              </tr>
          </dsp:form>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>