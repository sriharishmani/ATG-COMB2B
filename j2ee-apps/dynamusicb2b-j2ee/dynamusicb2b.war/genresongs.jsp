<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Songs</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.jsp) -->
    <dsp:include page="/common/header.jsp">
       <dsp:param name="pagename" value="Songs by Genre"/>
    </dsp:include>

    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
            <dsp:include page="/common/sidebar.jsp"></dsp:include>        
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          
            <table width="560">
              <tr>
                <td>
                <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                  <dsp:param bean="Profile.prefGenres" name="array"/>

                  <dsp:oparam name="output">
                       <dsp:setvalue param="prefgenre" paramvalue="element"/>
                      <h3><dsp:valueof param="prefgenre"/> songs: </h3><ul>
                      <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
                        <dsp:param name="queryRQL" value="genre = :prefgenre"/>
                        <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
                        <dsp:param name="itemDescriptor" value="song"/>
                        <dsp:param name="howMany" value="4"/>
                        <dsp:oparam name="output">
                          <li><dsp:a href="/song.jsp">
                                <dsp:param name="itemId" param="element.id"/>
                                 <dsp:valueof param="element.title"/>
 				(by <dsp:valueof param="element.artist.name"/>)
                              </dsp:a>
                      
                        </dsp:oparam>
                        <dsp:oparam name="empty">
                          No songs match this genre.
                        </dsp:oparam>
                      </dsp:droplet>
                      </ul>
                  </dsp:oparam>
                  <dsp:oparam name="empty">
                    You have no genres specified.
                  </dsp:oparam>
                </dsp:droplet>

                </td>
              </tr>
            </table>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>


