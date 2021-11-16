

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_stateprovince`
  OPTIONS()
  as with
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
        from `etl-adventureworks`.`adventureworkselt`.`stateprovince`
    )

select * from source;

