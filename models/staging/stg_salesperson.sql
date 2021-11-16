with
    source as (
        select
        businessentityid	
        , territoryid	
        
        , salesquota	
        , modifieddate	
        , rowguid	
        , salesytd	
        , saleslastyear	
        , commissionpct	
        , bonus	

        -- stitch tables
        , _sdc_received_at	
        , _sdc_sequence	
        , _sdc_batched_at	
        , _sdc_table_version	
        from {{ source('adventureworkselt','salesperson')}}
    )

select * from source