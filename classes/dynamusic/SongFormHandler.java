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


public class SongFormHandler extends RepositoryFormHandler {

    private SongsManager mSM;
    private String mAlbumId;
    private String mArtistId;
    
    // Property methods
    
    public SongsManager getSongsManager() {
        return mSM;
    }
    
    public void setSongsManager(SongsManager pSM) {
        mSM = pSM;
    }
    
    public String getAlbumId() {
        return mAlbumId;
    }
    
    public void setAlbumId(String pAlbumId) {
        mAlbumId = pAlbumId;
    }

    public String getArtistId() {
        return mArtistId;
    }
    
    public void setArtistId(String pArtistId) {
        mArtistId = pArtistId;
    }


    protected void postCreateItem(DynamoHttpServletRequest pRequest, 
                         DynamoHttpServletResponse pResponse) 
                      throws javax.servlet.ServletException,
                              java.io.IOException {
     
       	if (isLoggingDebug())
  		logDebug("postCreateItem called, item created: " + getRepositoryItem());
  	        

        SongsManager sm = getSongsManager();
    
        try {
           sm.addSongToAlbum(getRepositoryId(),getAlbumId());
           sm.addArtistToSong(getRepositoryId(),getArtistId());
           sm.fireNewSongMessage(getRepositoryItem());
        }
        catch (RepositoryException e) {
           if (isLoggingError())
                   logError("Cannot add song to album", e);
                addFormException(new DropletException("Cannot add song to album"));

        }
   } 
}