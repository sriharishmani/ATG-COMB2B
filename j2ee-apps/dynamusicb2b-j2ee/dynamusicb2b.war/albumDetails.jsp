<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  ALBUM DETAILS
  
  Description of an album and list of songs.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Album</TITLE>
  </HEAD>
  <BODY>

  <dsp:droplet name="/dynamusic/AlbumLookupDroplet">
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="output">

    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.title"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
          <dsp:include page="common/sidebar.jsp"></dsp:include>
          <hr>
          <dsp:a href="newSong.jsp">
             <dsp:param name="albumId" param="itemId"/>
             <font face="Verdana,Geneva,Arial" size="-1"><b>Add Song</b></font>
          </dsp:a>
        </td>


<!-- Page Body -->

        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
            
            <table cellpadding="10">
              <tr>
                <td valign="top"> <img src="<dsp:valueof param='element.coverURL'/>"></td>
                <td valign="top">
                  <font face="Geneva,Arial" size="-1">
                     <dsp:valueof param="element.description"/>
                  
		  <b><p>Published: <dsp:valueof param="element.date" date="MMM dd,yyyy"/><b><p>
		  Genre: <dsp:valueof param="element.genre"/>
                  </font>
                </td>
              </tr>
            </table>
<!-- Chapter 1 Lab Impact: This ForEach was added to accomodate the new artists property -->
Artists:<br>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param name="array" param="element.artists"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
              <dsp:oparam name="output">
 							  
                <li>
                   <dsp:a href="artistDetails.jsp">
	                    <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.name"/>
                   </dsp:a>
            
              </dsp:oparam>
              <dsp:oparam name="empty">
                No songs listed for this album.
              </dsp:oparam>
            </dsp:droplet>

Songs:<br>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param name="array" param="element.songList"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
              <dsp:oparam name="output">
 							  
                <li>
                   <dsp:a href="song.jsp">
	                    <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.title"/>
                   </dsp:a>
            
              </dsp:oparam>
              <dsp:oparam name="empty">
                No songs listed for this album.
              </dsp:oparam>
            </dsp:droplet>
            
          </font>
        </td>
     </tr>
    </table>

    </dsp:oparam>
    <dsp:oparam name="empty">
        No album with ID=<dsp:valueof param="itemId">NONE</dsp:valueof> was found, sorry.
    </dsp:oparam>
    </dsp:droplet>

  </BODY>
</HTML>
</dsp:page>