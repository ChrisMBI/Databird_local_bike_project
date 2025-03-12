select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_date,
    orders.required_date,
    orders.shipped_date,
    orders.store_id,
    orders.staff_id,
    round(AVG(order_items.discount),2) AS average_discount,
    sum(order_items.quantity) AS total_quantity,
    count(distinct order_items.product_id) AS total_distinct_product,
    round(sum(order_items.total_order_item_list_amount),2) AS total_order_list_amount,
    round(sum(order_items.total_order_item_final_discount_amount),2) AS total_order_final_discount_amount
FROM {{ ref('stg_local_bike__order_items') }} AS order_items
JOIN {{ ref('stg_local_bike__orders') }} AS orders ON order_items.order_id = orders.order_id
GROUP BY
orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_date,
    orders.required_date,
    orders.shipped_date,
    orders.store_id,
    orders.staff_id