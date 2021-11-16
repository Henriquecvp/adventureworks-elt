with
    source as (
        select
        salesreasonid	

        , name	
        , reasontype	
        , modifieddate	

        -- stitch tables
        , _sdc_sequence	
        , _sdc_table_version	
        , _sdc_received_at	
        , _sdc_batched_at	
        from {{ source('adventureworkselt','salesreason')}}
    )

select * from source