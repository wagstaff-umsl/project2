<div id="nav">
<a href="inquiry_sport.cfm">Sport Inquiry</a> | <a href="report_sport.cfm">Sport Report</a> | <a href="inquiry_catalog.cfm">Catalog Inquiry</a> | <a href="report_catalog.cfm">Catalog Inquiry</a>
</div>

<div id="admin"><a href="entity.cfm">Manage Entities</a> | 
<a href="attribute.cfm">Manage Attributes</a> |
<a href="value.cfm">Manage Value</a></div>

<cfset contacts = request.db.getContactList() />

<table class="table" id="contactTable">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Lastname</th>
      <th scope="col">Firstname</th>
      <th scope="col">Email</th>
      <th scope="col">Phone Number</th>
    </tr>
  </thead>
  <tbody>
    <cfoutput query="contacts">
    <tr onClick="details('#contacts.id#')">
      <th scope="row">#contacts.currentRow#</th>
      <td>#contacts.lastname#</td>
      <td>#contacts.firstname#</td>
      <td>#contacts.email#</td>
      <td>#contacts.phonenumber#</td>
    </tr>
    </cfoutput>
    <tr>
  </tbody>
</table>

