select
    brands.brand_id,
    categories.category_id,
    products.product_id,
    sum(distinct order_items.order_id) AS nb_distinct_order,
    sum(order_items.quantity) AS nb_product_order,
    round(sum(order_items.total_order_item_list_amount),2) AS total_product_list_amount,
    round(sum(order_items.total_order_item_final_discount_amount),2) AS total_product_final_discount_amount
FROM {{ ref('stg_local_bike__order_items') }} AS order_items
JOIN {{ ref('stg_local_bike__products') }} AS products ON order_items.product_id = products.product_id
JOIN {{ ref('stg_local_bike__brands') }} AS brands ON products.brand_id = brands.brand_id
JOIN {{ ref('stg_local_bike__categories') }} AS categories ON products.category_id = categories.category_id
GROUP BY 
    brands.brand_id,
    categories.category_id,
    products.product_id