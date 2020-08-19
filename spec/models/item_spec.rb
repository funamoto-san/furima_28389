require 'rails_helper'

describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいく時' do
      it 'itemが存在していれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかない時' do
      it '画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がなければ出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が40文字を超えると出品できない' do
        @item.name = "123456789012345678901234567890123456789012345"
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品の説明がなければ出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '商品の説明が1000文字を超えると出品できない' do
        @item.explanation = Faker::Lorem.characters(number:1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it '価格がなければ出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が半角数字でなければ出品できない' do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で入力してください。")
      end
      it '価格が300~9999999の間でなければ出品できない' do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of range")
      end
      it 'categoryが---では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category は「---」以外を選択してください。")
      end
      it 'categoryがnilでは出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category は「---」以外を選択してください。")
      end
      it 'stateが---では出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State は「---」以外を選択してください。")
      end
      it 'stateがnilでは出品できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State は「---」以外を選択してください。")
      end
      it 'delivery_chargeが---では出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge は「---」以外を選択してください。")
      end
      it 'delivery_chargeがnilでは出品できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge は「---」以外を選択してください。")
      end
      it 'shipping_regionが---では出品できない' do
        @item.shipping_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region は「---」以外を選択してください。")
      end
      it 'shipping_regionがnilでは出品できない' do
        @item.shipping_region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region は「---」以外を選択してください。")
      end
      it 'shipping_dayが---では出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day は「---」以外を選択してください。")
      end
      it 'shipping_dayがnilでは出品できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day は「---」以外を選択してください。")
      end
    end
  end
end
