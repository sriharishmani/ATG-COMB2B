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

// DAS classes
import atg.repository.Repository;
import atg.repository.RepositoryException;

import atg.servlet.DynamoHttpServletRequest;	
import atg.servlet.DynamoHttpServletResponse;	

public class EnumForEach extends atg.servlet.DynamoServlet {

// Bean Property (to be used in a JSP simply for testing): dummyString

    private String mDummyString;
	
    public String getDummyString () {
	return mDummyString;
    }
	
    public void setDummyString(String pDummyString) {
	mDummyString = pDummyString;
    }
//------------------------------------

    public void service (DynamoHttpServletRequest request,
			     DynamoHttpServletResponse response)
		throws javax.servlet.ServletException, java.io.IOException
    {

       //Get the three input params from the JSP:

       String repositoryName = request.getParameter("repositoryName");
       String itemDescriptorName = request.getParameter("itemDescriptorName");
       String propertyName = request.getParameter("propertyName");

       Repository theRepository = (Repository) resolveName(repositoryName);

       try {
           String[] enumValues = EnumeratedProperties.getEnumeratedProperties(
       							theRepository,
       							itemDescriptorName,
       							propertyName);
       							
           if (enumValues != null) {     
     	       for(int i=0;i<enumValues.length;i++) {
		   request.setParameter("element", enumValues[i]);
		   request.serviceParameter ("output", request, response);
     	       }
           }
           else {
               request.serviceParameter ("error", request, response);
           }
       }
       catch (RepositoryException e) {
           if (isLoggingError())
               logError(e);
           request.serviceParameter ("error", request, response);
       }
    }
   
    //Constructor
    public EnumForEach() {}

}