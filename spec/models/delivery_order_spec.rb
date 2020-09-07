require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  describe '商品購入機能' do
    before do
      @delivery_order = FactoryBot.build(:delivery_order)
    end

    context '商品購入が成功する場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@delivery_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @delivery_order.building = nil
        expect(@delivery_order).to be_valid
      end
    end

    context '商品購入が失敗する場合' do
      it 'postcodeが空だと保存できないこと' do
        @delivery_order.postcode = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @delivery_order.postcode = 11111111
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Postcode is invalid")
      end
      it 'postcodeがハイフンを含んだ8桁でないと保存できないこと' do
        @delivery_order.postcode = 1111-1111
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Postcode is the wrong length (should be 8 characters)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @delivery_order.prefecture_id = 1
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @delivery_order.city = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @delivery_order.block = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @delivery_order.phone_number = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @delivery_order.phone_number = '123456789012'
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが記号を含むと保存できないこと' do
        @delivery_order.phone_number = '03-12345678'
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end
end