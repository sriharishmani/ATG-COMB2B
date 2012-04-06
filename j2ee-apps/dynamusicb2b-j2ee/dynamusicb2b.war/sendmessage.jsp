<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/SendMessageHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<%-- requires userid parameter (user to send mail to) --%>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Message</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Send Message"/>
  </dsp:include>    
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
            <dsp:include page="common/sidebar.jsp"></dsp:include> 
						<br>
						<font face="Verdana,Geneva,Arial" 
                size="-1" color="steelblue"><b>
				    <a href="newArtist.jsp">Add Artist</a>  
            </b></font>     
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          <dsp:form action="sendmessage.jsp" method="post">
          
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
          
          
          <table>
             <tr>
                <td>Subject</td>
                <td><dsp:input type="text" bean="SendMessageHandler.subject" size="40"/></td>
             </tr>
             <tr>
                <td>Message</td>
                <td><dsp:textarea bean="SendMessageHandler.message" rows="10" cols="40"/></td>
             </tr>
             <tr>
                <td></td>
                <td><dsp:input type="submit" bean="SendMessageHandler.send" value="Send Message"/></td>
             </tr>
             <dsp:input type="hidden" bean="SendMessageHandler.touserid" paramvalue="userid" name="userid"/>
             <dsp:input type="hidden" bean="SendMessageHandler.fromuserid" beanvalue="Profile.id"/>
             <dsp:input type="hidden" bean="SendMessageHandler.successURL" value="success.jsp"/>
          </dsp:form>


          <!-- *** End content *** -->
          
          </font>
        </td>
    </table>
  </BODY>
</HTML>
</dsp:page>
