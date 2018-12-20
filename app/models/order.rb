class Order < ApplicationRecord
  # belongs_to :order_status
  # belongs_to :user
  has_many :order_items, dependent: :delete_all

  before_create :set_order_status
  before_save :update_total

  def calculate_total
    # order_items.collect{ |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    self.order_items.collect{ |oi| oi.product.price* oi.quantity}.sum
    #self.order_items.collect.sum{|oi| oi.product.price * oi.quantity}
  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_total
    # self[:subtotal] = subtotal #self.subtotal
    self.total = calculate_total
  end
  
end
