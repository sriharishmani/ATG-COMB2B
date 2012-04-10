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


public class PlaylistFormHandler extends RepositoryFormHandler {

    private PlaylistManager mPM=null;
    private String mUserId=null;
    private String mAddSongSuccessURL = null;
    private String mAddSongErrorURL = null;
    private String mSongId = null;
    
    public PlaylistManager getPlaylistManager() { return mPM; }
    public void setPlaylistManager(PlaylistManager pPM) { mPM = pPM; }

    public String getUserId() { return mUserId; }
    public void setUserId(String pUserId) { mUserId = pUserId; }
                             
    public String getAddSongSuccessURL() { return mAddSongSuccessURL; }
    public void setAddSongSuccessURL(String pAddSongSuccessURL) { mAddSongSuccessURL = pAddSongSuccessURL; }
                             
    public String getAddSongErrorURL() { return mAddSongErrorURL; }
    public void setAddSongErrorURL(String pAddSongErrorURL) { mAddSongErrorURL = pAddSongErrorURL; }
    
    public String getSongId() { return mSongId; }
    public void setSongId(String pSongId) { mSongId = pSongId; }                         
    
    protected void postCreateItem(DynamoHttpServletRequest pRequest, 
                         DynamoHttpServletResponse pResponse) 
                      throws javax.servlet.ServletException,
                              java.io.IOException {
     
       	if (isLoggingDebug())
  		logDebug("postCreateItem called, item created: " + getRepositoryItem());
  	        
        PlaylistManager pm = getPlaylistManager();
        
        if (pm != null) {
             try {
                pm.addPlaylistToUser(getRepositoryId(),getUserId());
             }
             catch (RepositoryException re) {
                if (isLoggingError())
                   logError("Cannot add playlist to user", re);
                try {
                   pm.getTransactionManager().setRollbackOnly();
                }
                catch(Exception e) {
                    if (isLoggingError())
                       logError("Adding playlist failed but rollback failed too", e);
                }
             }
        }
        else {
           if (isLoggingWarning())
                logWarning("no playlist manager set");
        }
    }
    
    public boolean handleAddSong (DynamoHttpServletRequest request,
                                 DynamoHttpServletResponse response)
      throws java.io.IOException
    {
        if (isLoggingDebug())
           logDebug("handleAddSong called");
        
        PlaylistManager pm = getPlaylistManager();
        
        try {
           pm.addSongToPlaylist(getRepositoryId(),getSongId());
        }
        catch (RepositoryException re) {
           if (isLoggingError())
              logError(re);
           addFormException(new DropletException("Cannot add song to playlist",re));
        }

        if (getFormError()) {
           if (isLoggingDebug()) logDebug("add song was un-successful");
           if (getAddSongErrorURL() != null) {
                if (isLoggingDebug()) logDebug("redirecting to " + getAddSongErrorURL());        
                response.sendLocalRedirect(getAddSongErrorURL(),request);
                return false;
           }
           else return true;
        }
        if (isLoggingDebug()) logDebug("add song was successful");
        if (getAddSongSuccessURL() != null) {
            if (isLoggingDebug()) logDebug("redirecting to " + getAddSongSuccessURL());        
            response.sendLocalRedirect(getAddSongSuccessURL(), request);
            return false;
        }    
        return true;
        
    }

}
