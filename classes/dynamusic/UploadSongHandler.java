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

import atg.droplet.DropletException;

import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;

import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;


public class UploadSongHandler extends RepositoryFormHandler {

    SongsManager mSM;
    String mUserid;
        
    public SongsManager getSongsManager() { return mSM; }
    public void setSongsManager(SongsManager pSM) { mSM = pSM; }

    public String getUserid() { return mUserid; }
    public void setUserid(String pUserid) { mUserid = pUserid; }
    
                             
    protected void postCreateItem(DynamoHttpServletRequest pRequest, 
                         DynamoHttpServletResponse pResponse) 
                      throws javax.servlet.ServletException,
                              java.io.IOException {
     
       	if (isLoggingDebug())
  		logDebug("postCreateItem called, item created: " + getRepositoryItem());
  	        

        SongsManager sm = getSongsManager();
        String userid = getUserid();
        String artistid = null;
        String songid = getRepositoryItem().getRepositoryId();
   
        if (sm != null) {
             try {
                artistid = sm.createArtistFromUser(userid);                
                sm.addArtistToSong(songid,artistid);
             }
             catch (RepositoryException re) {
                if (isLoggingError())
                   logError("Cannot add song to artist", re);
                addFormException(new DropletException("unable to add artist for song"));
                try {
                   sm.getTransactionManager().setRollbackOnly();
                }
                catch(Exception e) {
                    if (isLoggingError())
                       logError("Adding song failed but rollback failed too", e);
                }
             }
        }
        else {
           if (isLoggingWarning())
                logWarning("no songs manager set");
        }
  	  	
    }
}
