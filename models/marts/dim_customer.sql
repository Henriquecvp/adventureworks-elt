with
    customer as (
        select
        customerid	
        , personid		
        from {{ ref('stg_customer')}}
    )
    , person as (
        select
        businessentityid	
        , concat(firstname,' ',lastname) as nome
        from {{ ref('stg_person')}}
    )
    , bec as (
        select
        personid	
        , businessentityid		
        from {{ ref('stg_businessentitycontact')}}
    )
    , staging as (
        select
        person.businessentityid
        , customer.customerid	
        , person.nome		
        from customer 
        join bec on bec.personid = customer.personid
        join person on person.businessentityid = bec.businessentityid
    )
    , transformed as (
        select 
            row_number() over (order by customerid) as customersk
            , *
        from staging
    )

select * from transformed