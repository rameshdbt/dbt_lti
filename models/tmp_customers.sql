with customer as (
select
        c_custkey as customer_id,
        c_nationkey as nation_id,
        c_name as name,
        c_address as address,
        c_phone as phone_number,
        c_acctbal as account_balance,
        c_mktsegment as market_segment,
        c_comment as comment
from customers
),

nation as (
select
        n_nationkey as nation_id,
        n_regionkey as region_id,
        n_name as name,
        n_comment as comment
from nations
),

region as (
select
	r_regionkey as region_id,
	r_name as name,
	r_comment as comment
from regions
),
final as (
select
        customer.customer_id,
        customer.name,
        customer.address,
        nation.nation_id as nation_id,
        nation.name as nation,
        region.region_id as region_id,
        region.name as region,
        customer.phone_number,
        customer.account_balance,
        customer.market_segment 
        from customer
        inner join nation
            on customer.nation_id = nation.nation_id
        inner join region
            on nation.region_id = region.region_id

)
select * from final;