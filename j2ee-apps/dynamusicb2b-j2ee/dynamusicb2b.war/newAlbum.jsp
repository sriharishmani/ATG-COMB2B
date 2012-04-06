<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/EnumForEach"/>
<dsp:importbean bean="/dynamusic/AlbumFormHandler"/>

<% /* input parameters: artistId (required) */ %>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  NEW ALBUM
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic New Album</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Add Album"/>
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
          <dsp:droplet name="/dynamusic/ArtistLookupDroplet">
            <dsp:param name="id" param="artistId"/>
            <dsp:oparam name="empty">
               Artist with ID <dsp:valueof param="artistId">NONE</dsp:valueof> not found.
            </dsp:oparam>
            <dsp:oparam name="output">
 
               <dsp:form action="newAlbum.jsp" method="post">
               
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

              <dsp:input bean="AlbumFormHandler.value.artists.repositoryIds"
                   type="hidden" 
                   paramvalue="artistId"/>
              
              <table cellpadding="10">
                <tr>
                  <td valign="middle">
                    <font face="Verdana,Geneva,Arial" size="-1">
                      Artist Name:
                    </font>
                  </td>
                  <td valign="middle">
                     <dsp:valueof param="element.name"/>
                  </td>
                </tr>               

                <tr>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                       Album Name:
                     </font>
                  </td>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">

                       <dsp:input bean="AlbumFormHandler.value.title" size="24" 
                                  type="text" required="<%=true%>"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                      Image Path:
                    </font>
                  </td>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                       <dsp:input bean="AlbumFormHandler.value.coverURL" size="24" 
                                  type="text"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                      Publication Date <i>(mm/dd/yyyy)</i>:
                    </font>
                  </td>
                  <td>
                    <font face="Verdana,Geneva,Arial" size="-1">
                      <dsp:input bean="AlbumFormHandler.value.date" 
                                 date="M/dd/yyyy" name="date" size="24" type="text"/>
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
                          bean="AlbumFormHandler.value.description" 
                          name="description" cols="40" rows="6" 
                          wrap="SOFT"/>
                     </font>
                   </td>
                 </tr>
                 <tr>
                   <td>
                   <dsp:input type="hidden" bean="AlbumFormHandler.createSuccessURL" value="success.jsp"/>
                   <input type="hidden" name="artistId" value="<dsp:valueof param='artistId'/>" />
                   <dsp:input type="submit" value="Add Album" bean="AlbumFormHandler.create"/>
                   <dsp:input type="submit" value="Cancel" bean="AlbumFormHandler.cancel"/>
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