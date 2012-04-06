<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/dynamusic/QuizFormHandler"/>
<!-------------------------------------------------------------
  Dynamusic Site - Solutions
  
  QUIZ ANSWER
  
  Answer the user quiz.
  
  ------------------------------------------------------------->

<html>
  <head>
    <title>Dynamusic Quiz Answer</title>
  </head>
  <body>
    <dsp:include page="common/header.jsp">
      <dsp:param name="pagename" bean="QuizFormHandler.correctAnswer"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" color="darkgreen" size="+1">
            <dsp:droplet name="Switch">
              <dsp:param name="value" bean="QuizFormHandler.correctAnswer"/>
              <dsp:oparam name="true">
                You amaze us!  <dsp:valueof bean="QuizFormHandler.answer"/>
                is the correct answer! Woo-hoo! 
              </dsp:oparam>
              <dsp:oparam name="false">
                I'm sorry.  The correct answer is:
                <dsp:valueof bean="QuizFormHandler.answer"/>
              </dsp:oparam>
              <dsp:oparam name="default">
                I'm a little confused here...
              </dsp:oparam>
           </dsp:droplet>
          </font>
        </td>
      </tr>
    </table>        
  </body>
</html>


</dsp:page>
