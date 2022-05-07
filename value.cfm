<cfif StructKeyExists(form,'fieldnames')>
<cfquery name="q" datasource="postgres">
  INSERT INTO crm.values (key,value,index) values ('#form.groupkey#','#form.value#','#form.index#')
  returning (select id::text)
</cfquery>
</cfif>

<cfset v = request.db.getValueList() />
<cfset a = request.db.getAttributeKeyList() />
<table class="table" id="contactTable">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Attribute Key</th>
      <th scope="col">Value</th>
      <th scope="col">Index</th>
    </tr>
  </thead>
  <tbody>
    <form method="post">
    <tr>
      <td>&nbsp;</td>
      <td><select name="groupkey"><option value=""></option><cfoutput query="a"><option value="#a.groupkey#">#a.groupkey#</value></cfoutput></select></td>
      <td><input type="text" name="value"></td>
      <td><input type="text" name="index"><button type="submit">Submit</button></td>
    </tr>
    </form>
    <cfoutput query="v">
    <tr>
      <th scope="row">#v.currentRow#</th>
      <td>#v.key#</td>
      <td>#v.value#</td>
      <td>#v.index#</td>
    </tr>
    </cfoutput>
    <tr>
  </tbody>
</table>
