class Item < ApplicationRecord
	enum status: {"販売中":0, "売り切れ":1}
    has_many :cart_items
    has_many :order_details
    attachment :image




end
