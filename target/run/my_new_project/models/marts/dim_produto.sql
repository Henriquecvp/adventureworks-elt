

  create or replace view `etl-adventureworks`.`dbt_henrique`.`dim_produto`
  OPTIONS()
  as with
    staging as (
        select
         productid
        , name			
        from `etl-adventureworks`.`dbt_henrique`.`stg_product`
    )

select * from staging;

