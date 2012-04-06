<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  UPDATE PROFILE
  
  Allows updating of an existing user profile
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Edit Profile</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Update Profile"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
            <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->

          <dsp:form action="updateProfile.jsp" method="post">
          
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

            <h3>Login:   
            <dsp:valueof bean="/atg/userprofiling/ProfileFormHandler.value.login"/>
            </h3>

            First name:<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.firstName" name="firstName" size="24" type="text"/><br>
          
            Last name:<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.lastName" name="lastName" size="24" type="text"/><br>
            <br>
            State:<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.homeAddress.state" name="state" size="2" type="text"/><br>
            <br>

            Your favorite genres:<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="pop"/>Pop<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="jazz"/>Jazz<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="classical"/>Classical<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="blues"/>Blues<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="country"/>Country<br>
            <br>
            Make your profile viewable by others?<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.shareProfile" name="shareProfile" type="radio" value="true"/>yes<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.shareProfile" name="shareProfile" type="radio" value="false"/>no<br>
            <br>
            Automatically add new songs to your New Songs playlist?<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.newSongsAutoUpdate" name="newSongsAutoUpdate" type="radio" value="true"/>yes<br>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.newSongsAutoUpdate" name="newSongsAutoUpdate" type="radio" value="false"/>no<br>
            <br>
            Personal info:<br>
            <dsp:textarea bean="/atg/userprofiling/ProfileFormHandler.value.info" name="info" rows="5" cols="40"/><br>
            <br>
          
            <!-- defines the URL to go to on success (relative to 'action')-->
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.updateSuccessURL" type="hidden" value="home.jsp"/>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.update" type="Submit" value="Update"/>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.cancelURL" type="hidden" value="home.jsp"/>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.cancel" type="Submit" value="Cancel"/>
          
          </dsp:form>
                        
          <!-- *** End real content *** -->
          
          </font>
        </td>         
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>
