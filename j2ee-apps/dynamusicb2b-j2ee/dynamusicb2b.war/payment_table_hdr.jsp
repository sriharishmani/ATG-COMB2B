<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

   <table border=0 cellpadding=0 cellspacing=0 width=800>
      <tr></tr>
      <tr>
        <td width=55></td>
        <td valign="top" width=745>
        <table border=0 cellpadding=4 width=80%>
          <tr><td></td></tr>
          <tr>
            <td colspan=2></td>
          </tr>
          <tr><td></td></tr>
          <tr>
            <td colspan=2><br>
            Order total: <dsp:valueof converter="currency" param="order.priceInfo.total"/><br>
            <span class=help>Enter the amount you wish to move to another payment method and select the new method. The remaining amount will stay on the default payment method. <P>You must save changes before continuing.</span></td>
          </tr>
          <tr valign=top>
            <td>
            <table border=0 cellpadding=4 cellspacing=1>
              <tr valign=top>
                <td colspan=9 align=right>
                </td>
              </tr>
    
              <tr valign=bottom bgcolor="#666666">
                <td colspan=2><span class=smallbw>Amount</span></td>
                <td colspan=2><span class=smallbw>Amt to move &nbsp;</span></td>
                <td colspan=2><span class=smallbw>Payment method</span></td>
                <td colspan=3><span class=smallbw>Save changes</span></td>
              </tr>
</dsp:page>
