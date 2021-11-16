

  create or replace view `etl-adventureworks`.`dbt_henrique`.`stg_salesorderheader`
  OPTIONS()
  as with
    source as (
        select
        salesorderid	
        , salespersonid	
        , shiptoaddressid	
        , territoryid	
        , purchaseordernumber	
        , modifieddate	
        , billtoaddressid	
        , shipmethodid	
        , rowguid	
        , currencyrateid	
        , creditcardid	
        , customerid	

        , taxamt	
        , onlineorderflag	
        , status	
        , orderdate	
        , creditcardapprovalcode	
        , subtotal	
        , revisionnumber	
        , freight	
        , duedate	
        , totaldue	
        , shipdate	
        , accountnumber	

        -- stich tables
        , _sdc_sequence	
        , _sdc_received_at	
        , _sdc_batched_at	
        , _sdc_table_version	
        from `etl-adventureworks`.`adventureworkselt`.`salesorderheader`
    )

select * from source;

