with
    source as (
        select
        salesorderid	
        , salesreasonid	

        , modifieddate

        -- stitch tables
        , _sdc_received_at	
        , _sdc_table_version	
        , _sdc_sequence	
        , _sdc_batched_at	
        from {{ source('adventureworkselt','salesorderheadersalesreason')}}
    )

select * from source