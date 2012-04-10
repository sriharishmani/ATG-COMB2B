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

import javax.jms.JMSException;
import javax.jms.ObjectMessage;

import atg.dms.patchbay.MessageSource;
import atg.dms.patchbay.MessageSourceContext;

/**

This component fires a NewSongMessage event using JMS.

Note that since it makes use of DMS and PatchBay it does not have any knowledge
of where the message is being sent.  See the dynamoMessagingSystem.xml file
for the destination of these messages (ultimately they will go to the ScenarioManager
component).
*/
public class SongMessageSource extends atg.nucleus.GenericService implements MessageSource 
{
    private MessageSourceContext mContext;
    private boolean mStarted = false;	
    
    // These methods implement the MessageSource interface
    public void setMessageSourceContext (MessageSourceContext pContext)
    { mContext = pContext; }
    public void startMessageSource () 
    { mStarted = true; }
    public void stopMessageSource () 
    { mStarted = false; }    
    
    // This method will send a message
    public void fireMessage(String pSongId, String pSongGenre, String pTitle)
        throws JMSException
    {
        if (mStarted) {
           ObjectMessage msg = mContext.createObjectMessage ();
           msg.setJMSType ("NewSongMessage");
           NewSongMessage nsm = new NewSongMessage();
           nsm.setSongId(pSongId);
           nsm.setSongGenre(pSongGenre);
           nsm.setTitle(pTitle);
           msg.setObject(nsm);
    	   if (isLoggingDebug()) 
    	       logDebug("SongMessageSource...sending message: " + msg);           
           mContext.sendMessage (msg);
        }
        else {
           if (isLoggingDebug())
               logDebug("fire message called but message source not yet started");
        }
    }    	
}