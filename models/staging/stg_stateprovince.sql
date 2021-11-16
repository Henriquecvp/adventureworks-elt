with
    source as (
        select
        territoryid	
        , stateprovinceid

        , name	
        , countryregioncode	
        , stateprovincecode	
        , modifieddate	
        , rowguid	
        , isonlystateprovinceflag	

        , _sdc_received_at	
        , _sdc_sequence	
        , _sdc_table_version	
        , _sdc_batched_at	
        from {{ source('adventureworkselt','stateprovince')}}
    )

select * from source