/*
 * Art Technology Group (ATG) MAKES NO REPRESENTATIONS OR WARRANTIES
 * ABOUT THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. ATG SHALL NOT BE
 * LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
 * MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
 *
*/
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

import atg.process.ProcessExecutionContext;
import atg.process.ProcessException;
import atg.repository.Repository;

import java.util.Collection;
import java.util.Map;
import java.util.StringTokenizer;

// DAS classes
import atg.beans.DynamicBeans;
import atg.beans.PropertyNotFoundException;
import atg.repository.RepositoryItem;

/**
  This class is a custom scenario action. 
*/
public class NewItemAddToProfile extends atg.process.action.ActionImpl {

  private NewItemAddToProfileActionConfig mConfig;

  public void initialize(Map pParameters) throws ProcessException
  {
     storeRequiredParameter(pParameters, "newSongsPlaylistLimit",Integer.class);
  }

  public void configure(Object pConfig)
  {
     mConfig = (NewItemAddToProfileActionConfig)pConfig;
  }
  
  public void executeAction(ProcessExecutionContext pContext)
         throws ProcessException
  { 

     //1: retrieve action param
     int newSongsPlaylistLimit = ((Integer)getParameterValue("newSongsPlaylistLimit", pContext)).intValue();
     System.out.println("newSongsPlaylistLimit: " + newSongsPlaylistLimit);

     //2: get a handle to the profile (note this is to be used for a global event,
     //		but with an *individual* action execution policy)
    	RepositoryItem profile = null;
    	profile = pContext.getSubject();

    try {
      //Just testing here:
      String theName = (String)DynamicBeans.getPropertyValue(profile, "firstName");
      System.out.println("---------->>>profile.firstName is: " + theName);

     //3: retrieve id, title, and genre from the new song item -- note hard-coding
     //		here is to accommodate the non-generic model of the event we're
     //		using.  Would be nice to make that event generic as well...)
     NewSongMessage theMessage = (NewSongMessage)pContext.getMessage();
     String theId = theMessage.getSongId();
     System.out.println("New Song id: " + theMessage.getSongId() + ".");   
     System.out.println("New Song Title: " + theMessage.getTitle() + ".");   
     System.out.println("New Song Genre: " + theMessage.getSongGenre() + ".");   



/* Logic for making next part generic:
	We make this custom action able to follow on the heels of a "new item" type 
	of event.  This action will append the new item referenced by the event to
	some property of the profile.  Note that if filtering on *which* profile(s)
	get the new item appended can be done in the scenario, using
	people elements configured to check certain aspects of the profile.  Thus we
	don't need to do any filtering in the code of this custom action -- we assume
	the scenario will govern which profiles it is executed on.
	We make this action generic by having the following configurable properties:
		- String repositoryName (repository name of the new item referenced in the event)
		- String itemDescriptorName (item type of new item)
		- String appendPropertyInProfile (property which is some collection type, and
		must be a collection of references to repository items, whose type
		is described by the first two properties.  This property can be dot-
		delimited, in which case it is parsed and all values except the last
		are taken to be reference properties from the profile, linking ultimately
		to the multi-reference property to append to)
*/
     //4: retrieve the profile's AppendPropertyInProfile 
     
	// A) get reference to configured repository
     Repository theRepository = mConfig.getRepository();
     System.out.println("Configured repository name: " + theRepository.getRepositoryName());

	// B) get reference to configured repository
     RepositoryItem theItem = null;
     theItem = (RepositoryItem)theRepository.getItem(theId,mConfig.getItemDescriptorName());
     System.out.println("New Item, retrieved from repository, is: " + theItem);

	// C) read in the multi-property (appendPropertyInProfile) and parse out dot-delimited values
		StringTokenizer st = new StringTokenizer(mConfig.getAppendPropertyInProfile(),".");
		System.out.println("the string has " + st.countTokens() + " words.");
		
		//two cases: 1 token vs. more than 1
		//if 1, then just populate theItems from profile,nextToken
		//if more than 1, then do a loop.  If it's the first iteration,
		//	repositoryitem ri = profile,nextToken
		//then, except for *last* iteration, the pattern will be
		//	repositoryitem ri = nextToken[1],nextToken[2]
		//the last iteration will populate theItems from nextToken[2],nextToken[3]
		int numWords = st.countTokens();
		if(numWords == 0) System.out.println("error:--->>>AppendPropertyInProfile not populated");
		String [] theWords = new String[numWords];
     		RepositoryItem [] ri = new RepositoryItem[numWords-1];	
		int i=0;
		Collection theItems = null;
		while(st.hasMoreTokens()) {
			theWords[i]=st.nextToken();
			i++;
			}
		
		if(numWords == 1) {
     			theItems = (Collection)DynamicBeans.getPropertyValue(profile, theWords[0]);
     		} else {
		    for(i=0;i<numWords-1;i++) {
			if(i==0) {
				ri[0] = (RepositoryItem)DynamicBeans.getPropertyValue(profile,theWords[0]);
			} else {
			ri[i] = (RepositoryItem)DynamicBeans.getPropertyValue(ri[i-1],theWords[i]);
			}
     		    }
     		    theItems = (Collection)DynamicBeans.getPropertyValue(ri[numWords-2], theWords[numWords-1]);
     		}
     		
     System.out.println("current items is/are: " + theItems);

	// D) load the new item to the collection (if limit is not exceeded)
        try {
             if(theItems.size() < newSongsPlaylistLimit) {
             	theItems.add(theItem);
             	}
            	System.out.println("theItems is now: " + theItems);
                DynamicBeans.setPropertyValue(ri[numWords-2], theWords[numWords-1],theItems);
            }
            catch (Exception e) {
                    System.out.println("Cannot add song to playlist" + e);
            }
            	

    }
    catch(PropertyNotFoundException pnfe) {
      throw new ProcessException(pnfe);
    }
            catch (atg.repository.RepositoryException e) {
                   System.out.println("Trouble adding song to playlist" + e);
            }
     
     
   }
}


