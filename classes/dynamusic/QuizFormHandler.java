/*<ATGCOPYRIGHT>
 * Copyright (C) 1997-2003 Art Technology Group, Inc.
 * All Rights Reserved.  No use, copying or distribution ofthis
 * work may be made except in accordance with a valid license
 * agreement from Art Technology Group.  This notice must be
 * included on all copies, modifications and derivatives of this
 * work.
 *
 * Art Technology Group (ATG) MAKES NO REPRESENTATIONS OR WARRANTIES
 * ABOUT THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. ATG SHALL NOT BE
 * LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
 * MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
 *
 * "Dynamo" is a trademark of Art Technology Group, Inc.
 </ATGCOPYRIGHT>*/

package dynamusic;

/*
 * QuizFormHandler
 * ------------------------------------------------------------
 *                                                Pierre Billon
 *                                                  19 May 2003
 */
 
import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

/**
 * @author billon
 * 
 * This form handler is configured with a question, stored in
 * the question property, and an answer, stored, amazingly 
 * enough, in the answer property.
 * 
 * The user provides a guess in a jsp form, stored in the
 * userAnswer property.  The form's submit button calls the
 * handleValidate method, which checks whether the user's
 * guess corresponds to the configured answer.  If so, the
 * correctAnswer property is set to true; if not, it is set
 * to false.
 * 
 * If there are form errors (that is, if getFormError() 
 * returns true), the handleValidate method redirects the
 * user to the page named in the validateErrorURL property
 * (if it is set).  If there are no errors, it redirects the
 * user to the page named in validateSuccessURL (if it is set).
 * 
 * This is not rocket science.
 *
 * Properties:
 *   question      (String)   r/w
 *   answer        (String)   r/w
 *   userAnswer    (String)   r/w
 *   correctAnswer (boolean)  r/w
 * 
 *   validateSuccessURL  (String)   r/w
 *   validateErrorURL    (String)   r/w
 * 
 * Handlers:
 * 
 *   validate
 *   reset
 * 
 */
public class QuizFormHandler extends GenericFormHandler {

  // ** Member variables **
  
  private String mQuestion;
  private String mAnswer;
  private String mUserAnswer;
  private boolean mCorrectAnswer;
  private String mValidateSuccessURL;
  private String mValidateErrorURL;

  // ** Property Access Methods **
  
  // -- question property -- 
  /**
   * Returns today's Quiz question
   * @return String
   */
  public String getQuestion() {
    return mQuestion;
  }

  /**
   * Sets the question to today's Quiz.
   * @param question The Quiz's question
   */
  public void setQuestion(String question) {
    mQuestion = question;
  }

  // -- answer property -- 
  /**
   * Returns the answer to today's Quiz
   * @return String
   */
  public String getAnswer() {
    return mAnswer;
  }

  /**
   * Sets the answer to today's Quiz.
   * @param answer The Quiz's answer
   */
  public void setAnswer(String answer) {
    mAnswer = answer;
  }
  
  // -- userAnswer property -- 
  /**
   * Returns the user's answer
   * @return String
   */
  public String getUserAnswer() {
    return mUserAnswer;
  }

  /**
   * Sets the answer provided by the user in the form
   * @param userAnswer The answer provided by the form submission
   */
  public void setUserAnswer(String userAnswer) {
    mUserAnswer = userAnswer;
  }

  // -- correctAnswer property -- 
  /**
   * Returns a flag indicating if question was answered correctly
   * @return boolean
   */
  public boolean isCorrectAnswer() {
    return mCorrectAnswer;
  }

  /**
   * Set to true if the answer was correct.
   * @param correctAnswer The correctness flag
   */
  public void setCorrectAnswer(boolean correctAnswer) {
    mCorrectAnswer = correctAnswer;
  }

  // ------ Success and Error redirection properties ------
  /**
   * Returns address of page to redirect to upon success
   * @return String
   */
  public String getValidateSuccessURL() {
    return mValidateSuccessURL;
  }

  /**
   * Sets the page the handleValidate() method redirects to 
   * when validation is successful.
   * @param validateSuccessURL The redirection page name
   */
  public void setValidateSuccessURL(String validateSuccessURL) {
    mValidateSuccessURL = validateSuccessURL;
  }
  
  /**
   * Returns address of page to redirect to if error occurs
   * @return String
   */
  public String getValidateErrorURL() {
    return mValidateErrorURL;
  }

  /**
   * Sets the page the handleValidate() method redirects to 
   * in case of error.
   * @param validateErrorURL The redirection page name 
   */
  public void setValidateErrorURL(String validateErrorURL) {
    mValidateErrorURL = validateErrorURL;
  }


  // **** Form Handlers ****
  /**
   * Handles the validation of the Quiz question.  If the user's
   * answer (stored in userAnswer) is the same as the configured
   * answer (stored in answer), then correctAnswer is set to true;
   * otherwise, it is set to false.  Redirection to the success
   * or error pages is done based on the presence of form errors,
   * not on whether the question was answered correctly.
   */

  public boolean handleValidate (DynamoHttpServletRequest request,
                                 DynamoHttpServletResponse response)
      throws java.io.IOException
  {
    // If any form errors were generated, abort...
    if (getFormError()) {
      if (getValidateErrorURL() != null) {
        response.sendLocalRedirect(getValidateErrorURL(),request);
        return false;
      }
      return true;
    }
    
    // Otherwise, redirect to form submission success page,
    // setting answer flag to reflect correctness of answer
    if (getUserAnswer().equalsIgnoreCase(getAnswer()))
      setCorrectAnswer(true);
    else
      setCorrectAnswer(false);
    
    if (getValidateSuccessURL() != null) {
      response.sendLocalRedirect(getValidateSuccessURL(),request);
      return false;
    }
    return true;
  }
  
  
  /**
   * Resets the form (sets the userAnswer property to null). 
   */
  public boolean handleCancel (DynamoHttpServletRequest request,
                                 DynamoHttpServletResponse response)
      throws java.io.IOException
  {
    setUserAnswer(null);
    return true;
  }


}
