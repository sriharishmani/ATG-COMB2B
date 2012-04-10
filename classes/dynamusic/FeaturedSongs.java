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

/* -------------------------------------------
 * FeaturedSongs
 *
 * Sample class for Dynamusic exercises.
 * 
 * Developing ATG Applications, Part I
 *
 * Author: Diana Carroll
 * Last modified: May 29, 2003
 *--------------------------------------------
 */
 

public class FeaturedSongs extends atg.nucleus.GenericService {

        //---------------------------------------------
	// Member variables
	private String[] mSongs;
	
	//---------------------------------------------
	// Property methods

	public String[] getSongs () {
	        if (isLoggingDebug()) {
	            logDebug("getSongs called, returning " + mSongs);
	        }
		return mSongs;
	}
	
	public void setSongs(String[] pSongs) {
	        if (isLoggingDebug()) {
	            logDebug("setSongs called with " + pSongs);
	        }
		mSongs = pSongs;
	}

        //------------------------------------------------------	
	// Constructors
	
	public FeaturedSongs () {
                if (isLoggingDebug()) {
	            logDebug("FeaturedSongs constructor called");
	        }
	}

}
