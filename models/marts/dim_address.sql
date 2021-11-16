with
    address as (
        select
        addressid
        , stateprovinceid	
        , city		
        from {{ ref('stg_address')}}
    )
    , stateprovince as (
        select
        countryregioncode
        , stateprovinceid
        , territoryid
        , name as stateprovincename
        from {{ ref('stg_stateprovince')}}
    )
    , countryregion as (
        select
        countryregioncode	
        , name as countryregionname		
        from {{ ref('stg_countryregion')}}
    )
    , staging as (
        select
        address.addressid
        --, address.stateprovinceid
        --, stateprovince.countryregioncode
        --, stateprovince.territoryid
        , address.city
        , stateprovince.stateprovincename as stateprovince
        , countryregion.countryregionname as countryregion	
        from address 
        join stateprovince on stateprovince.stateprovinceid = address.stateprovinceid
        join countryregion on countryregion.countryregioncode = stateprovince.countryregioncode
    )
    , transformed as (
        select 
            row_number() over (order by addressid) as addresssk
            , *
        from staging
    )

select * from transformed