class Product < ApplicationRecord
  self.table_name = "my_products"
  self.primary_key = "product_id"
end
