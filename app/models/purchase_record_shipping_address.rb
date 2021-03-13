class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name

  VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: VALID_POSTAL_CODE, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, :house_number, :user_id, :item_id
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }, length: { in: 10..11 }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                           phone_number: phone_number, building_name: building_name, purchase_record_id: purchase_record.id)
  end
end
