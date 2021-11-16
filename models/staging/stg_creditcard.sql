with
    source as (
        select
        creditcardid	

        , cardtype	
        , cardnumber	
        , expmonth	
        , expyear	
        , modifieddate	

        -- stitch tables
        , _sdc_received_at	
        , _sdc_table_version	
        , _sdc_sequence	
        , _sdc_batched_at	
        from {{ source('adventureworkselt','creditcard')}}
    )

select * from source