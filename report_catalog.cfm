<cfquery name="q" datasource="postgres">
SELECT p.firstname,p.lastname,street, city, state, zipcode
    ,crm.getValues(p.id,(select '41beaa8e-189f-4863-8cef-61ccb3c5d917'::uuid) ) as catalogtype 
FROM crm.persons p, crm.form_response fr, crm.address a
WHERE p.id = fr.personid
    AND fr.id = '75b81b7a-af0f-41a3-bc4e-f67a576676f5'
    AND p.id = a.personid
ORDER BY lastname,firstname
</cfquery>


<table class="table" id="contactTable">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Street</th>
      <th scope="col">City</th>
      <th scope="col">State</th>
      <th scope="col">Zipcode</th>
      <th scope="col">Catalog Type</th>
    </tr>
  </thead>
  <tbody>
    <cfoutput query="q">
    <tr>
      <th scope="row">#q.currentRow#</th>
      <td>#q.lastname#, #q.firstname#</td>
      <td>#q.street#</td>
      <td>#q.city#</td>
      <td>#q.state#</td>
      <td>#q.zipcode#</td>
      <td>#q.catalogtype#</td>
    </tr>
    </cfoutput>
    <tr>
  </tbody>
</table>
