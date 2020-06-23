class Item < ApplicationRecord

    has_many :cart_items
    has_many :order_details
    attachment :image
    belongs_to :genre

	enum status: {"販売中":0, "売り切れ":1}


end
