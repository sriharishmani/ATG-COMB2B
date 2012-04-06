<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<% /* Requires input parameter: itemId (repositoryID of a playlist */ %>

<html>
<head>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  PlaylistDetails
  
  List the songs in a playlist.
  
  ------------------------------------------------------------->
<title>Dynamusic Playlist</title>
</head>
<body>
<dsp:droplet name="/atg/targeting/RepositoryLookup">
  <dsp:param bean="/atg/userprofiling/ProfileAdapterRepository" name="repository"/>
  <dsp:param name="itemDescriptor" value="playlist"/>
  <dsp:param name="id" param="itemId"/>
  <dsp:oparam name="output">
    
       <dsp:include page="common/header.jsp">
          <dsp:param name="pagename" param="element.name"/>
       </dsp:include>

       <table CELLPADDING=8 WIDTH="700" >
          <tr>
             <!-- Sidebar -->
             <td width="100" bgcolor="ghostwhite" valign="top">
                 <dsp:include page="common/sidebar.jsp"></dsp:include>
				     </td>

             <!-- Page Body -->
             <td VALIGN=TOP>
               <!-- *** Start page content *** -->
               <table CELLPADDING=8>
                <tr>
                  <td ALIGN=RIGHT>Playlist Name:</td>
                  <td> <font face="Verdana,Geneva,Arial" size="-1"><b>New Songs Playlist</b></font></td>
                </tr>
                <tr>
                  <td ALIGN=RIGHT>Description:</td>
                  <td><font face="Verdana,Geneva,Arial" size="-1">This playlist includes songs recently added to Dynamusic that match your music interests.  Enjoy!</font></td>
                </tr>
                <tr>
							    <td  ALIGN=RIGHT VALIGN=TOP>Songs:</td>
                  <td VALIGN=TOP ><font face="Verdana,Geneva,Arial" size="-1">
							 <dsp:droplet name="/atg/dynamo/droplet/ForEach">
							   <dsp:param name="array" param="element.songs"/>
							   <dsp:oparam name="output">
							    <b> <dsp:a href="song.jsp">
                         <dsp:param name="itemId" param="element.id"/>
                           <dsp:valueof param="element.title"/>
                       </dsp:a></b>

                        by <dsp:a href="artistDetails.jsp">
                         <dsp:param name="itemId" param="element.artist.id"/>
                            <dsp:valueof param="element.artist.name"/>
                        </dsp:a>

                        <br>
								
								
					 
		  </dsp:oparam>
		  <dsp:oparam name="empty">
		     No songs on this playlist yet.
		  </dsp:oparam>
		 </dsp:droplet>
                  </font>
                 </td>
                </tr>

   	      </table>
             </td>
          </tr>
       </table>

  </dsp:oparam>

</dsp:droplet>

</body>
</html>
</dsp:page>
