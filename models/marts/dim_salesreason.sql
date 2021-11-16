with
    salesreason as (
        select
        salesreasonid
        , name		
        from {{ ref('stg_salesreason')}}
    )
    
    , sohsr as (
        select
        salesorderid	
        , salesreasonid		
        from {{ ref('stg_salesorderheadersalesreason')}}
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

select * from transformed