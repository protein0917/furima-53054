require 'rails_helper'

RSpec.describe ManegementAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @manegement_address = FactoryBot.build(:manegement_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '登録ができる時' do
      it "全て入力すれば登録できること" do
        expect(@manegement_address).to be_valid
      end

      it "建物名がなくても登録できること" do
        @manegement_address.building_name = ''
        expect(@manegement_address).to be_valid
      end

      it "電話番号は11桁以内の数値のみ保存可能なこと(9桁)" do
        @manegement_address.phone_number = '123123412'
        expect(@manegement_address).to be_valid
      end
    end

    context '登録ができない時' do
      it "配送先の情報として、郵便番号が必須であること" do
        @manegement_address.post_code = ''
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it "配送先の情報として、都道府県が必須であること" do
        @manegement_address.shipping_area_id = 1
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it "配送先の情報として、市区町村が必須であること" do
        @manegement_address.city = ''
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("City can't be blank")
      end

      it "配送先の情報として、番地が必須であること" do
        @manegement_address.house_number = ''
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("House number can't be blank")
      end

      it "配送先の情報として、電話番号が必須であること" do
        @manegement_address.phone_number = ''
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it "郵便番号の保存にはハイフンが必要であること" do
        @manegement_address.post_code = '1234567'
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Post code is invalid")
      end

      it "電話番号は11桁以内の数値のみ保存可能なこと(12桁)" do
        @manegement_address.phone_number = '123123412345'
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @manegement_address.token = nil
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Token can't be blank")
      end

      it "電話番号は英数混合では登録できないこと" do
        @manegement_address.phone_number = '1231234aaaa'
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "user_idが無いと登録できないこと" do
        @manegement_address.user_id = nil
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが無いと登録できないこと" do
        @manegement_address.item_id = nil
        @manegement_address.valid?
        expect(@manegement_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end