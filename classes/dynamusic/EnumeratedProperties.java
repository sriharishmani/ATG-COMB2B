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
import atg.repository.RepositoryItemDescriptor;
import atg.repository.RepositoryPropertyDescriptor;
import atg.repository.RepositoryException;
import atg.adapter.gsa.*;


public class EnumeratedProperties {


    public static String[] getEnumeratedProperties(Repository pRepository, 
    	String pItemDescriptorName, String pPropertyName) throws RepositoryException {
     

        try {
   
           //Get a GSAItemDescriptor object for the item type:
           GSAItemDescriptor gid = null;
        
            if (pItemDescriptorName!= null) {
            	RepositoryItemDescriptor rid = pRepository.getItemDescriptor(pItemDescriptorName);
            	gid = (GSAItemDescriptor) rid;
            }
            
            //Get an EnumPropertyDescriptor object for the property:
            	EnumPropertyDescriptor epd = null;
            if ((pPropertyName != null) && (gid != null)) {
                RepositoryPropertyDescriptor rpd = gid.getRepositoryPropertyDescriptor(pPropertyName);
                if (java.lang.Class.forName("atg.adapter.gsa.GSAPropertyDescriptor").isInstance(rpd) == false) {
                    throw new RepositoryException("not a GSA property");
                }
            	GSAPropertyDescriptor gpd = gid.getGSAPropertyDescriptor(pPropertyName);
            	epd = (EnumPropertyDescriptor)gpd;
            }
       
            if (epd != null) {
            	String[] enumValues = epd.getEnumeratedValues();
            	return enumValues;
            }
            else
               throw new RepositoryException("no enumerated values found");
        }
        catch (RepositoryException e) {
               System.out.println("==EnumeratedProperties choking on: " + e);
               throw e;
        }
        catch (ClassNotFoundException cnfe) {
               System.out.println("Class not found exception");
               throw new RepositoryException("Wrong class");
        }
    }
    
    
}