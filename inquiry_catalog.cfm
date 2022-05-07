<cfif StructKeyExists(form,'fieldnames')>
<cfdump var="#form#" />
<cfset request.db.saveForm(form) />


Thank you for your inquiry. 


<cfelse>



<form class="border border-light p-5" method="post">
    <input type="hidden" name="formid" value="75b81b7a-af0f-41a3-bc4e-f67a576676f5" />
    <p class="h4 mb-4 text-center">Catalog Request</p>

    <label for="interest">Catalog Type</label>
    <select class="browser-default custom-select mb-4" name="eav:catalogtype">
        <option value=""></option>
        <option value="1">Option 1</option>
        <option value="2">Option 2</option>
        <option value="3">Option 3</option>
    </select>


    <label for="firstname">First Name</label>
    <input type="text" name="person:firstname" class="form-control mb-4">

    <label for="lastname">Last Name</label>
    <input type="text" name="person:lastname" class="form-control mb-4">

    <label for="email">Street</label>
    <input type="email" name="adress:email" class="form-control mb-4">

    <label for="email">City</label>
    <input type="email" name="adress:email" class="form-control mb-4">

    <label for="email">State</label>
    <input type="email" name="adress:email" class="form-control mb-4">

    <label for="email">Zipcode</label>
    <input type="email" name="adress:email" class="form-control mb-4">



    <button class="btn btn-info btn-block my-4" type="submit">Submit</button>

</form>
</cfif>