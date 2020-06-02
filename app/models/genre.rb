class Genre < ApplicationRecord
    enum status: {"有効": 1, "無効": 0}

    has_many :items
end
