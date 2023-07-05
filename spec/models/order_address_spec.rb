require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入機能' do
    context 'すべての条件を満たしていれば保存できる' do
      it '正常に保存できること' do
        expect(@order_address).to be_valid
      end
    end

    context '保存できない場合' do
      it '郵便番号が必須であること' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列でない場合は保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code must be in the format of 3 digits, hyphen, and 4 digits')
      end

      it '都道府県「---」が選択されている場合は出品できないこと' do
        @order_address.prefecture_id = 2
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture is reserved')
      end

      it '市区町村が必須であること' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が必須であること' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '建物名は任意であること' do
        @order_address.building_name = ''
        @order_address.post_code = '123-4567'
        @order_address.prefecture_id = 1
        @order_address.municipality = '東京都'
        @order_address.address = '渋谷区'
        @order_address.telephone_number = '0123456789'
        @order_address.user_id = '1'
        @order_address.item_id = '1'
        expect(@order_address).to be_valid
      end

      it '電話番号が必須であること' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が9桁以下では購入できないこと' do
        @order_address.telephone_number = '123456789' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number must be 10 to 11 digits and contain only numbers")
      end

      it '電話番号が12桁以上では購入できないこと' do
        @order_address.telephone_number = '123456789012' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number must be 10 to 11 digits and contain only numbers")
      end

      it '電話番号に半角数字以外が含まれている場合は購入できないこと' do
        @order_address.telephone_number = '123456789a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number must be 10 to 11 digits and contain only numbers")
      end

      it 'tokenが空では購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'userが紐付いていなければ購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
