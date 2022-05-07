<cfif StructKeyExists(form,'fieldnames')>

<cfset request.db.saveForm(form) />


Thank you for your inquiry. 


<cfelse>



<form class="border border-light p-5" method="post">
    <input type="hidden" name="formid" value="5dad71cd-ec0e-4dee-9430-b09d2d03203d" />
    <p class="h4 mb-4 text-center">Intramural Sports Inquiry</p>

    <label for="firstname">First Name</label>
    <input type="text" name="person:firstname" class="form-control mb-4">

    <label for="lastname">Last Name</label>
    <input type="text" name="person:lastname" class="form-control mb-4">

    <label for="email">Email</label>
    <input type="email" name="person:email" class="form-control mb-4">

    <label for="interest">Interest</label>
    <select class="browser-default custom-select mb-4" name="eav:interest">
        <option value=""></option>
        <option value="1">Option 1</option>
        <option value="2">Option 2</option>
        <option value="3">Option 3</option>
    </select>
    <br />

    <label for="details">Inquiry Details</label>
    <textarea name="4558a4d2-7d4c-bb37-f589-081d1500128c:f94aa760-4dc0-415d-93c5-720eedbda135" class="form-control mb-4"></textarea>
	
    <button class="btn btn-info btn-block my-4" type="submit">Submit</button>

</form>
</cfif>