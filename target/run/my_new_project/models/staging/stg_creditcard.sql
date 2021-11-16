

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_creditcard`
  OPTIONS()
  as with
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
        from `etl-adventureworks`.`adventureworkselt`.`creditcard`
    )

select * from source;

