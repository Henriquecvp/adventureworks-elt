

  create or replace view `etl-adventureworks`.`dbt_henrique`.`dim_customer`
  OPTIONS()
  as with
    customer as (
        select
        customerid	
        , personid		
        from `etl-adventureworks`.`dbt_henrique`.`stg_customer`
    )
    , person as (
        select
        businessentityid	
        , concat(firstname,' ',lastname) as nome
        from `etl-adventureworks`.`dbt_henrique`.`stg_person`
    )
    , bec as (
        select
        personid	
        , businessentityid		
        from `etl-adventureworks`.`dbt_henrique`.`stg_businessentitycontact`
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

select * from transformed;

