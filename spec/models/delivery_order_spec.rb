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
    end

    context '商品購入が失敗する場合' do
      it 'postcodeが空だと保存できないこと' do
        @delivery_order.postcode = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @delivery_order.postcode = 1_1111_111
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postcodeが8桁以上(ハイフン含む)だと保存できないこと' do
        @delivery_order.postcode = 1111-1111
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("郵便番号は8文字で入力してください")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @delivery_order.prefecture_id = 1
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it 'cityが空だと保存できないこと' do
        @delivery_order.city = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空だと保存できないこと' do
        @delivery_order.block = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @delivery_order.phone_number = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @delivery_order.phone_number = '123456789012'
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it 'phone_numberが記号を含むと保存できないこと' do
        @delivery_order.phone_number = '03-12345678'
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include("電話番号は数値で入力してください")
      end
    end
  end
end
