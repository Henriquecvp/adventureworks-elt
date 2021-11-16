with
    staging as (
        select
        creditcardid
        , cardtype		
        from {{ ref('stg_creditcard')}}
    )
    , transformed as (
        select 
            row_number() over (order by creditcardid) as creditcardsk
            , *
        from staging
    )

select * from transformed