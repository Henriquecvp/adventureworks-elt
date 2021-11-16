

  create or replace view `etl-adventureworks`.`dbt_henrique`.`dim_salesreason`
  OPTIONS()
  as with
    salesreason as (
        select
        salesreasonid
        , name		
        from `etl-adventureworks`.`dbt_henrique`.`stg_salesreason`
    )
    
    , sohsr as (
        select
        salesorderid	
        , salesreasonid		
        from `etl-adventureworks`.`dbt_henrique`.`stg_salesorderheadersalesreason`
    )
    , staging as (
        select
        sohsr.salesorderid
        , salesreason.name		
        from salesreason
        join sohsr on sohsr.salesreasonid = salesreason.salesreasonid
    )
    , transformed as (
        select 
            row_number() over (order by salesorderid) as salesordersk
            , *
        from staging
    )

select * from transformed;

