component  output="false" { 
    this.dsn = "postgres"

    function getAttributeList(){
        return queryExecute(
                "SELECT * 
                FROM crm.attributes
                ORDER BY entitytype,name", 
                {}, 
                {datasource = "postgres"} 
            );
    }


    function getEntityList(){
        return queryExecute(
                "SELECT * 
                FROM crm.entity
                ORDER BY name ", 
                {}, 
                {datasource = "postgres"} 
            );
    }

    function getValueList(){
        return queryExecute(
                "SELECT * 
                FROM crm.values
                ORDER BY key,value", 
                {}, 
                {datasource = "postgres"} 
            );
    }

    function getContactList(){
        return queryExecute(
                "SELECT *
                FROM crm.persons
                ORDER BY lastname,firstname ", 
                {}, 
                {datasource = "postgres"} 
            );

    }


    function saveForm(struct f){

        var q = queryNew("entity,column", "varchar,varchar");

        for (item in arguments.f.fieldnames) {
            if (item != 'formid'){
                writedump(item);
                queryAddRow(q);
                querySetCell(q, "entity", ListGetAt(item,1,":") );
                querySetCell(q, "column", ListGetAt(item,2,":") );
            } 
        }

        // build insert statement to add to database. 
        cfloop(query=q, group="entity"){ 
            qstring = "insert into #q.entity# ("; 
            cfloop(){ 
                qstring &= "'#q.column#'"; 
                if (q.currentrow neq q.recordcount){
                    if (q.entity eq q["entity"][q.currentrow+1])
                    qstring &= ",";
                }
            } 
            qstring &= ") values ("; 
            writedump(qstring);
        }

        cfloop(query=q, group="entity"){ 
            qstring = ""; 
            cfloop(){ 
                qstring &= "'#f[q.entity & ':' & q.column]#'"; 
                if (q.currentrow neq q.recordcount){
                    if (q.entity eq q["entity"][q.currentrow+1])
                    qstring &= ",";
                }
            } 
            qstring &= ")"; 
            writedump(qstring);
        }

        // this looks like i build a query string and insert into database but on my 3rd version this doesn't work
        // next version is going to use database reflection to determien order of entites to insert data.  
        // for example if the form has person and address entity fields it would see that personid is a FK in address so person 
        // should be inserted first. 
        queryExecute(qstring,{},{datasource = "postgres"});
        
    }


    function getReportAttributes(string id){
         return queryExecute(
                "SELECT 
                    table_name, 
                    column_name,
                    column_name as label,
                    true as systemtable
                FROM 
                    information_schema.columns
                WHERE 
                    table_name = (select name from crm.entity where id = '#arguments.id#')
                union   
                select 'eav' as table_name,
                    (select id::text) as column_name,
                    name as label,
                    false as systemtable
                
                from crm.attributes 
                where entitytype = (select name from crm.entity where id = '#arguments.id#')", 
                { entityid = arguments.id}, 
                {datasource = "postgres"} 
            );       
    }


    function getReportTable(string id){
         return queryExecute(
                "SELECT * 
                FROM crm.entity
                WHERE id = '#arguments.id#'
                ORDER BY name ", 
                { entityid = arguments.id }, 
                {datasource = "postgres"} 
            );       
    }

    function getAttributeKeyList(){
         return queryExecute(
                "SELECT DISTINCT groupkey
                FROM crm.attributes
                WHERE groupkey is not null
                ORDER BY groupkey ", 
                { }, 
                {datasource = "postgres"} 
            );   
    }


}