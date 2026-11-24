with tab1 as(
select product_id, category from products where rating >= 3
)
, tab2 as(
Select 
        count(t.transaction_id) as txn_count,
        p.category
from transactions t  join
tab1 p on p.product_id = t. product_id 
group by p.category
), 
ranked as(
select category,
    txn_count,
    dense_rank() over(order by txn_count desc) as rnk
from tab2 )

select * from ranked where rnk <=3
