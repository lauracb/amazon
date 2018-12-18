class Product < ApplicationRecord
    has_many :order_items, dependent: :delete_all
end
