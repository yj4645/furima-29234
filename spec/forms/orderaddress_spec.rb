require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address)
    end
 

  describe '購入情報の保存' do

  context '購入がうまくいくとき' do
    it 'クレジット情報と郵便番号と都道府県と市区町村と番地と電話番号が存在すれば購入できる' do
      expect(@order).to be_valid
    end
  end
    

    context '購入情報の保存ができない場合' do

      it 'クレジット情報が空だと保存できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が空だと保存できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空だと保存できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号にハイフンがないと保存できない' do
        @order.postal_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code ハイフンを使用してください")
      end

      it '電話番号にハイフンが含まれると保存できない' do
        @order.phone_number = '1234-45-6789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number ハイフンは使用しないでください")
      end

      it '電話番号が11桁以上だと保存できない' do
        @order.phone_number = '1234-4567-6789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number ハイフンは使用しないでください")
      end

    end
  end
end
  
