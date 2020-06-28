class Item < ApplicationRecord

    has_many :cart_items
    has_many :order_details
    attachment :image
    belongs_to :genre, optional: true
  

	enum status: {"販売中":0, "売り切れ":1}
	enum genre_id: {"ケーキ":0, "クッキー":1, "プリンゼリー":2, "和菓子":3}


end
