require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
end


describe '出品情報の保存' do

  context "出品情報の保存ができる場合" do
    it "nameとpriceとexplanationとimageとcategory_idとstatus_idとburden_idとprefecture_idとshpping_days_idが存在すれば保存ができる" do
     expect(@item).to be_valid
  end
end

 context '出品情報の保存ができない場合' do
  it '画像が空だと保存できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

    it '商品名が空だと保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    
    end

    it '商品説明が空では保存できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーが空では保存できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が空では保存できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担が空では保存できない' do
      @item.burden_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it '発送元が空では保存できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数が空で保存できない' do
      @item.shipping_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end

    it '価格が空では保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が半角数字でないと保存できない' do
      @item.price = 'あA'
      @item.valid?
  
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    
    it '価格が¥300~¥9,999,999でないと保存できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '価格が¥300~¥9,999,999でないと保存できない' do
      @item.price = '10,000,000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
   end
 end
end