class Item < ApplicationRecord
belongs_to :user
has_one_attached :image

validates :image, :name, :introduction, :price, presence: true
validates :category_id, :item_status_id, :postage_payer_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 1 }

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :item_status
belongs_to :postage_payer
belongs_to :prefecture
belongs_to :preparation_day

end
