class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_day

  validates :item_name, presence: true
  validates :summary, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, presence: true, numericality: { in: 300..9999999 , message: "can't be blank"}, format: { with: /\A(?=.*?\d)[\d]+\z/, message: '半角数字を使用してください' } 
end
