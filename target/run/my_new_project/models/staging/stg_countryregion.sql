

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_countryregion`
  OPTIONS()
  as with
    source as (
        select
        countryregioncode		
        , modifieddate		
        , name		

        --stitch tables
        , _sdc_sequence		
        , _sdc_table_version		
        , _sdc_received_at		
        , _sdc_batched_at		
        from `etl-adventureworks`.`adventureworkselt`.`countryregion`
    )

select * from source;

