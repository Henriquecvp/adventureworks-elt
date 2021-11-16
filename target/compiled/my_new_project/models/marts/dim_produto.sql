with
    staging as (
        select
         productid
        , name			
        from `etl-adventureworks`.`dbt_henrique`.`stg_product`
    )

select * from staging