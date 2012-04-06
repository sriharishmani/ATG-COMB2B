<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  Sidebar
  
  Page fragment displaying the sidebar, common to all pages.
  
  ------------------------------------------------------------->
          <font face="Verdana,Geneva,Arial" 
                size="-1" color="steelblue">
            <b>
              <dsp:a href="../storefront.jsp">Dynamusic Store
              <dsp:param name="navaction" value="jump"/></dsp:a><br><br>
              <a href="home.jsp">Home</a>
              &nbsp;<br>

              <a href="artists.jsp">Artists</a> <br>
              <a href="venues.jsp">Venues</a> <br>
              <a href="search.jsp">Search</a> <br>
              <dsp:droplet name="/atg/dynamo/droplet/Switch">
                <dsp:param bean="Profile.transient" name="value"/>
                <dsp:oparam name="true">
                    <br>
                    <a href="login.jsp">Log In</a> <br>
                </dsp:oparam>
                <dsp:oparam name="false">
                    <a href="updateProfile.jsp">Profile</a> <br>
                    <a href="playlists.jsp">Playlists</a> <br>
                    <a href="uploadsong.jsp">Upload Song</a><br>
                    <br>
                    <a href="logout.jsp">Log Out</a> <br>
                </dsp:oparam>
              </dsp:droplet>
            </b>
          </font>
 
 </dsp:page>

