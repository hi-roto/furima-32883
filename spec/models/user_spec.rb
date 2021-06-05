require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が入力されており、全ての要件に合致していると登録できること' do
        expect(@user).to be_valid
      end
    end

    context '各項目が空の場合、新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last nameを入力してください")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanaを入力してください")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaを入力してください")
      end
      it 'birth_dayが空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth dayを入力してください")
      end
    end

    context 'passwordの要件を満たしていないと新規登録できないとき' do
      it 'passwordが６文字以下だと登録できない' do
        @user.password = 'aaa12'
        @user.password_confirmation = 'aaa12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが英数字が混ざっていないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordとpassword_confarmationが一致しないと登録できない' do
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ａｂｃdef123'
        @user.password_confirmation = 'ａｂｃdef123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
    end

    context 'emailの要件を満たしてないと新規登録できないとき' do
      it 'emailに@がない登録できない' do
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
    end

    context '氏名に関する要件を満たしていないと新規登録できないとき' do
      it 'last_nameは半角で入力すると登録できない' do
        @user.last_name = 'ｱｲｳｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameは不正な値です')
      end
      it 'last_nameは英字で入力すると登録できない' do
        @user.last_name = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameは不正な値です')
      end
      it 'first_nameは半角で入力すると登録できない' do
        @user.first_name = 'ｱｲｳｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameは不正な値です')
      end
      it 'first_nameは英字で入力すると登録できない' do
        @user.first_name = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameは不正な値です')
      end
      it 'last_name_kanaは半角で入力すると登録できない' do
        @user.last_name_kana = 'ｱｲｳｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanaは不正な値です')
      end
      it 'last_name_kanaは全角ひらがなで入力すると登録できない' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanaは不正な値です')
      end
      it 'last_name_kanaは全角漢字で入力すると登録できない' do
        @user.last_name_kana = '高橋'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanaは不正な値です')
      end
      it 'first_name_kanaは半角で入力すると登録できない' do
        @user.first_name_kana = 'ｱｲｳｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanaは不正な値です')
      end
      it 'first_name_kanaは全角ひらがなで入力すると登録できない' do
        @user.first_name_kana = 'たかはし'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanaは不正な値です')
      end
      it 'first_name_kanaは全角漢字で入力すると登録できない' do
        @user.first_name_kana = '高橋'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanaは不正な値です')
      end
    end
  end
end
