with
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
        from {{ source('adventureworkselt','salesorderdetail')}}
    )

select * from source