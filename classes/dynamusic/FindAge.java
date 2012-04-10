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

import atg.repository.RepositoryItemImpl;
import java.util.Date;

/** This class is an example of a user-defined property for use
 ** with the Profile Repository.  It returns the age of a user in the 
 ** Profile repository.  It can format the age in one of
 ** two ways: age in years or age in days
 **
 ** ATG Curriculum Development - Utilizing Dynamo Repositories
 **
 **/
public class FindAge extends atg.repository.RepositoryPropertyDescriptor {
	
  /** Attribute Member variables */
  String mAgeFormat = "years"; /** possible values: years or days */
  
  /* Attribute name constants */
  public  static final String AGE_FORMAT_ATTR_NAME = "ageFormat";
  
	
 /*	This code would register this property descriptor so that
  *      we can refer to it by name rather than the full path.
  */
 /*
	static {
		    RepositoryPropertyDescriptor.registerPropertyDescriptorClass("FindAge", 
                                        FindAge.class);
		}
		*/
		
  public FindAge () {
    super();
  }

  //------------------------------------- 
  /** 
   * Return the age for this user, based on his or her birthday
   **/

    public Object getPropertyValue (RepositoryItemImpl pItem, Object pValue) {
        System.out.println("Calling getPropertyValue " + pItem);

        Date dob = (Date) pItem.getPropertyValue("dateOfBirth");
                
        if (dob != null) {
            /* possible values for the ageFormat attributes
               are years and days, years is the default */
            if (mAgeFormat.equalsIgnoreCase("days"))  {
                return new Integer(AgeCalc.ageInDays(dob));
	    }
	    else {
                return new Integer(AgeCalc.ageInYears(dob));
  	    }
        }
        System.out.println("dob unset, returning -1");
        return new Integer(-1);
    }

  //-------------------------------------
  /**
   * Put in a setValue to allow us to load in config
   * info from an <attribute...> tag in the definition file.
   **/
  public void setValue(String pAttributeName, Object pValue) {     
     super.setValue(pAttributeName, pValue);
     
	if (pAttributeName.equalsIgnoreCase(AGE_FORMAT_ATTR_NAME)) {
	    mAgeFormat = pValue.toString();
	}
  }


  //-------------------------------------
  /**
   * Returns property Queryable - this needs to be false
   * because this property is not stored in the database.
   **/
  public boolean isQueryable() {
    return false;
  }

  //-------------------------------------
  /**
   * Returns property Writable. - this property is always false
   * because it doesn't store a value; it only returns a formatted
   * version of values stored in other properties.
   */
  public boolean isWritable() {
    return false;
  }

}
