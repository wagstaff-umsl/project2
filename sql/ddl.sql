create table crm.form_response(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	personid uuid
)


CREATE TABLE crm.entity(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name text
);


CREATE TABLE crm.attributes 
( 
    id UUID PRIMARY KEY DEFAULT gen_random_uuid() 
    ,name text 
    ,entitytype text 
    ,datatype text 
    ,storeby integer 
    ,groupkey text 
); 


CREATE TABLE crm.values( 
    id UUID PRIMARY KEY DEFAULT gen_random_uuid() 
    ,key         text 
    ,value       text 
    ,index       int 
); 
 
 
CREATE TABLE crm.eav( 
     entityid            UUID 
    ,attributeid                     uuid 
    ,value                       text 
);
 
CREATE TABLE crm.persons( 
     id UUID PRIMARY KEY DEFAULT gen_random_uuid() 
    ,firstname   text 
    ,lastname    text 
    ,email       text 
    ,phonenumber text 
);

create table crm.address(
     id UUID PRIMARY KEY DEFAULT gen_random_uuid() 
    ,personid uuid REFERENCES crm.persons(id)
    ,street   text 
    ,city    text 
    ,state       text 
    ,zipcode text 
)

create or replace FUNCTION crm.getAttributes(in_entityid uuid, in_attributeid uuid)
 RETURNS text
 LANGUAGE plpgsql
AS $function$ 
declare 
   ret_value text; 
begin 
   select value  
   into ret_value 
   from crm.eav 
   where entityid = in_entityid 
      and attributeid = in_attributeid; 
    
   return ret_value; 
end; 
$function$
;




create or replace function crm.getValues(in_entityid uuid, in_attributeid uuid) 
returns varchar(500) 
language plpgsql 
as 
$$ 
declare 
   ret_value varchar(500); 
begin 
                select value from crm.values where id = ( 
                                   select uuid(value)  
                                   into ret_value 
                                   from crm.eav 
                                   where entityid = in_entityid 
                                       and attributeid = in_attributeid); 
    
   return ret_value; 
end; 
$$; 
 