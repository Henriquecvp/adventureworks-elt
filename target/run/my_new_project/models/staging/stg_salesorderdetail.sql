

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_salesorderdetail`
  OPTIONS()
  as with
    source as (
        select
        salesorderid	
        , productid	
        , salesorderdetailid

        , orderqty	
        , unitprice	
        , specialofferid	
        , modifieddate	
        , rowguid	
        , carriertrackingnumber	
        , unitpricediscount

        -- stitch tables
        , _sdc_sequence	
        , _sdc_received_at	
        , _sdc_batched_at	
        , _sdc_table_version	
        from `etl-adventureworks`.`adventureworkselt`.`salesorderdetail`
    )

select * from source;

