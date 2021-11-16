with
    source as (
        select
        addressid		
        , stateprovinceid

        , city	
        , addressline2	
        , modifieddate	
        , rowguid	
        , postalcode	
        , spatiallocation	
        , addressline1	

        -- stitch tables
        , _sdc_received_at	
        , _sdc_table_version	
        , _sdc_sequence	
        , _sdc_batched_at	
        from {{ source('adventureworkselt','address')}}
    )

select * from source