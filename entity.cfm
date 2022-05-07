
<cfif StructKeyExists(form,'fieldnames')>
<cfquery name="q" datasource="postgres">
  INSERT INTO crm.entity (name) values ('#form.name#')
  returning (select id::text)
</cfquery>
</cfif>

<cfset e = request.db.getEntityList() />

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
    </tr>
  </thead>
  <tbody>
    <form method="post">
    <tr>
      <td>&nbsp;</td>
      <td><input type="text" name="name"><button type="submit">Submit</button></td>
    </tr>
    </form>
    <cfoutput query="e">
    <tr>
      <th scope="row">#e.currentRow#</th>
      <td>#e.Name#</td>
    </tr>
    </cfoutput>
    <tr>
  </tbody>
</table>
