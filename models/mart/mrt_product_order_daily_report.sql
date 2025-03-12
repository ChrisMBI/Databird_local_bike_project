select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_date,
    orders.required_date,
    orders.shipped_date,
    orders.store_id,
    orders.staff_id,
    average_discount,
    total_quantity,
    total_distinct_product,
    total_order_list_amount,
    total_order_final_discount_amount
FROM {{ ref('int_local_bike__orders') }} AS orders