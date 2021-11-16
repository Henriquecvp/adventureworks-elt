

  create or replace view `etl-adventureworks`.`dbt_henrique`.`dim_product`
  OPTIONS()
  as with
    staging as (
        select
         productid
        , name			
        from `etl-adventureworks`.`dbt_henrique`.`stg_product`
    )
    , transformed as (
        select 
            row_number() over (order by productid) as productsk
            , *
        from staging
    )

select * from transformed;

