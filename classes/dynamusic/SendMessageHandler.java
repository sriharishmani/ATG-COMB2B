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

/* Developing ATG Applications */
/* Sample Form Handler: SendMessageHandler */

import atg.service.email.EmailSender;
import atg.service.email.EmailException;

import atg.droplet.DropletException;

import atg.repository.Repository;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryException;

import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;


public class SendMessageHandler extends atg.droplet.GenericFormHandler {

   String mFromUserid;
   String mToUserid;
   Repository mUserRepository;
   EmailSender mEmailSender;
   String mMessage;
   String mSubject;
   String mSuccessURL;
   String mErrorURL;
   
   
   public String getToUserid() { return mToUserid; }
   public void setToUserid(String pUserid) { mToUserid = pUserid; }

   public String getFromUserid() { return mFromUserid; }
   public void setFromUserid(String pUserid) { mFromUserid = pUserid; }
   
   public Repository getUserRepository() { return mUserRepository; }
   public void setUserRepository(Repository pRepository) { mUserRepository = pRepository; }
   
   public EmailSender getEmailSender() { return mEmailSender; }
   public void setEmailSender(EmailSender pEmailSender) { mEmailSender = pEmailSender; }

   public String getMessage() { return mMessage; }
   public void setMessage(String pMessage) { mMessage = pMessage; }

   public String getSubject() { return mSubject; }
   public void setSubject(String pSubject) { mSubject = pSubject; }

   public String getSuccessURL() { return mSuccessURL; }
   public void setSuccessURL(String pSuccessURL) { mSuccessURL = pSuccessURL; }

   public String getErrorURL() { return mErrorURL; }
   public void setErrorURL(String pErrorURL) { mErrorURL = pErrorURL; }
   
   /* handler for the send property */
   public boolean handleSend(DynamoHttpServletRequest pRequest,
                              DynamoHttpServletResponse pResponse) 
                              throws java.io.IOException, javax.servlet.ServletException {
                              
       if (isLoggingDebug()) 
           logDebug("send message handler called with from=" + getFromUserid() + ", to=" + getToUserid());
           
       RepositoryItem touser=null;
       EmailSender es = getEmailSender();
       
       if (es == null) 
           throw new DropletException("no email sender set");
       else {       
            try {
                touser = getUserRepository().getItem(getToUserid(),"user");
            }
            catch (RepositoryException e) {
                if (isLoggingError()) logError("error retrieving user's email address",e);
                addFormException(new DropletException("User has not supplied an email address"));
 	        if (getErrorURL() != null) {
 	              pResponse.sendLocalRedirect(getErrorURL(), pRequest);
	              return false;
                }
            }       
            
            if (touser == null) {
               throw new DropletException("invalid user id");
            }
               
     
            String toEmailAddr = (String)touser.getPropertyValue("email");
            String fromEmailAddr = "user" + getFromUserid() + "@dynamusic.com";
     
            String subject = getSubject();
            String message = getMessage();
     
     
            if (subject.equals("") && message.equals("")) {
                if (isLoggingDebug()) 
                    logDebug("subject and message both null");
                addFormException(new DropletException("Subject and message can't both be empty"));
      	        if (getErrorURL() != null) {
 	              pResponse.sendLocalRedirect(getErrorURL(), pRequest);
	              return false;
                }
                return true;
            }
            
            if (isLoggingDebug()) 
                logDebug("sending message from " + fromEmailAddr + " to " + toEmailAddr +
                	"with subject " + subject + " and body " + message);
                	
            try {
                es.sendEmailMessage(fromEmailAddr, toEmailAddr, subject, message);
            }
            catch (EmailException e) {
               if (isLoggingError())
                   logError(e);
               if (getErrorURL() != null) {
      	          pResponse.sendLocalRedirect(getErrorURL(), pRequest);
	              return false;
	         }
              throw new DropletException ("Email to " + toEmailAddr + " failed",e);
            }   
         }
         if (getSuccessURL() != null) {
       	     pResponse.sendLocalRedirect(getSuccessURL(), pRequest);
	     return false;
	 }

         return true;                  

   }
}