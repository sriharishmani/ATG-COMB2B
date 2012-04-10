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

import java.util.Collection;

import javax.transaction.TransactionManager;

import atg.repository.Repository;
import atg.repository.MutableRepository;
import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryException;


public class PlaylistManager extends atg.nucleus.GenericService {

    private Repository mUserRepository = null;
    private TransactionManager mTransactionManager = null;
    private Repository mSongsRepository = null;
    
    //---------------------------------------------------------//
    // Property getters and setters                            //
    //---------------------------------------------------------//
        
    public void setUserRepository(Repository pRepository) {
        mUserRepository = pRepository;
    }
    
    public Repository getUserRepository() {
        return mUserRepository;
    }
    
    public void setSongsRepository(Repository pRepository) {
        mSongsRepository = pRepository;
    }
    
    public Repository getSongsRepository() {
        return mSongsRepository;
    }
    
    public TransactionManager getTransactionManager() {
        return mTransactionManager;
    }
    
    public void setTransactionManager(TransactionManager pTransactionManager) {
        mTransactionManager = pTransactionManager;
    }        


    //----------------------------------------------------------------
    // Utility methods
    //----------------------------------------------------------------
    
    
    
    public void addPlaylistToUser(String pPlaylistId, String pUserId) throws  RepositoryException {
    
    /* TBD: transactions here */
    
            if (isLoggingDebug())
  		logDebug("adding playlist " + pPlaylistId + " to user " + pUserId);  	

  	    MutableRepository repository = (MutableRepository) getUserRepository();
  	    RepositoryItem playlist = repository.getItem(pPlaylistId, "playlist");
  	    MutableRepositoryItem user = repository.getItemForUpdate(pUserId,"user");
  	    
  	    Collection playlist_set = (Collection)user.getPropertyValue("playlists");
  	    try {  	    
  	         playlist_set.add(playlist);
  	    }
  	    catch (Exception e) {
  	       if (isLoggingError())
  	           logError(e);
  	       throw new RepositoryException("Unable to add playlist to user", e);
  	    }
  	    user.setPropertyValue("playlists", playlist_set);
  	    repository.updateItem(user);
  	
    }

    public void addSongToPlaylist(String pPlaylistId, String pSongId) throws  RepositoryException 
    {
  	    MutableRepository userRep = (MutableRepository) getUserRepository();
  	    Repository songsRep = getSongsRepository();
  	    
            MutableRepositoryItem playlist = userRep.getItemForUpdate(pPlaylistId, "playlist");
            RepositoryItem song = songsRep.getItem(pSongId, "song");
            
            // TBD: error checking on valid ids
            
            Collection songlist = (Collection)playlist.getPropertyValue("songs");
            try {
                 songlist.add(song);
            }
            catch (Exception e) {
                if (isLoggingError())
                    logError("Cannot add song to playlist", e);
            }
            userRep.updateItem(playlist);
            
    }
}
