<cfif StructKeyExists(form,'fieldnames')>
<cfquery name="q" datasource="postgres">
  INSERT INTO crm.attributes (name,entitytype,groupkey)  values ('#form.name#','#form.entitytype#','#form.groupkey#')
  returning (select id::text)
</cfquery>
</cfif>


<cfset a = request.db.getAttributeList() />
<cfset e = request.db.getEntityList() />

<table class="table" id="contactTable">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Entity</th>
      <th scope="col">Name</th>
      <!--- <th scope="col">Store</th> --->
      <th scope="col">Value Key</th>
    </tr>
  </thead>
  <tbody>
    <form method="post">
    <tr>
      <td>&nbsp;</td>
      <td><select name="entitytype"><option value=""></option><cfoutput query="e"><option value="#e.name#">#e.name#</value></cfoutput></select></td>
      <td><input type="text" name="name"></td>
      <!--- <td><input type="text" name="store"></td> --->
      <td><input type="text" name="groupkey"><button type="submit">Submit</button></td>
    </tr>
    </form>
    <cfoutput query="a">
    <tr>
      <th scope="row">#a.currentRow#</th>
      <td>#a.entitytype#</td>
      <td>#a.name#</td>
      <!--- <td>#a.storeby#</td> --->
      <td>#a.groupkey#</td>
    </tr>
    </cfoutput>
    <tr>
  </tbody>
</table>
