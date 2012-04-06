<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/QuizFormHandler"/>
<!-------------------------------------------------------------
  Dynamusic Site - Solutions
  
  QUIZ
  
  Deliver a user quiz.
  
  ------------------------------------------------------------->

<html>
  <head>
    <title>Dynamusic Quiz</title>
  </head>
  <body>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Quiz"/>
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

          <!-- Default form Error Handling support -->
          <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
            <dsp:oparam name="output">
              <li><dsp:valueof param="message"/></li>
            </dsp:oparam>
            <dsp:oparam name="outputStart">
              <font color="red">I encountered problems processing this form:
              <ul>
            </dsp:oparam>
            <dsp:oparam name="outputEnd">
              </ul></font>
            </dsp:oparam>
          </dsp:droplet>
          
          <!-- The Form itself, in all its glory -->
          <dsp:form action="quiz.jsp" method="post">
            <font color="darkgreen" size="+2">
              <dsp:valueof bean="QuizFormHandler.question"/>
            </font>
            <p>
            Answer: <dsp:input type="text" bean="QuizFormHandler.userAnswer"/>
            <p>
              
            <%-- Submission --%>
            <dsp:input type="submit" value="Am I right?" bean="QuizFormHandler.validate"/>
            &nbsp;
            <dsp:input bean="/dynamusic/QuizFormHandler.cancel" type="Submit" value="Cancel"/>
             
            <%-- Redirection --%>
            <dsp:input type="hidden" bean="QuizFormHandler.validateSuccessURL" 
                       value="quizAnswer.jsp"/>
          </dsp:form>

          <!-- *** End real content *** -->
          </font>
        </td>
      </tr>
    </table>
</body>
</html>


</dsp:page>
