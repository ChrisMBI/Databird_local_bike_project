select
    stores.store_id,
    staffs.staff_id,
    count(distinct orders.total_distinct_product) AS total_distinct_sale_product,
    sum(orders.total_quantity) AS total_sale_item, 
    round(sum(orders.total_order_list_amount),2) AS total_sale_list_amount,
    round(sum(orders.total_order_final_discount_amount),2) AS total_sale_final_discount_amount,
    round(AVG(orders.average_discount),2) As average_discount
FROM {{ ref('int_local_bike__orders') }} AS orders
JOIN {{ ref('stg_local_bike__stores') }} AS stores ON orders.store_id = stores.store_id
JOIN {{ ref('stg_local_bike__staffs') }} AS staffs ON orders.staff_id = staffs.staff_id
GROUP BY
    stores.store_id,
    staffs.staff_id