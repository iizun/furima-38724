class Order < ApplicationRecord
  has_one :ship
  belongs_to :user
  belongs_to :item
end
