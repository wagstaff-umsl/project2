<cfquery name="q" datasource="postgres">
SELECT p.firstname,p.lastname,p.email
    ,crm.getAttributes(p.id,(select 'f94aa760-4dc0-415d-93c5-720eedbda135'::uuid) ) as details 
    ,crm.getValues(p.id,(select '41beaa8e-189f-4863-8cef-61ccb3c5d917'::uuid) ) as sport 
FROM crm.persons p, crm.form_response fr
WHERE p.id = fr.personid
    AND fr.id = '5dad71cd-ec0e-4dee-9430-b09d2d03203d'
ORDER BY lastname,firstname
</cfquery>


<table class="table" id="contactTable">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Email</th>
      <th scope="col">Name</th>
      <th scope="col">Sport</th>
      <th scope="col">Details</th>
    </tr>
  </thead>
  <tbody>
    <cfoutput query="q">
    <tr>
      <th scope="row">#q.currentRow#</th>
      <td>#q.lastname#, #q.firstname#</td>
      <td>#q.email#</td>
      <td>#q.sport#</td>
      <td>#q.details#</td>
    </tr>
    </cfoutput>
    <tr>
  </tbody>
</table>
