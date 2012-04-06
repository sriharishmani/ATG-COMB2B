<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/SongFormHandler"/>
<dsp:importbean bean="/dynamusic/EnumForEach"/>

<% /* input parameters: albumId (required) */ %>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  NEW ALBUM
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic New Song</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Add Song"/>
    </dsp:include>    
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
            <dsp:include page="common/sidebar.jsp"></dsp:include>
            <font size="-2">
              &nbsp;<br>
            </font>

        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-3">
          
          <!-- *** Start page content *** -->
          <dsp:droplet name="/dynamusic/AlbumLookupDroplet">
            <dsp:param name="id" param="albumId"/>
            <dsp:oparam name="empty">
               Album with ID <dsp:valueof param="albumId">NONE</dsp:valueof> not found.
            </dsp:oparam>
            <dsp:oparam name="output">
 
               <dsp:form action="newSong.jsp" method="post">
               
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
      
<!-- TBD: check for itemId -->

              <dsp:input bean="SongFormHandler.albumId"
                   type="hidden" 
                   paramvalue="albumId"/>

              <dsp:input bean="SongFormHandler.artistId"
                   type="hidden" 
                   paramvalue="element.artist.id"/>

              <table cellpadding="10">
                <tr>
                  <td valign="middle">
                    <font face="Verdana,Geneva,Arial" size="-1">
                      Album Title:
                    </font>
                  </td>
                  <td valign="middle">
                     <dsp:valueof param="element.title"/>
                  </td>
                </tr>               

                <tr>
                  <td valign="middle">
                    <font face="Verdana,Geneva,Arial" size="-1">
                      Artist:
                    </font>
                  </td>
                  <td valign="middle">
                     <dsp:valueof param="element.artist.name"/>
                  </td>
                </tr>               

                <tr>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                       Song Title:
                     </font>
                  </td>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">

                       <dsp:input bean="SongFormHandler.value.title" size="24" 
                                  type="text" required="<%=true%>"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                      Download Path:
                    </font>
                  </td>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                       <dsp:input bean="SongFormHandler.value.downloadURL" size="24" 
                                  type="text"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                      Genre:
                    </font>
                  </td>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                      <dsp:select bean="SongFormHandler.value.songGenre">
                      <dsp:droplet name="EnumForEach">
		            <dsp:param name="repositoryName" value="/dynamusic/SongsRepository"/>
		            <dsp:param name="itemDescriptorName" value="song"/>
		            <dsp:param name="propertyName" value="songGenre"/>
                            <dsp:oparam name="output">
                                 <dsp:option paramvalue="element"/><dsp:valueof param="element"/>
                            </dsp:oparam>
                            <dsp:oparam name="error">
                                 (Unable to find enumerated values)
                            </dsp:oparam>
                       </dsp:droplet>
                      </dsp:select>
                    </font>
                  </td>
                </tr>
                <tr>
                   <td>
                     <font face="Verdana,Geneva,Arial" size="-1">
                       Description:
                     </font>
                   </td>
                   <td>
                     <font face="Verdana,Geneva,Arial" size="-1">
                       <dsp:textarea 
                          bean="SongFormHandler.value.description" 
                          name="description" cols="40" rows="6" 
                          wrap="SOFT"/>
                     </font>
                   </td>
                 </tr>
                 <tr>
                   <td>
                   <dsp:input type="hidden" bean="SongFormHandler.createSuccessURL" value="success.jsp"/>
                   <input type="hidden" name="albumId" value="<dsp:valueof param='albumId'/>" />
                   <dsp:input type="submit" value="Add Song" bean="SongFormHandler.create"/>
                   <dsp:input type="submit" value="Cancel" bean="SongFormHandler.cancel"/>
                   </td>
                 </tr>
               </dsp:form>
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