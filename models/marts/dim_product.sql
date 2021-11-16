with
    staging as (
        select
         productid
        , name			
        from {{ ref('stg_product')}}
    )
    , transformed as (
        select 
            row_number() over (order by productid) as productsk
            , *
        from staging
    )

select * from transformed