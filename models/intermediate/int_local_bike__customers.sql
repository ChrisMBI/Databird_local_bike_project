select 
    orders.customer_id,
    count(distinct orders.total_distinct_product) AS total_distinct_order_product,
    sum(orders.total_quantity) AS total_order_item, 
    round(sum(orders.total_order_list_amount),2) AS total_order_list_amount,
    round(sum(orders.total_order_final_discount_amount),2) AS total_order_final_discount_amount,
    round(AVG(orders.average_discount),2) As average_discount
FROM {{ ref('int_local_bike__orders') }} AS orders
JOIN {{ ref('stg_local_bike__customers') }} AS customers ON orders.customer_id = customers.customer_id
GROUP BY
    orders.customer_id