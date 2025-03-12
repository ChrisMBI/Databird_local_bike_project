select
 order_id || '_' || item_id as order_item_id,
 order_id,
 item_id,
 product_id,
 quantity,
 list_price,
 discount,
 round((list_price * quantity),2) as total_order_item_list_amount,
 round((list_price * quantity) * (1-discount),2) as total_order_item_final_discount_amount
from {{ source('local_bike', 'order_items') }}