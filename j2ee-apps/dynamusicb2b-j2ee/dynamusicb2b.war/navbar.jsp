<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-- This page fragment provides a navigation bar for the Dynamusic lab exercises. 
You can call it from any page in the store. You should add it to the following
pages as part of the chapter 4 exercises: storefront.jsp, genericcategory.jsp,
genericproduct.jsp, cart.jsp,and processorder.jsp. 
-->

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<!-- Title: New Page Fragment -->
          <font face="Verdana,Geneva,Arial" 
                size="-1" color="steelblue">
            <b>
              <dsp:a href="storefront.jsp">Catalog Home</dsp:a><br><br>
              <dsp:a href="searchpage.jsp">Search</dsp:a><br> <br>
	      <dsp:a href="cart.jsp">Shopping Cart</dsp:a><br><br>
              <dsp:droplet name="Switch">
                  <dsp:param bean="Profile.transient" name="value"/>
                  <dsp:oparam name="false">
                       <dsp:a href="logout.jsp">Logout</dsp:a><br><br>
                       <dsp:a href="my_account.jsp">My Account</dsp:a><br><br>
                  </dsp:oparam>
                  <dsp:oparam name="true">
                       <dsp:a href="login.jsp">Login</dsp:a> or <dsp:a href="newProfile.jsp">Register</dsp:a>
                  </dsp:oparam>
              </dsp:droplet><br><br>
              <a href="home.jsp">Dynamusic Home</a><br><br>
              
              &nbsp;<br>
</dsp:page>
