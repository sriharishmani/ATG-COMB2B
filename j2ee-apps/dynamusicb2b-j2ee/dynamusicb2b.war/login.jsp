<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  LOGIN
  
  Allow user to log out.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Login</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="login"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar placeholder -->
        <td width="100"></td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          
            <p><i> Please remind us who you are... </i><p>

            <dsp:form action="login.jsp" method="post">
            
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
            
              Login name: 
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.login" name="login" size="24" type="text"/><br>
            
              Password:
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.password" name="password" size="24" type="password"/><br>
            
              <!-- defines the URL to go to on success (relative to 'action')-->
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.loginSuccessURL" type="hidden" value="storefront.jsp"/>
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.login" type="Submit" value="Login"/>
            
            </dsp:form>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
    </table>
  </BODY>
</HTML>
</dsp:page>