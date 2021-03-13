require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  before do
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address)
  end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it '全ての値が正しく入力することができれば保存できる' do
        expect(@purchase_record_shipping_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが空では保存できない' do
        @purchase_record_shipping_address.token = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では保存できない' do
        @purchase_record_shipping_address.postal_code = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空では保存できない' do
        @purchase_record_shipping_address.prefecture_id = '1'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空では保存できない' do
        @purchase_record_shipping_address.city = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @purchase_record_shipping_address.house_number = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では保存できない' do
        @purchase_record_shipping_address.phone_number = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にはハイフンが不要であること' do
        @purchase_record_shipping_address.phone_number = '123-1234'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号は11桁以内であること' do
        @purchase_record_shipping_address.phone_number = '123456789101'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
