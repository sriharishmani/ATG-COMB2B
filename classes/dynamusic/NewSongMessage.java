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

/**
This is a simple JavaBean (also called a MessageBean) that can be used
to carry information about an added song into the Scenario Manager.

It carries three simple properties:

1) songId - The id of the newly created song
2) songGenre - The musical genre of the new song (this may be useful
for a scenario to use as criteria, for example, for which playlists to add the song to)
3) title - The title of the new song
*/
public class NewSongMessage implements java.io.Serializable
{
   private String mSongId;
   private String mSongGenre;	
   private String mTitle;

   public NewSongMessage()
   {
   	
   }
   
   public NewSongMessage(String pSongId, String pSongGenre, String pTitle)
   {
      mSongId = pSongId;
      mSongGenre = pSongGenre;
      mTitle = pTitle;
   }
   
   public String getSongId()
   { return mSongId; }
   
   public void setSongId(String pSongId)
   {  mSongId = pSongId; }
   
   public String getSongGenre()
   { return mSongGenre; }
   
   public void setSongGenre(String pSongGenre)
   {  mSongGenre = pSongGenre; }
   
   public String getTitle()
   { return mTitle; }
   
   public void setTitle(String pTitle)
   {  mTitle = pTitle; }       	
}