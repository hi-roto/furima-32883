class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_many_attached :images

  validates :images, :name, :introduction, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :item_status_id, :postage_payer_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
end
