

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_salesperson`
  OPTIONS()
  as with
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
        from `etl-adventureworks`.`adventureworkselt`.`salesperson`
    )

select * from source;

