with
    source as (
        select
        id	

        , cardtype	
        , creditcardid	
        , cardnumber	
        , expyear	
        , expmonth	
        
        , modifieddate	


        , _sdc_sequence	
        , _sdc_table_version	
        , __sdc_primary_key	
        , _sdc_batched_at	
        , _sdc_received_at	
        from `etl-adventureworks`.`adventureworkselt`.`cc`
    )

select * from source