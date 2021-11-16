with
    source as (
        select
        personid	
        , businessentityid	
        , contacttypeid	

        , modifieddate	
        , rowguid	

        -- stitch tables
        , _sdc_sequence	
        , _sdc_table_version	
        , _sdc_received_at	
        , _sdc_batched_at	
        from {{ source('adventureworkselt','businessentitycontact')}}
    )

select * from source