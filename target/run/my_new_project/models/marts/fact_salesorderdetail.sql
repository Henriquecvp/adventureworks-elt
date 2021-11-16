

  create or replace view `etl-adventureworks`.`dbt_henrique`.`fact_salesorderdetail`
  OPTIONS()
  as with
    address as ( 
        select
        *		
        from `etl-adventureworks`.`dbt_henrique`.`dim_address`
    )
    , creditcard as ( 
        select
        *
        from `etl-adventureworks`.`dbt_henrique`.`dim_creditcard`
    )
    , customer as ( 
        select
        *
        from `etl-adventureworks`.`dbt_henrique`.`dim_customer`
    )
    , product as (
        select
        *
        from `etl-adventureworks`.`dbt_henrique`.`dim_product`
    )
    , salesreason as ( 
        select
        *
        from `etl-adventureworks`.`dbt_henrique`.`dim_salesreason`
    )
    , salesorderdetail_with_sk as (
        select
        sod.salesorderdetailid
        , sod.salesorderid
        , product.productsk as productfk
        
        , product.name as productname
        , sod.orderqty
        , sod.unitprice
        , sod.unitpricediscount
        from `etl-adventureworks`.`dbt_henrique`.`stg_salesorderdetail` as sod
        left join product on product.productid = sod.productid
    )
    , salesorderheader_with_sk as (
        select
        soh.salesorderid
        , customer.customersk as customerfk
        , creditcard.creditcardsk as creditcardfk
        , salesreason.salesordersk as salesorderfk
        , address.addresssk as addressfk

        , customer.nome as customername
        , creditcard.cardtype
        , salesreason.name as salereason
        , address.city 
        , address.stateprovince 
        , address.countryregion
        , soh.orderdate
        from `etl-adventureworks`.`dbt_henrique`.`stg_salesorderheader` as soh
        left join customer on soh.customerid = customer.customerid
        left join creditcard on soh.creditcardid = creditcard.creditcardid
        left join salesreason on soh.salesorderid = salesreason.salesorderid
        left join address on soh.billtoaddressid = address.addressid
    )
    , fact as (
        select
        soh_w_sk.salesorderid
        , soh_w_sk.customerfk
        , soh_w_sk.creditcardfk
        , soh_w_sk.salesorderfk
        , soh_w_sk.addressfk

        , soh_w_sk.customername
        , soh_w_sk.cardtype
        , soh_w_sk.salereason
        , soh_w_sk.city 
        , soh_w_sk.stateprovince 
        , soh_w_sk.countryregion
        , soh_w_sk.orderdate

        , salesorderdetail_with_sk.salesorderdetailid
        , salesorderdetail_with_sk.productfk
        
        , salesorderdetail_with_sk.productname
        , salesorderdetail_with_sk.orderqty
        , salesorderdetail_with_sk.unitprice
        , salesorderdetail_with_sk.unitpricediscount
        from salesorderheader_with_sk as soh_w_sk
        left join salesorderdetail_with_sk on soh_w_sk.salesorderid = salesorderdetail_with_sk.salesorderid
    )

select * from fact;

