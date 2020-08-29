require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end
    it 'tokenが空では購入できないこと' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @item_order.postal_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_order.postal_code = 4670078
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code is invalid")
    end
    it 'shipping_region_idが1では登録できないこと' do
      @item_order.shipping_region_id = 1
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Shipping region must be other than 1")
    end
    it 'cityが空では保存できないこと' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では保存できないこと' do
      @item_order.house_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'tel_numberが空では保存できないこと' do
      @item_order.tel_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Tel number can't be blank")
    end
    it 'tel_numberが半角数字でないと保存できないこと' do
      @item_order.tel_number = '０９０１２３４５６７８'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Tel number is invalid")
    end
    it 'tel_numberがハイフンを含むと保存できないこと' do
      @item_order.tel_number = '090-1234-5678'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Tel number is invalid")
    end
  end
end
