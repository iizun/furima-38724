class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_day
  has_one_attached :image

  has_one :order
  belongs_to :user

  validates :item_name, presence: true
  validates :summary, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :image, presence: true

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は半角数字で¥300〜9,999,999の範囲で入力してください' }
end
