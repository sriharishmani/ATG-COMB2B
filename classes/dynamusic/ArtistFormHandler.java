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




public class ArtistFormHandler extends RepositoryFormHandler {

    SongsManager mSM;
    
    // Property methods
    
    public SongsManager getSongsManager() {
        return mSM;
    }
    
    public void setSongsManager(SongsManager pSM) {
        mSM = pSM;
    }
    
    
    protected void preDeleteItem(DynamoHttpServletRequest pRequest, 
                         DynamoHttpServletResponse pResponse) 
                      throws javax.servlet.ServletException,
                              java.io.IOException {
     
       	if (isLoggingDebug())
  		logDebug("preDeleteItem called, item: " + getRepositoryItem());
  	        
        SongsManager sm = getSongsManager();
        String artistid = getRepositoryItem().getRepositoryId();
   
        if (sm != null) {
             try {
                sm.deleteAlbumsByArtist(artistid);                
             }
             catch (RepositoryException re) {
                if (isLoggingError())
                   logError("Cannot delete albums by artist", re);
                addFormException(new DropletException("Cannot delete albums by artist"));
             }
        }
        else {
           if (isLoggingWarning())
                logWarning("no songs manager set");
        } 	  	
    }
    
}