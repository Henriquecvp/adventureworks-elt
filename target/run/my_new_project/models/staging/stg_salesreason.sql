

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_salesreason`
  OPTIONS()
  as with
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
        from `etl-adventureworks`.`adventureworkselt`.`salesreason`
    )

select * from source;

