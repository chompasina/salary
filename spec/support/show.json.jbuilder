json.extract! @item, :id, :name, :description, :created_at, :updated_at, :merchant_id

json.unit_price @item.formatted_unit_price.to_s

# json.partial! "item", item: @item

