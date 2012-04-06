<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<HTML>
  <HEAD>
    <TITLE>Dynamusic Song Upload</TITLE>
  </HEAD>
  <BODY>

    <!-- (replace this entire table by dynamically including 
          common/header.jsp) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Upload Song"/>
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
          
                <dsp:droplet name="/atg/dynamo/droplet/Switch">
                  <dsp:param bean="Profile.transient" name="value"/>
                  <dsp:oparam name="false">

                  <dsp:form action="uploadsong.jsp" method="post">
                  
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
                  <td ALIGN=RIGHT>
                    Title
                  </td>
                  <td>
                    <dsp:input bean="/dynamusic/UploadSongHandler.value.title" name="title" size="24" type="text"/>
                  </td>
                </tr>
                <tr>
                  <td ALIGN=RIGHT>
                    Description
                  </td>
                  <td>
                    <dsp:input bean="/dynamusic/UploadSongHandler.value.description" name="description" size="24" type="text"/>
                  </td>
                </tr>
                <tr>
                  <td ALIGN=RIGHT>
                    Upload URL
                  </td>
                  <td>
                    <dsp:input bean="/dynamusic/UploadSongHandler.value.downloadURL" name="downloadURL" size="24" type="text"/>
                  </td>
                </tr>
                <tr>
                   <td ALIGN=RIGHT>                  
                    Genre
                   </td>
                   <td>
                    <dsp:select bean="/dynamusic/UploadSongHandler.value.songGenre"><br>
                        <dsp:option value="jazz"/>Jazz
                        <dsp:option value="classical"/>Classical
                        <dsp:option value="blues"/>Blues
                        <dsp:option value="country"/>Country
                        <dsp:option value="pop"/>Pop

                    </dsp:select>
                  </td>
               <tr>
                <tr>
                   <td>
                   </td>
                   <td>
                    <dsp:input bean="/dynamusic/UploadSongHandler.userid" type="hidden" beanvalue="Profile.repositoryId"/>
                    <!-- defines the URL to go to on success (relative to 'action')-->
                    <dsp:input bean="/dynamusic/UploadSongHandler.createSuccessURL" type="hidden" value="success.jsp"/>
                    <dsp:input bean="/dynamusic/UploadSongHandler.create" type="Submit" value="Save My Song"/>
                    </td>
                  </tr>
                </table>
                  </dsp:form>

                  </dsp:oparam>
                  <dsp:oparam name="true">
                    This feature is only available to registered users.  Please <a href="newProfile.jsp">Click here</a> to register. <p>
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
