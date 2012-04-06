<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic User Preferences</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.jsp) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="User Preferences"/>
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
          
            <table width="560">
              <tr>
                <td>
                <h3><dsp:valueof bean="Profile.firstName"/>'s Favorite Genres:</h3>
                <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                  <dsp:param bean="/atg/userprofiling/Profile.prefGenres" name="array"/>
                  <dsp:oparam name="outputStart">
                    <ul>
                  </dsp:oparam>
                  <dsp:oparam name="outputEnd">
                    </ul>
                  </dsp:oparam>
                  <dsp:oparam name="output">
                    <li><dsp:valueof param="element"/>
                
                  </dsp:oparam>
                  <dsp:oparam name="empty">
                    You have no preferences specified.
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

