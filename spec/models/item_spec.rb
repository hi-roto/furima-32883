require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '全ての項目が入力されて、入力の要件が合致していると登録ができること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品画像を１枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態についての情報が必須であること' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status is not a number')
      end
      it '配送料の負担についての情報が必須であること' do
        @item.postage_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer is not a number')
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'カテゴリーの情報がid:1の時は保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態がid:1の時は保存できないこと' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it '配送料の負担についての情報がid:1の時は保存できないこと' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
      end
      it '発送元の地域についての情報がid:1の時は保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること(300未満の場合)' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること(10000000以上の場合)' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '４０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英数字混合では保存できないこと' do
        @item.price = 'abc350'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英語のみでは登録できないこと' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
