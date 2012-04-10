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

import atg.repository.Repository;

/**
This class will be used to carry configuration information needed by the custom 
scenario action NewSongTestAction.  

This is a very simple JavaBean which will be established as a globally scoped
Nucleus component.  It will be registered as the 
action-configuration component in scenarioManager.xml.

*/
public class NewItemAddToProfileActionConfig 
{

   public NewItemAddToProfileActionConfig()
   {
   	
   }
   
   //Property: repository
   Repository mRepository;
   
   public Repository getRepository()
   { return mRepository; }
   
   public void setRepository(Repository pRepository)
   {  mRepository = pRepository; }
 
    //Property: itemDescriptorName
   String mItemDescriptorName;
   
   public String getItemDescriptorName()
   { return mItemDescriptorName; }
   
   public void setItemDescriptorName(String pItemDescriptorName)
   {  mItemDescriptorName = pItemDescriptorName; }
 
    //Property: appendPropertyInProfile
   String mAppendPropertyInProfile;
   
   public String getAppendPropertyInProfile()
   { return mAppendPropertyInProfile; }
   
   public void setAppendPropertyInProfile(String pAppendPropertyInProfile)
   {  mAppendPropertyInProfile = pAppendPropertyInProfile; }

 
}