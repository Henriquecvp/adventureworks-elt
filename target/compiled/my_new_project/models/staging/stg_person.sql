with
    source as (
        select
        businessentityid	

        , firstname	
        , middlename	
        , lastname	
        , persontype	
        , namestyle	
        , suffix	
        , modifieddate	
        , rowguid	
        , emailpromotion	
        , title	

        -- stich tables
        , _sdc_table_version	
        , _sdc_received_at	
        , _sdc_sequence	
        , _sdc_batched_at	
        from `etl-adventureworks`.`adventureworkselt`.`person`
    )

select * from source