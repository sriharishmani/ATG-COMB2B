The following snippet (or a subset of it) is used frequently in these
labs.  It is provided here as a source for copy and paste:
----------------------------------------------------------


      <dsp:droplet name="/atg/dynamo/droplet/ForEach">
         <dsp:param name="array" param="parentCategory.childCategories"/>
         
         <dsp:oparam name="output">
         <dsp:param name="childCategory" param="element"/>
           <dsp:getvalueof id="templateURL" idtype="java.lang.String" param="element.template.url">
             <dsp:a href="<%= templateURL %>">
	       <dsp:param name="id" param="element.repositoryId"/>
               <dsp:valueof param="element.displayName"/>
             </dsp:a>
           </dsp:getvalueof>
         </dsp:oparam>
      </dsp:droplet>
