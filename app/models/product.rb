class Product < ApplicationRecord
    has_many :order_items, dependent: :delete_all

    default_scope {where(active: true)}
end
