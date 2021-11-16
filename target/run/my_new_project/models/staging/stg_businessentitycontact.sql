

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_businessentitycontact`
  OPTIONS()
  as with
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
        from `etl-adventureworks`.`adventureworkselt`.`businessentitycontact`
    )

select * from source;

