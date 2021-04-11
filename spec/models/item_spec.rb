require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
   
    it "必要な情報を適切に入力すると、商品情報がデータベースに保存されること" do
      expect(@item).to be_valid
    end

    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が必須であること" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が必須であること" do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "カテゴリーの情報が必須であること" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it "商品の状態についての情報が必須であること" do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end

    it "配送料の負担についての情報が必須であること" do
      @item.shipping_free_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping free can't be blank", "Shipping free is not a number")
    end


    it "発送元の地域についての情報が必須であること" do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank", "Shipping area is not a number")
    end

    it "発送までの日数についての情報が必須であること" do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day is not a number")
    end

    it "販売価格についての情報が必須であること" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
    end

    it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること(¥300以下)" do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること(¥9,999,999以上)" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end


  end
end