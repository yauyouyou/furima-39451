require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context 'すべての条件を達成していれば出品できる' do
      it '正常に出品できること' do
        binding.pry
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'ユーザーが紐付いていない場合は出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image must be attached')
      end

      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explain can't be blank")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できないこと' do
        @item.category_id = 2
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is reserved")
      end

      it '商品の状態に「---」が選択されている場合は出品できないこと' do
        @item.item_condition_id = 2
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition is reserved")
      end

      it '配送料の負担に「---」が選択されている場合は出品できないこと' do
        @item.delivery_charge_id = 2
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is reserved")
      end

      it '発送元の地域に「---」が選択されている場合は出品できないこと' do
        @item.prefecture_id = 2
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is reserved")
      end

      it '発送までの日数に「---」が選択されている場合は出品できないこと' do
        @item.until_sendday_id = 2
        @item.valid?
        expect(@item.errors.full_messages).to include("Until sendday is reserved")
      end

      it '価格の情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300未満の場合は出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が¥9,999,999を超える場合は出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が半角数値でない場合は出品できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end