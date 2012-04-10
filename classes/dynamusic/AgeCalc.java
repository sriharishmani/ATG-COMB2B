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
 * AgeCalc
 *
 * Sample class for Dynamusic exercises.
 * 
 * Developing ATG Applications, Part II
 *
 * @author Diana Carroll
 * Last modified: June 30, 2003
 *--------------------------------------------
 */
 
import java.util.Date;

public class AgeCalc {

   /** given a date, return the number of days since that date (this 
    ** does not take in to account leap years
    **/
   public static int ageInDays(Date pDate) {
	double secondsInDay = 24*60*60;
	long ageAsSeconds = ageInSeconds(pDate);
  	long ageAsDays = (long) (ageAsSeconds/secondsInDay);  
  	return (int) ageAsDays;		

   }
   
   /** given a date, return the number of years since that date 
    **/
   public static int ageInYears(Date pDate) {
   
	double secondsInYear = 365.25*24*60*60;
	long ageAsSeconds = ageInSeconds(pDate);
  	long ageAsYears = (long) (ageAsSeconds/secondsInYear);
	return (int) ageAsYears;

   }

   /** given a date, return the number of seconds since that date 
    **/
   public static long ageInSeconds(Date pDate) {
  	Date now = new Date();
     	long ageAsTime = now.getTime() - pDate.getTime();
  	long ageAsSeconds = ageAsTime/1000;
  	return ageAsSeconds;
   }

}