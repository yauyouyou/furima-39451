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
        expect(@order_address).to be_valid
      end

      it '電話番号が必須であること' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が10桁以上11桁以内の半角数値でない場合は保存できないこと' do
        @order_address.telephone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number must be 10 to 11 digits')
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
