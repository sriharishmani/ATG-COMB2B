<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<%-- 
This fragment takes a CommerceItem as a page parameter, and creates
four columns of a table filled with information about that item.  

The first column displays the manufacturer's part number for the item.  

The second column is always empty.

The third column displays a link to the item's product template in the
catalog.  

The fourth column displays some inventory status information about that
item if the item is out of stock or the stock level is smaller than the
number of units in the order.  If the item is in stock and there are enough
units to fill the order available, the fourth column will be empty.
--%>

<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<%-- expect a CommerceItem to be passed in --%>
<%-- DECLAREPARAM NAME="item" CLASS="atg.commerce.order.CommerceItem"
    DESCRIPTION="Shopping Cart Item" --%>



  <dsp:droplet name="/atg/commerce/inventory/InventoryLookup">
    <dsp:param name="itemId" param="item.catalogRefId"/>
    <dsp:oparam name="output">

        <dsp:getvalueof id="templateURL" param="item.auxiliaryData.productRef.template.url" idtype="java.lang.String">
        <dsp:getvalueof id="displayName" param="item.auxiliaryData.catalogRef.displayName" idtype="java.lang.String">
        <dsp:droplet name="IsEmpty">
          <dsp:param name="value" value="<%=templateURL%>"/>
          <dsp:oparam name="false">
            <dsp:a page="<%=templateURL%>">
              <dsp:param name="id" param="item.auxiliaryData.productRef.repositoryId"/>
              <dsp:param name="navAction" value="jump"/>
              <dsp:droplet name="IsEmpty">
                <dsp:param name="value" value="<%=displayName%>"/>
                <dsp:oparam name="false">
                  <%= displayName %>
                </dsp:oparam>
                <dsp:oparam name="true">
                  <%-- The catalogRef or name is missing. Give the user some clue. --%>
                  Unknown name for SKU <dsp:valueof param="item.catalogRefId"/>
                </dsp:oparam>
              </dsp:droplet>
            </dsp:a>
          </dsp:oparam>
          <dsp:oparam name="true">
            <%-- The productRef or template url is missing, so we can't generate an anchor tag. --%>
              <dsp:droplet name="IsEmpty">
                <dsp:param name="value" value="<%=displayName%>"/>
                <dsp:oparam name="false">
                  <%= displayName %>
                </dsp:oparam>
                <dsp:oparam name="true">
                  <%-- The catalogRef or name is missing. Give the user some clue. --%>
                  Unknown name for SKU <dsp:valueof param="item.catalogRefId"/>
                </dsp:oparam>
              </dsp:droplet>
          </dsp:oparam>
        </dsp:droplet>
        </dsp:getvalueof>
        </dsp:getvalueof>



    </dsp:oparam>    
  </dsp:droplet>

</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/cart_line_item.jsp#7 $$Change: 514668 $--%>
