

  create or replace view `etl-adventureworks`.`dbt_henrique`.`dim_creditcard`
  OPTIONS()
  as with
    staging as (
        select
        creditcardid
        , cardtype		
        from `etl-adventureworks`.`dbt_henrique`.`stg_creditcard`
    )
    , transformed as (
        select 
            row_number() over (order by creditcardid) as creditcardsk
            , *
        from staging
    )

select * from transformed;

