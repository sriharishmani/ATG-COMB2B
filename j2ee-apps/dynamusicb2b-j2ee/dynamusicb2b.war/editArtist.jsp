<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>

<dsp:importbean bean="/dynamusic/ArtistFormHandler"/>

<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  
  EDIT ARTIST
  
  Modify description of an artist and her/his list of albums.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Edit Artist"/>
  </dsp:include>
    
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
        <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->

<dsp:setvalue bean="ArtistFormHandler.repositoryId" paramvalue="artistId"/>
            
					<dsp:form action="editArtist.jsp">

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

						<dsp:input bean="ArtistFormHandler.repositoryId" type="hidden" paramvalue="artistId"/>		
              
						<table cellpadding="10" border=0>
                <tr>
                  <td valign="middle">
                    Artist Name:
                  </td>
                  <td valign="middle">
                    <font face="Courier New" size="-1">
                      <dsp:input type="text" bean="ArtistFormHandler.value.name"/>
											<dsp:input type="hidden" bean="ArtistFormHandler.updateSuccessURL" value="success.jsp"/> 
											<dsp:input type="hidden" bean="ArtistFormHandler.deleteSuccessURL" value="success.jsp"/>
											<dsp:input type="submit" bean="ArtistFormHandler.update" value="Save Changes"/> &nbsp;
											<dsp:input type="submit" bean="ArtistFormHandler.delete" value="Delete This Artist"/>
                 			
                    </font>
                  </td>
                </tr>
                <tr>
                  <td valign="top">
                    Description:
                  </td>
                  <td valign="top">
                      <dsp:textarea 
                         bean="/dynamusic/ArtistFormHandler.value.description" 
                         name="description" cols="60" rows="10" 
                         wrap="SOFT"/>
                  </td>
                </tr>
                <tr>
                  <td valign="top">
                    Albums:
                   </td>
                  <td valign="top">
<!-- Chapter 1 Lab Impact: This section was added to accomodate the new albums property -->
                  <dsp:droplet name="/dynamusic/ArtistLookupDroplet">
                    <dsp:param name="id" param="artistId"/>
                    <dsp:oparam name="output">
                 	   <dsp:droplet name="/atg/dynamo/droplet/ForEach">
             			            
                	    <dsp:param name="array" param="element.albums"/>
              				<dsp:oparam name="outputStart">
                				<ul>
              				</dsp:oparam>
              				<dsp:oparam name="outputEnd">
                				</ul>
              				</dsp:oparam>
              				<dsp:oparam name="output">
              				<dsp:param name="album" param="element"/>
                				<li><dsp:a href="albumDetails.jsp">
                      		<dsp:param name="itemId" param="album.id"/>
                      		<dsp:valueof param="album.title"/>
                    		</dsp:a>
              				</dsp:oparam>
              				<dsp:oparam name="empty">
                				No albums found for this artist.
              				</dsp:oparam>
                     </dsp:droplet>
                    </dsp:oparam>                                      
                  </dsp:droplet>
                  </td>
                </tr>
              </table>
            </dsp:form>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>

</dsp:page>
