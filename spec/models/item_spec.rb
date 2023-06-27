require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品機能' do
    it '商品画像が必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image must be attached")
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

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態の情報が必須であること' do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it '配送料の負担の情報が必須であること' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it '発送元の地域の情報が必須であること' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数の情報が必須であること' do
      @item.until_sendday_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Until sendday can't be blank")
    end

    it '価格の情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が¥300未満の場合は出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格が¥9,999,999を超える場合は出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '価格が半角数値でない場合は出品できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end